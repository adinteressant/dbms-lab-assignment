start TRANSACTION;

SELECT * FROM patient WHERE patient_id = 1 FOR UPDATE;

UPDATE patient SET patient_name = 'LockedUpdate' WHERE patient_id = 1;

COMMIT;

START TRANSACTION;

SELECT * FROM doctor WHERE doctor_id = 1 FOR SHARE;

SELECT specialization FROM doctor WHERE doctor_id = 1;

COMMIT;
