// db.js
// This file connects Node.js to your MySQL database
// You only need to change the password below
 
const mysql = require('mysql2');
 
const db = mysql.createConnection({
  host: 'localhost',       // your MySQL is on your own computer
  port: 3307,  
  user: 'root',            // default MySQL username
  password: '123456',  // ← CHANGE THIS to your MySQL password
  database: 'cardiomap'  // the database name from your SQL file
});
 
db.connect((err) => {
  if (err) {
    console.log('❌ Database connection failed:', err.message);
    return;
  }
  console.log('✅ Connected to MySQL database!');
});
 
module.exports = db;