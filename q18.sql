START TRANSACTION;

SELECT * FROM patient WHERE patient_id = 1 FOR UPDATE;

SELECT 'Waiting for doctors lock...' as status;

SELECT * FROM doctor WHERE doctor_id = 1 FOR UPDATE;

START TRANSACTION;

SELECT * FROM doctor WHERE doctor_id = 1 FOR UPDATE;

SELECT 'Waiting for patients lock...' as status;

SELECT * FROM patient WHERE patient_id = 1 FOR UPDATE;

commit;
