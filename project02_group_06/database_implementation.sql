CREATE DATABASE project2;

USE project2;

-- DATABASE IMPLEMENTATION


-- 1. PATIENT TABLE

CREATE TABLE Patient (
    patient_id CHAR(100) PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    mobile CHAR(10),
    address VARCHAR(200),
    email VARCHAR(45),
    gender CHAR(6),
    date_of_birth DATE
);


INSERT INTO Patient VALUES 
('pa1', 'Alok', 'Singh', '9237767898', '10 street', 'ak@gmail.com', 'Male', '2009-02-03'),
('pa2', 'Mani', 'Reddy', '9534567200', '12 street', 'mr@gmail.com', 'Female', '1992-08-05'),
('pa3', 'Ratan', 'Tagore', '9134562398', '14 downtown', 'rt@gmail.com', 'Male', '2001-03-14'),
('pa4', 'Kia', 'Prasad', '9034567854', '15 westside', 'kps@gmail.com', 'Female', '1999-09-13'),
('pa5', 'Suzy', 'Brian', '9231867808', '16 eastzone', 'sb@gmail.com', 'Female', '2002-04-14'),
('pa6', 'Lane', 'Dety', '9362867808', '17 downtown', 'popt@gmail.com', 'Male', '2006-04-15'),
('pa7', 'Kane', 'Loy', '9231899808', '18 downtown', 'Kalo@gmail.com', 'Male', '2002-04-16');

-- Create Doctors table

CREATE TABLE Doctors (
    doctor_id CHAR(4) PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    license_no VARCHAR(10),
    phone_no CHAR(10),
    email VARCHAR(100),
    specialization CHAR(15),
    qualification CHAR(5)
);

-- Insert sample doctors
INSERT INTO Doctors VALUES 
('doc1', 'Liam', 'Sloan', '1h567', '6237767897', 'lop@gmail.com', 'Cardiologist', 'MD'),
('doc2', 'Hari', 'Sloan', '2j98', '5534569200', 'mop@gmail.com', 'Dentist', 'MBBS'),
('doc3', 'Kozy', 'Mohan', 'rt567', '8134562323', 'top@gmail.com', 'Neurologist', 'MD'),
('doc4', 'Panni', 'Davis', 'kt321', '2034567887', 'lyvt@gmail.com', 'Opthalmologist', 'MD'),
('doc5', 'Jagdish', 'Srini', 'po987', '3231867809', 'joj@gmail.com', 'Paeditrician', 'MBBS'),
('doc6', 'Sanjay', 'Davis', 'sa9865', '2121867809', 'sasj@gmail.com', 'neurOrthopaedic', 'MBBS');

-- Create Appointment table

CREATE TABLE Appointment (
    appointment_id CHAR(100) PRIMARY KEY,
    patient_id CHAR(100),
    doctor_id CHAR(4),
    payment_id CHAR(100),
    date_of_appointment DATE,
    time TIME,
    status CHAR(9),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (payment_id) REFERENCES Payments(payment_id)
);

-- Insert sample appointments

INSERT INTO Appointment VALUES 
('app1', 'pa2', 'doc1', 'pay1', '2025-02-02', '17:05:00', 'Completed'),
('app2', 'pa1', 'doc2', NULL, '2025-02-12', '14:05:00', 'Cancelled'),
('app3', 'pa2', 'doc3', 'pay2', '2025-02-12', '09:05:00', 'Completed'),
('app4', 'pa5', 'doc3', 'pay3', '2025-02-13', '10:05:00', 'Completed'),
('app5', 'pa3', 'doc4', 'pay4', '2025-02-14', '15:05:00', 'Completed'),
('app6', 'pa4', 'doc3', 'pay5', '2025-02-15', '08:05:00', 'Scheduled'),
('app7', 'pa6', 'doc6', 'pay6', '2025-02-16', '17:05:00', 'Scheduled'),
('app8', 'pa7', 'doc6', 'pay7', '2025-02-17', '09:05:00', 'Scheduled');


-- Create Payments table

CREATE TABLE Payments (
    payment_id CHAR(100) PRIMARY KEY,
    amount DECIMAL(6,2),
    payment_method VARCHAR(45),
    payment_status TINYINT
);


-- Insert sample payments

INSERT INTO Payments VALUES
('pay1', 200.78, 'Credit', 1),
('pay2', 300.56, 'Credit', 0),
('pay3', 200.22, 'Cash', 1),
('pay4', 300.45, 'Insurance', 0),
('pay5', 250.55, 'Cash', 1),
('pay6', 500.78, 'Insurance', 1),
('pay7', 600.66, 'Cash', 1);


-- Create Medicine table

CREATE TABLE Medicine (
    medicine_id CHAR(255) PRIMARY KEY,
    medicine_name VARCHAR(45),
    prescription_required TINYINT
);

-- Insert sample medicines

