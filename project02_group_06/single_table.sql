
-- SINGLE TABLE QUERIES: single_table.sql


-- 1. PATIENT TABLE – Use of Single Row Function

-- Convert patient names to UPPERCASE
SELECT UPPER(first_name) AS first_name_upper, UPPER(last_name) AS last_name_upper
FROM Patient;

-- 2. PAYMENTS TABLE – Use of Aggregate Function

-- Calculate total payments collected
SELECT SUM(amount) AS total_collected
FROM Payments
WHERE payment_status = 1;

-- 3. DOCTORS TABLE – Sorted Results

-- List doctors ordered by specialization
SELECT doctor_id, first_name, last_name, specialization
FROM Doctors
ORDER BY specialization ASC;

-- 4. MEDICINE TABLE – First N Results

-- Get top 3 medicines listed in the system
SELECT *
FROM Medicine
LIMIT 3;

-- 5. APPOINTMENT TABLE – Use of Selection Control Function

-- Show readable status using CASE
SELECT appointment_id, 
       CASE 
           WHEN status = 'Completed' THEN 'Finished'
           WHEN status = 'Cancelled' THEN 'Did Not Happen'
           ELSE 'Upcoming'
       END AS readable_status
FROM Appointment;
