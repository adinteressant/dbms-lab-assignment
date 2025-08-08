--1nf

create table hospital_info_1nf(
  patient_id int primary key,
  patient_name text,
  doctor_id int,
  doctor_name text,
  department_name text,
  appointment_date date
);


--2nf
CREATE TABLE patients_2nf (
    patient_id INT PRIMARY KEY,
    patient_name TEXT NOT NULL
);

CREATE TABLE doctors_2nf (
    doctor_id INT PRIMARY KEY,
    doctor_name TEXT NOT NULL,
    department_name TEXT NOT NULL
);

CREATE TABLE appointments_2nf (
    patient_id INT,
    doctor_id INT,
    appointment_date DATE NOT NULL,
    PRIMARY KEY (patient_id, doctor_id, appointment_date),
    FOREIGN KEY (patient_id) REFERENCES patients_2nf(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors_2nf(doctor_id)
);

--3nf
CREATE TABLE patients_3nf (
    patient_id INT PRIMARY KEY,
    patient_name TEXT NOT NULL
);

CREATE TABLE departments_3nf (
    department_id INT PRIMARY KEY,
    department_name TEXT NOT NULL UNIQUE
);

CREATE TABLE doctors_3nf (
    doctor_id INT PRIMARY KEY,
    doctor_name TEXT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments_3nf(department_id)
);

CREATE TABLE appointments_3nf (
    patient_id INT,
    doctor_id INT,
    appointment_date DATE NOT NULL,
    PRIMARY KEY (patient_id, doctor_id, appointment_date),
    FOREIGN KEY (patient_id) REFERENCES patients_3nf(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors_3nf(doctor_id)
);


CREATE TABLE patients_bcnf (
    patient_id INT PRIMARY KEY,
    patient_name TEXT NOT NULL
);

-- Table 2: Departments
CREATE TABLE departments_bcnf (
    department_id INT PRIMARY KEY,
    department_name TEXT NOT NULL UNIQUE
);

-- Table 3: Doctors
CREATE TABLE doctors_bcnf (
    doctor_id INT PRIMARY KEY,
    doctor_name TEXT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments_bcnf(department_id)
);

CREATE TABLE appointments_bcnf (
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    -- Additional appointment details can be added here
    appointment_time TIME,
    appointment_status TEXT DEFAULT 'scheduled',
    PRIMARY KEY (patient_id, doctor_id, appointment_date),
    FOREIGN KEY (patient_id) REFERENCES patients_bcnf(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors_bcnf(doctor_id)
);