INSERT INTO Medicine VALUES 
('med1', 'Ciproflaxic', 0),
('med2', 'Nitrofurantoin', 1),
('med3', 'Allegra', 1),
('med4', 'Clopivas', 0),
('med5', 'Vaxnoc', 1);


-- Create Diagnosis table

CREATE TABLE Diagnosis (
    diagnosis_id CHAR(100) PRIMARY KEY,
    diagnosis_name VARCHAR(45)
);

-- Insert sample diagnoses

INSERT INTO Diagnosis VALUES
('diag1', 'Heart Blockage'),
('diag2', 'Aneurysm'),
('diag3', 'Cataract'),
('diag4', 'Molar uproot'),
('diag5', 'Fever'),
('diag6', 'Angina'),
('diag7', 'Fracture and nerve damage');



-- Create Hospital table

CREATE TABLE Hospital (
    hospital_id CHAR(5) PRIMARY KEY,
    hospital_name VARCHAR(100),
    phone_no CHAR(10),
    address VARCHAR(100),
    email VARCHAR(100)
);

-- Insert sample hospitals

INSERT INTO Hospital VALUES
('hosp1', 'AA medical hospital', '2007767897', '10 street', 'aam@gmail.com'),
('hosp2', 'BB medical hospital', '3007767897', '15 westside', 'bbm@gmail.com'),
('hosp3', 'CC medical hospital', '4007767897', '12 eastcoast', 'ccm@gmail.com');



-- Create Shifts table

CREATE TABLE Shifts (
    shift_id CHAR(3) PRIMARY KEY,
    shift_name CHAR(10)
);

-- Insert sample shifts

INSERT INTO Shifts VALUES
('sh1', 'morning'),
('sh2', 'afternoon'),
('sh3', 'evening');


-- Create Department table

CREATE TABLE Department (
    department_id CHAR(5) PRIMARY KEY,
    department_name VARCHAR(45)
);

-- Insert sample departments

INSERT INTO Department VALUES
('dept1', 'Cardiology'),
('dept2', 'Neurology'),
('dept3', 'Opthamology'),
('dept4', 'Dentistry'),
('dept5', 'Orthopaedic'),
('dept6', 'Paeditrician');


-- Create Patient_Medicine table

CREATE TABLE Patient_Medicine (
    patient_id CHAR(100),
    medicine_id CHAR(255),
    PRIMARY KEY (patient_id, medicine_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);

-- Insert data into Patient_Medicine

INSERT INTO Patient_Medicine VALUES
('pa2', 'med1'),
('pa2', 'med2'),
('pa6', 'med2'),
('pa7', 'med5'),
('pa3', 'med2'),
('pa4', 'med1'),
('pa5', 'med4'),
('pa6', 'med5');


-- Create Diagnosis_Patient table

CREATE TABLE Diagnosis_Patient (
    diagnosis_id CHAR(100),
    patient_id CHAR(100),
    PRIMARY KEY (diagnosis_id, patient_id),
    FOREIGN KEY (diagnosis_id) REFERENCES Diagnosis(diagnosis_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Insert data into Diagnosis_Patient

INSERT INTO Diagnosis_Patient VALUES
('diag1', 'pa2'),
('diag6', 'pa2'),
('diag2', 'pa4'),
('diag2', 'pa5'),
('diag3', 'pa3'),
('diag7', 'pa6'),
('diag7', 'pa7');


-- Create Hospital_Doctors table

CREATE TABLE Hospital_Doctors (
    hospital_id CHAR(5),
    doctor_id CHAR(4),
    PRIMARY KEY (hospital_id, doctor_id),
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Insert data into Hospital_Doctors

INSERT INTO Hospital_Doctors VALUES
('hosp1', 'doc1'),
('hosp1', 'doc4'),
('hosp2', 'doc2'),
('hosp2', 'doc5'),
('hosp2', 'doc6'),
('hosp3', 'doc3'),
('hosp3', 'doc6');


-- Create Doctors_Shifts table

CREATE TABLE Doctors_Shifts (
    doctor_id CHAR(4),
    shift_id CHAR(3),
    PRIMARY KEY (doctor_id, shift_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (shift_id) REFERENCES Shifts(shift_id)
);

-- Insert data into Doctors_Shifts

INSERT INTO Doctors_Shifts VALUES
('doc1', 'sh3'),
('doc2', 'sh2'),
('doc3', 'sh1'),
('doc4', 'sh2'),
('doc5', 'sh3'),
('doc6', 'sh3'),
('doc6', 'sh1');


-- Create Department_Hospital table

CREATE TABLE Department_Hospital (
    hospital_id CHAR(5),
    department_id CHAR(5),
    PRIMARY KEY (hospital_id, department_id),
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Insert data into Department_Hospital

INSERT INTO Department_Hospital VALUES
('hosp1', 'dept1'),
('hosp3', 'dept2'),
('hosp1', 'dept3'),
('hosp2', 'dept4'),
('hosp2', 'dept5'),
('hosp2', 'dept6');


