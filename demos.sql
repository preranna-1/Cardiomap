INSERT INTO HEALTHCARE_CENTER 
(CenterID, Name, Address, PhoneNumbers, Email, Latitude, Longitude, OperatingHours, OverallRating, CenterType)
VALUES

-- Hospitals (12)
('HC001','Dhaka Heart Hospital','Dhaka','01711111111','heart1@mail.com',23.8103,90.4125,'24/7',4.5,'Hospital'),
('HC002','National Cardiac Institute','Dhaka','01711111112','heart2@mail.com',23.8110,90.4130,'24/7',4.7,'Hospital'),
('HC003','Green Life Hospital','Dhaka','01711111113','heart3@mail.com',23.8120,90.4140,'24/7',4.3,'Hospital'),
('HC004','United Hospital','Dhaka','01711111114','heart4@mail.com',23.8130,90.4150,'24/7',4.6,'Hospital'),
('HC005','Square Hospital','Dhaka','01711111115','heart5@mail.com',23.8140,90.4160,'24/7',4.8,'Hospital'),
('HC006','Ibn Sina Hospital','Dhaka','01711111116','heart6@mail.com',23.8150,90.4170,'24/7',4.2,'Hospital'),
('HC007','Apollo Hospital','Dhaka','01711111117','heart7@mail.com',23.8160,90.4180,'24/7',4.7,'Hospital'),
('HC008','Labaid Hospital','Dhaka','01711111118','heart8@mail.com',23.8170,90.4190,'24/7',4.4,'Hospital'),
('HC009','Popular Hospital','Dhaka','01711111119','heart9@mail.com',23.8180,90.4200,'24/7',4.3,'Hospital'),
('HC010','Central Hospital','Dhaka','01711111120','heart10@mail.com',23.8190,90.4210,'24/7',4.1,'Hospital'),
('HC011','City Hospital','Dhaka','01711111121','heart11@mail.com',23.8200,90.4220,'24/7',4.0,'Hospital'),
('HC012','Care Medical College','Dhaka','01711111122','heart12@mail.com',23.8210,90.4230,'24/7',4.2,'Hospital'),

-- Diagnostic Centers (6)
('HC013','Popular Diagnostic Center','Dhaka','01711111123','diag1@mail.com',23.8220,90.4240,'8AM-10PM',4.5,'Diagnostic'),
('HC014','Ibn Sina Diagnostic','Dhaka','01711111124','diag2@mail.com',23.8230,90.4250,'8AM-10PM',4.4,'Diagnostic'),
('HC015','LabAid Diagnostic','Dhaka','01711111125','diag3@mail.com',23.8240,90.4260,'8AM-10PM',4.3,'Diagnostic'),
('HC016','Medinova Diagnostic','Dhaka','01711111126','diag4@mail.com',23.8250,90.4270,'8AM-10PM',4.2,'Diagnostic'),
('HC017','Biomed Diagnostic','Dhaka','01711111127','diag5@mail.com',23.8260,90.4280,'8AM-10PM',4.1,'Diagnostic'),
('HC018','City Diagnostic','Dhaka','01711111128','diag6@mail.com',23.8270,90.4290,'8AM-10PM',4.0,'Diagnostic'),

-- Rehab Centers (6)
('HC019','Life Rehab Center','Dhaka','01711111129','rehab1@mail.com',23.8280,90.4300,'9AM-6PM',4.2,'Rehab'),
('HC020','Hope Rehab Center','Dhaka','01711111130','rehab2@mail.com',23.8290,90.4310,'9AM-6PM',4.3,'Rehab'),
('HC021','Care Rehab','Dhaka','01711111131','rehab3@mail.com',23.8300,90.4320,'9AM-6PM',4.1,'Rehab'),
('HC022','Better Life Rehab','Dhaka','01711111132','rehab4@mail.com',23.8310,90.4330,'9AM-6PM',4.4,'Rehab'),
('HC023','Neuro Rehab Center','Dhaka','01711111133','rehab5@mail.com',23.8320,90.4340,'9AM-6PM',4.5,'Rehab'),
('HC024','Stroke Recovery Center','Dhaka','01711111134','rehab6@mail.com',23.8330,90.4350,'9AM-6PM',4.3,'Rehab'),

-- Pharmacies (6)
('HC025','City Pharmacy','Dhaka','01711111135','pharma1@mail.com',23.8340,90.4360,'24/7',4.2,'Pharmacy'),
('HC026','Care Pharmacy','Dhaka','01711111136','pharma2@mail.com',23.8350,90.4370,'24/7',4.3,'Pharmacy'),
('HC027','Life Pharmacy','Dhaka','01711111137','pharma3@mail.com',23.8360,90.4380,'24/7',4.1,'Pharmacy'),
('HC028','Trust Pharmacy','Dhaka','01711111138','pharma4@mail.com',23.8370,90.4390,'24/7',4.0,'Pharmacy'),
('HC029','Well Pharmacy','Dhaka','01711111139','pharma5@mail.com',23.8380,90.4400,'24/7',4.4,'Pharmacy'),
('HC030','Green Pharmacy','Dhaka','01711111140','pharma6@mail.com',23.8390,90.4410,'24/7',4.2,'Pharmacy');



INSERT INTO HOSPITAL 
(CenterID, TotalBeds, ICUBeds, EmergencyAvailable, SpecializationType)
VALUES
('HC001',250,30,TRUE,'Cardiology'),
('HC002',300,40,TRUE,'Cardiology'),
('HC003',220,25,TRUE,'Cardiology'),
('HC004',280,35,TRUE,'Cardiology'),
('HC005',350,50,TRUE,'Cardiology'),
('HC006',200,20,TRUE,'Cardiology'),
('HC007',320,45,TRUE,'Cardiology'),
('HC008',260,30,TRUE,'Cardiology'),
('HC009',240,28,TRUE,'Cardiology'),
('HC010',210,22,TRUE,'Cardiology'),
('HC011',190,18,TRUE,'Cardiology'),
('HC012',230,26,TRUE,'Cardiology');



