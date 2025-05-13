-- Create the database
CREATE DATABASE IF NOT EXISTS clinicDB;

-- Select the database
USE clinicDB;

-- Step 2.1: Create Patients table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    address TEXT
);

-- Step 2.2: Create Doctors table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- Step 2.3: Create Specialties table
CREATE TABLE Specialties (
    specialty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Step 2.4: Create junction table for Doctor-Specialty relationship
CREATE TABLE DoctorSpecialties (
    doctor_id INT,
    specialty_id INT,
    PRIMARY KEY (doctor_id, specialty_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (specialty_id) REFERENCES Specialties(specialty_id)
);

-- Step 2.5: Create Appointments table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Step 2.6: Create Bills table
CREATE TABLE Bills (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE,
    amount DECIMAL(10, 2) NOT NULL,
    paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);





