const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const bcrypt = require('bcrypt');
const path = require('path');

const app = express();
app.use(cors());
app.use(express.json());

// Serve static files from the folder where your HTML files live
app.use(express.static('public-HEHE'));

// ------------------------------
// Database setup with fallback mock data
// ------------------------------
let db = null;
let useMockData = false;

try {
  db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'hospital_db',
    port: 3306
  });

  db.connect(err => {
    if (err) {
      console.log('⚠️ MySQL not available, using MOCK DATA mode');
      useMockData = true;
      db = null;
    } else {
      console.log('✅ Connected to hospital_db');
    }
  });
} catch (error) {
  console.log('⚠️ MySQL connection error, using MOCK DATA mode');
  useMockData = true;
}

// Helper to create tables if needed (only when DB is real)
function createTablesIfNeeded() {
  if (!db || useMockData) return;
  const createProfile = `
    CREATE TABLE IF NOT EXISTS PROFILE (
      ProfileID INT AUTO_INCREMENT PRIMARY KEY,
      FirstName VARCHAR(100),
      LastName VARCHAR(100),
      Email VARCHAR(255) UNIQUE,
      PasswordHash VARCHAR(255),
      Role VARCHAR(50),
      Phone VARCHAR(20),
      Street VARCHAR(255),
      City VARCHAR(100),
      PostalCode VARCHAR(20)
    )`;
  db.query(createProfile, (err) => {
    if (err) console.log('Profile table check error:', err.message);
  });
  const createPatient = `
    CREATE TABLE IF NOT EXISTS PATIENT (
      PatientID INT AUTO_INCREMENT PRIMARY KEY,
      UserID INT,
      DOB DATE,
      Gender VARCHAR(20),
      BloodGroup VARCHAR(5),
      DiseaseType VARCHAR(100)
    )`;
  db.query(createPatient, (err) => {
    if (err) console.log('Patient table check error:', err.message);
  });
}
createTablesIfNeeded();

// ------------------------------
// API ROUTES (matching frontend)
// ------------------------------

// 1. LOGIN
app.post('/api/login', (req, res) => {
  const { email, password } = req.body;
  if (useMockData) {
    // Accept any non-empty email/password for demo
    if (email && password) {
      return res.json({
        success: true,
        user: {
          ProfileID: 123,
          FirstName: 'Demo',
          LastName: 'User',
          Email: email,
          Role: 'patient',
          Phone: '01700000000',
          City: 'Chittagong'
        }
      });
    } else {
      return res.json({ success: false, message: 'Invalid credentials' });
    }
  }

  const sql = 'SELECT * FROM PROFILE WHERE Email = ?';
  db.query(sql, [email], async (err, results) => {
    if (err) return res.status(500).json({ success: false, message: err.message });
    if (results.length === 0) return res.json({ success: false, message: 'User not found' });
    const user = results[0];
    const match = await bcrypt.compare(password, user.PasswordHash);
    if (!match) return res.json({ success: false, message: 'Invalid password' });
    delete user.PasswordHash;
    res.json({ success: true, user });
  });
});