INSERT INTO DIAGNOSTIC_CENTER
(CenterID, TestsOffered, ReportTurnAroundHours, EmergencyAvailable)
VALUES
('HC013','ECG, Blood Test, MRI',24,TRUE),
('HC014','ECG, Blood Test, CT Scan',24,TRUE),
('HC015','ECG, X-Ray, MRI',24,TRUE),
('HC016','Blood Test, CT Scan',24,FALSE),
('HC017','MRI, Ultrasound',24,TRUE),
('HC018','ECG, Blood Test',24,FALSE);


INSERT INTO REHAB_CENTER
(CenterID, TherapyTypes, ProgramDuration)
VALUES
('HC019','Physiotherapy, Stroke Rehab','3 Months'),
('HC020','Cardiac Rehab, Physiotherapy','4 Months'),
('HC021','Stroke Rehab','3 Months'),
('HC022','Physiotherapy','2 Months'),
('HC023','Neuro Rehab','5 Months'),
('HC024','Stroke Recovery','3 Months');


INSERT INTO PHARMACY
(CenterID, Is24Hours, DeliversMedicine, HasMedicine)
VALUES
('HC025',TRUE,TRUE,TRUE),
('HC026',TRUE,TRUE,TRUE),
('HC027',TRUE,FALSE,TRUE),
('HC028',TRUE,TRUE,TRUE),
('HC029',TRUE,FALSE,TRUE),
('HC030',TRUE,TRUE,TRUE);


INSERT INTO PROFILE
(ProfileID, FirstName, LastName, Street, City, PostalCode, Phone, Email, PasswordHash, Role)
VALUES
(1,'Rahim','Ahmed','Dhanmondi','Dhaka','1205','01710000001','rahim@mail.com','hash1','Patient'),
(2,'Karim','Hossain','Gulshan','Dhaka','1212','01710000002','karim@mail.com','hash2','Patient'),
(3,'Ayesha','Rahman','Mirpur','Dhaka','1216','01710000003','ayesha@mail.com','hash3','Patient'),
(4,'Nusrat','Jahan','Uttara','Dhaka','1230','01710000004','nusrat@mail.com','hash4','Patient'),
(5,'Sabbir','Ali','Mohammadpur','Dhaka','1207','01710000005','sabbir@mail.com','hash5','Patient'),
(6,'Tanvir','Islam','Badda','Dhaka','1212','01710000006','tanvir@mail.com','hash6','Patient'),
(7,'Mim','Akter','Rampura','Dhaka','1219','01710000007','mim@mail.com','hash7','Patient'),
(8,'Hasan','Mahmud','Banani','Dhaka','1213','01710000008','hasan@mail.com','hash8','Patient'),
(9,'Rafi','Khan','Tejgaon','Dhaka','1208','01710000009','rafi@mail.com','hash9','Patient'),
(10,'Sumaiya','Islam','Farmgate','Dhaka','1215','01710000010','sumaiya@mail.com','hash10','Patient'),

-- Data Managers
(11,'Admin','One','Gulshan','Dhaka','1212','01710000011','admin1@mail.com','hash11','Manager'),
(12,'Admin','Two','Banani','Dhaka','1213','01710000012','admin2@mail.com','hash12','Manager'),
(13,'Admin','Three','Uttara','Dhaka','1230','01710000013','admin3@mail.com','hash13','Manager'),
(14,'Admin','Four','Dhanmondi','Dhaka','1205','01710000014','admin4@mail.com','hash14','Manager'),
(15,'Admin','Five','Mirpur','Dhaka','1216','01710000015','admin5@mail.com','hash15','Manager');



INSERT INTO PATIENT
(PatientID, UserID, DOB, Gender, BloodGroup, DiseaseType)
VALUES
(1,1,'1998-05-10','Male','A+','Heart Disease'),
(2,2,'1995-08-15','Male','B+','Stroke'),
(3,3,'2000-02-20','Female','O+','Cardiac Arrest'),
(4,4,'1997-07-25','Female','AB+','Hypertension'),
(5,5,'1993-12-05','Male','A-','Heart Disease'),
(6,6,'1999-03-18','Male','B-','Stroke'),
(7,7,'2001-06-22','Female','O-','Cardiac Issue'),
(8,8,'1994-11-30','Male','A+','Heart Disease'),
(9,9,'1996-09-14','Male','B+','Stroke'),
(10,10,'1998-01-01','Female','O+','Hypertension');


INSERT INTO DATA_MANAGER
(ManagerID, UserID, CenterID)
VALUES
(1,11,'HC001'),
(2,12,'HC005'),
(3,13,'HC010'),
(4,14,'HC013'),
(5,15,'HC019');

INSERT INTO EMERGENCY_CONTACT
(ContactID, UserID, FirstName, LastName, Phone)
VALUES
(1,1,'Salma','Begum','01810000001'),
(2,2,'Jamal','Uddin','01810000002'),
(3,3,'Rokeya','Begum','01810000003'),
(4,4,'Kamal','Hossain','01810000004'),
(5,5,'Fatema','Khatun','01810000005');


INSERT INTO PATIENT_CONTACT_LINK
(PatientID, ContactID, RelationToPatient)
VALUES
(1,1,'Mother'),
(2,2,'Father'),
(3,3,'Mother'),
(4,4,'Brother'),
(5,5,'Wife');


