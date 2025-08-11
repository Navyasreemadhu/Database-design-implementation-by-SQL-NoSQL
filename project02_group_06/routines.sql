

-- ROUTINES: PROCEDURES AND FUNCTIONS

-- 1. PROCEDURE: Add a new appointment
DELIMITER //
CREATE PROCEDURE AddAppointment(
    IN p_appointment_id CHAR(100),
    IN p_patient_id CHAR(100),
    IN p_doctor_id CHAR(4),
    IN p_payment_id CHAR(100),
    IN p_date DATE,
    IN p_time TIME,
    IN p_status CHAR(9)
)
BEGIN
    INSERT INTO Appointment (
        appointment_id, patient_id, doctor_id, payment_id,
        date_of_appointment, time, status
    )
    VALUES (
        p_appointment_id, p_patient_id, p_doctor_id,
        p_payment_id, p_date, p_time, p_status
    );
END;
//
DELIMITER ;

-- 2. PROCEDURE: Assign a diagnosis to a patient
DELIMITER //
CREATE PROCEDURE AssignDiagnosisToPatient(
    IN p_diagnosis_id CHAR(100),
    IN p_diagnosis_name VARCHAR(45),
    IN p_patient_id CHAR(100)
)
BEGIN
    INSERT INTO Diagnosis (diagnosis_id, diagnosis_name)
    VALUES (p_diagnosis_id, p_diagnosis_name)
    ON DUPLICATE KEY UPDATE diagnosis_name = p_diagnosis_name;

    INSERT INTO Diagnosis_Patient (diagnosis_id, patient_id)
    VALUES (p_diagnosis_id, p_patient_id);
END;
//
DELIMITER ;

-- 3. FUNCTION: Calculate total payment made by a patient
DELIMITER //
CREATE FUNCTION GetTotalPaidByPatient(p_patient_id CHAR(100))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(pay.amount) INTO total
    FROM Payments pay
    JOIN Appointment app ON app.payment_id = pay.payment_id
    WHERE app.patient_id = p_patient_id AND pay.payment_status = 1;
    
    RETURN IFNULL(total, 0);
END;
//
DELIMITER ;