// 2. REGISTER
app.post('/api/register', async (req, res) => {
  const { firstName, lastName, email, password, role, phone, street, city, postalCode } = req.body;

  if (useMockData) {
    return res.json({ success: true, profileID: Math.floor(Math.random() * 10000) });
  }

  try {
    const hashed = await bcrypt.hash(password, 10);
    const sql = `INSERT INTO PROFILE (FirstName, LastName, Email, PasswordHash, Role, Phone, Street, City, PostalCode)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    db.query(sql, [firstName, lastName, email, hashed, role, phone, street, city, postalCode], (err, result) => {
      if (err) return res.status(500).json({ success: false, message: err.message });
      res.json({ success: true, profileID: result.insertId });
    });
  } catch (err) {
    res.status(500).json({ success: false, message: 'Registration failed' });
  }
});

// 3. ADD PATIENT DETAILS
app.post('/api/add-patient', (req, res) => {
  const { userID, dob, gender, bloodGroup, diseaseType } = req.body;
  if (useMockData) {
    return res.json({ success: true });
  }
  const sql = `INSERT INTO PATIENT (UserID, DOB, Gender, BloodGroup, DiseaseType) VALUES (?, ?, ?, ?, ?)`;
  db.query(sql, [userID, dob, gender, bloodGroup, diseaseType], (err) => {
    if (err) return res.status(500).json({ success: false, message: err.message });
    res.json({ success: true });
  });
});

// 4. ADD EMERGENCY CONTACT
app.post('/api/add-emergency-contact', (req, res) => {
  const { userID, firstName, lastName, phone } = req.body;
  if (useMockData) {
    return res.json({ success: true });
  }
  const sql = `INSERT INTO EMERGENCY_CONTACT (UserID, FirstName, LastName, Phone) VALUES (?, ?, ?, ?)`;
  db.query(sql, [userID, firstName, lastName, phone], (err) => {
    if (err) return res.status(500).json({ success: false, message: err.message });
    res.json({ success: true });
  });
});

// 5. GET HEALTHCARE CENTERS (for map)
app.get('/api/centers', (req, res) => {
  if (useMockData) {
    return res.json([
      { CenterID: 'C001', Name: 'Chittagong Medical College Hospital', Address: 'K.B. Fazlul Kader Rd', PhoneNumbers: '031-630226', Email: 'cmch@hospital.com', CenterType: 'Hospital', OperatingHours: '24/7', Latitude: 22.3384, Longitude: 91.8317, TotalBeds: 500, ICUBeds: 42 },
      { CenterID: 'C002', Name: 'Parkview Hospital', Address: 'Muradpur', PhoneNumbers: '031-711111', Email: 'parkview@hospital.com', CenterType: 'Hospital', OperatingHours: '24/7', Latitude: 22.3632, Longitude: 91.8201, TotalBeds: 200, ICUBeds: 18 }
    ]);
  }
  const sql = `SELECT hc.*, h.TotalBeds, h.ICUBeds FROM HEALTHCARE_CENTER hc LEFT JOIN HOSPITAL h ON hc.CenterID = h.CenterID`;
  db.query(sql, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

// 6. FILTER BY HEART / STROKE
app.get('/api/filter-by-disease', (req, res) => {
  const { diseaseType } = req.query;
  if (useMockData) {
    return res.json([
      { CenterID: 'C001', Name: 'Chittagong Medical College Hospital', CenterType: 'Hospital', Latitude: 22.3384, Longitude: 91.8317 }
    ]);
  }
  let disease = diseaseType === 'heart' ? 'Heart Disease' : 'Stroke';
  const sql = `
    SELECT DISTINCT hc.* FROM HEALTHCARE_CENTER hc
    JOIN CENTERDISEASE_CATEGORY cdc ON hc.CenterID = cdc.CenterID
    JOIN DISEASE_CATEGORY dc ON cdc.DCID = dc.DCID
    WHERE dc.Name LIKE ? AND hc.CenterType = 'Hospital'
  `;
  db.query(sql, [`%${disease}%`], (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

// 7. BOOKING ENDPOINTS (placeholder to avoid 404)
app.post('/api/bookings', (req, res) => {
  res.json({ success: true, message: 'Booking feature coming soon' });
});
app.post('/api/book-bed', (req, res) => {
  res.json({ success: true, message: 'Bed booking coming soon' });
});
app.post('/api/request-ambulance', (req, res) => {
  res.json({ success: true, message: 'Ambulance request coming soon' });
});

// ------------------------------
// Serve the frontend (catch-all for SPA)
// ------------------------------
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public-HEHE', 'index.html'));
});
app.get('/map.html', (req, res) => {
  res.sendFile(path.join(__dirname, 'public-HEHE', 'map.html'));
});

// ------------------------------
// START SERVER
// ------------------------------
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
  console.log(`📁 Serving static files from: public-HEHE`);
  if (useMockData) console.log('⚠️ Running in MOCK DATA mode (no database required)');
});