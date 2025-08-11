

-- MULTIPLE TABLE QUERIES: multiple_table.sql

-- 1. INNER JOIN with associative and two related tables

-- List all patients with their prescribed medicines
SELECT p.first_name, p.last_name, m.medicine_name
FROM Patient_Medicine pm
INNER JOIN Patient p ON pm.patient_id = p.patient_id
INNER JOIN Medicine m ON pm.medicine_id = m.medicine_id;

-- 2. LEFT OUTER JOIN

-- Show patients and any appointments they have (even if none)
SELECT p.patient_id, p.first_name, a.appointment_id, a.status
FROM Patient p
LEFT OUTER JOIN Appointment a ON p.patient_id = a.patient_id;

-- 3. SET OPERATION

-- List all distinct emails from patients and doctors
SELECT email FROM Patient
UNION
SELECT email FROM Doctors;

-- 4. SUBQUERY + MULTI-ROW OPERATION

-- Find patients who were prescribed same medicine as 'pa2'
SELECT DISTINCT p.first_name, p.last_name
FROM Patient p
WHERE p.patient_id IN (
    SELECT pm2.patient_id
    FROM Patient_Medicine pm1
    JOIN Patient_Medicine pm2 ON pm1.medicine_id = pm2.medicine_id
    WHERE pm1.patient_id = 'pa2' AND pm2.patient_id != 'pa2'
);

-- 5. DERIVED TABLE using WITH

-- Doctors with more than 1 shift assigned
WITH DoctorShiftCounts AS (
    SELECT doctor_id, COUNT(shift_id) AS shift_count
    FROM Doctors_Shifts
    GROUP BY doctor_id
)
SELECT d.first_name, d.last_name, ds.shift_count
FROM DoctorShiftCounts ds
JOIN Doctors d ON d.doctor_id = ds.doctor_id
WHERE ds.shift_count > 1;
