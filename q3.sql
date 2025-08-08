BEGIN;
INSERT INTO patients (patient_id, patient_name, age,gender,admitted_date) VALUES (3,'jon doe', 21,'male','2023-12-12',1,2);
SELECT * FROM patients;
ROLLBACK;
select * from patients;
