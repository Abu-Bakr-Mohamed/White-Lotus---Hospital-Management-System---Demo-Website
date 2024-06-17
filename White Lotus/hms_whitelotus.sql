-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2024 at 09:50 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms_whitelotus`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Time` time(6) NOT NULL,
  `Date` date NOT NULL,
  `Doctor_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`Time`, `Date`, `Doctor_ID`, `Patient_ID`) VALUES
('00:00:10.000000', '2024-04-28', 1, 1),
('00:00:11.000000', '2024-04-29', 2, 2),
('00:00:12.000000', '2024-04-30', 3, 3),
('00:00:13.000000', '2024-05-01', 4, 4),
('00:00:14.000000', '2024-05-02', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `companion`
--

CREATE TABLE `companion` (
  `Companion_ID` int(11) NOT NULL,
  `Comp_Name` varchar(50) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companion`
--

INSERT INTO `companion` (`Companion_ID`, `Comp_Name`, `Address`, `Patient_ID`) VALUES
(1, 'Yousef Maged', '123 Manshia St', 1),
(2, 'Ahmed Salah', '456 Bahary St', 2),
(3, 'Abdulrahman fathi', '789 Asafra St', 3),
(4, 'Nabil Mohamed', '321 Sidi Beshr St', 4),
(5, 'Fawzi moaaz', '555 Sidi Gaber St', 5);

-- --------------------------------------------------------

--
-- Table structure for table `companion_comp_phone`
--

CREATE TABLE `companion_comp_phone` (
  `Comp_Phone` int(11) NOT NULL,
  `Companion_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companion_comp_phone`
--

INSERT INTO `companion_comp_phone` (`Comp_Phone`, `Companion_ID`) VALUES
(1066653311, 1),
(1077845689, 5),
(1198658922, 2),
(1233478102, 4),
(1255698423, 3);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `D_Name` varchar(100) NOT NULL,
  `Department_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`D_Name`, `Department_ID`) VALUES
('Cardiology', 1),
('Pediatrics', 2),
('Orthopedics', 3),
('Neurology', 4),
('Dermatology', 5);

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `Disease_ID` int(11) NOT NULL,
  `Disease_Name` varchar(100) NOT NULL,
  `Symptoms` varchar(255) NOT NULL,
  `mild` int(11) NOT NULL,
  `moderate` int(11) NOT NULL,
  `severe` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`Disease_ID`, `Disease_Name`, `Symptoms`, `mild`, `moderate`, `severe`, `Patient_ID`) VALUES
(1, 'Common Cold', 'Runny or stuffy nose, sore throat, cough, congestion, slight body aches or a mild headache, sneezing, watery eyes, low-grade fever', 1, 0, 0, 1),
(2, 'Influenza (Flu)', 'Fever, cough, sore throat, runny or stuffy nose, body aches, headache, chills, fatigue, sometimes diarrhea and vomiting', 0, 1, 0, 2),
(3, 'Bronchitis', 'Cough, which may produce clear, yellow or green mucus, wheezing, fatigue, shortness of breath, slight fever and chills, chest discomfort', 0, 1, 1, 3),
(4, 'Pneumonia', 'Cough, which may produce greenish, yellow or even bloody mucus, fever, sweating and shaking chills, shortness of breath, rapid, shallow breathing, sharp or stabbing chest pain that gets worse when you breathe deeply or cough', 0, 0, 1, 4),
(5, 'Asthma', 'Coughing, especially at night, wheezing, shortness of breath, chest tightness, pain or pressure, and trouble sleeping caused by shortness of breath', 0, 1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `Doctor_ID` int(11) NOT NULL,
  `Speciality` varchar(100) NOT NULL,
  `Doctor_Fname` varchar(50) NOT NULL,
  `Doctor_Lname` varchar(50) NOT NULL,
  `Salary` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`Doctor_ID`, `Speciality`, `Doctor_Fname`, `Doctor_Lname`, `Salary`, `Department_ID`, `Email`, `Password`) VALUES
(1, 'Cardiologist', 'Mohamed', 'Yousri', 80000, 1, 'mohamed.yousri@gmail.com', 'sui77777'),
(2, 'Pediatrician', 'Fares', 'Mohamed', 75000, 2, 'fares.mohamed@gmail.com', 'fares556644'),
(3, 'Orthopedic Surgeon', 'Mahmoud', 'Mohamed', 90000, 3, 'mahmoud.mohamed@gmail.com', '7oda123456'),
(4, 'Neurologist', 'Sarah', 'Mohamed', 85000, 4, 'sarah.mohamed@gmail.com', 'ss775689'),
(5, 'Dermatologist', 'Menna', 'Hafez', 82000, 5, 'menna.hafez@gmail.com', 'menna0000');

-- --------------------------------------------------------

--
-- Table structure for table `icu`
--

CREATE TABLE `icu` (
  `High_Care` int(11) NOT NULL,
  `Room_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `Shift` varchar(50) NOT NULL,
  `Staff_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_theaters`
--

CREATE TABLE `operation_theaters` (
  `Operating_Hours` int(11) NOT NULL,
  `Room_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `Patient_ID` int(11) NOT NULL,
  `Patient_Fname` varchar(50) NOT NULL,
  `Patient_Lname` varchar(50) NOT NULL,
  `Patient_Address` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`Patient_ID`, `Patient_Fname`, `Patient_Lname`, `Patient_Address`, `Email`, `Password`) VALUES
(1, 'Boky', 'Bob', '123 Mamoura St', 'boky.bob@gmail.com', 'bob123456'),
(2, 'Mahmoud', 'Nour', '456 Rashid St', 'mahmoud.nour@gmail.com', 'nour9999'),
(3, 'Abdulrahman', 'Salah', '22 Mamoura St', 'abdo.salah@gmail.com', 'abdo887788'),
(4, 'Moustafa', 'Khatab', '18 Rashid St', 'desha.khatab@gmail.com', 'masa223388'),
(5, 'Omar', 'Mohamed', '27 Agamy St', 'omar.mohamed@gmail.com', 'mora447763');

-- --------------------------------------------------------

--
-- Table structure for table `patient_bill`
--

CREATE TABLE `patient_bill` (
  `Bill_Number` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Service_Description` varchar(255) NOT NULL,
  `Cost` int(11) NOT NULL,
  `Total_Cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_bill`
--

INSERT INTO `patient_bill` (`Bill_Number`, `Patient_ID`, `Service_Description`, `Cost`, `Total_Cost`) VALUES
(1, 1, 'Consultation', 50, 50),
(2, 2, 'X-Ray', 100, 100),
(3, 3, 'Blood Test', 75, 75),
(4, 4, 'MRI Scan', 200, 200),
(5, 5, 'Medication', 30, 30);

-- --------------------------------------------------------

--
-- Table structure for table `patient_patient_phone`
--

CREATE TABLE `patient_patient_phone` (
  `Patient_Phone` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_patient_phone`
--

INSERT INTO `patient_patient_phone` (`Patient_Phone`, `Patient_ID`) VALUES
(1032145678, 3),
(1066655545, 1),
(1198654478, 4),
(1233986422, 5),
(1299889988, 2);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Room_number` int(11) NOT NULL,
  `Admission_Date` int(11) NOT NULL,
  `Room_Type` int(11) NOT NULL,
  `Floor_Number` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_ID` int(11) NOT NULL,
  `Staff_FName` varchar(50) NOT NULL,
  `Staff_LName` varchar(50) NOT NULL,
  `Designation` varchar(50) NOT NULL,
  `Salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `Treatment_ID` int(11) NOT NULL,
  `Treatment_Name` varchar(100) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Dosage` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`Treatment_ID`, `Treatment_Name`, `Description`, `Start_Date`, `End_Date`, `Dosage`, `Patient_ID`) VALUES
(1, 'Antibiotics', 'Medication used to treat bacterial infections.', '2024-04-28', '2024-05-05', 7, 1),
(2, 'Painkillers', 'Medication used to relieve pain.', '2024-04-30', '2024-05-07', 7, 2),
(3, 'Steroids', 'Medication used to reduce inflammation.', '2024-05-01', '2024-05-10', 9, 3),
(4, 'Physical Therapy', 'Therapeutic exercises and activities to improve mobility and strength.', '2024-05-02', '2024-05-20', 18, 4),
(5, 'Antihistamines', 'Medication used to treat allergy symptoms.', '2024-05-03', '2024-05-12', 9, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ward_boy`
--

CREATE TABLE `ward_boy` (
  `Shift` varchar(50) NOT NULL,
  `Staff_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `works_at`
--

CREATE TABLE `works_at` (
  `Department_ID` int(11) NOT NULL,
  `Staff_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD KEY `Doctor_ID` (`Doctor_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `companion`
--
ALTER TABLE `companion`
  ADD PRIMARY KEY (`Companion_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `companion_comp_phone`
--
ALTER TABLE `companion_comp_phone`
  ADD PRIMARY KEY (`Comp_Phone`,`Companion_ID`),
  ADD KEY `Companion_ID` (`Companion_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Department_ID`);

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`Disease_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Doctor_ID`),
  ADD KEY `Department_ID` (`Department_ID`);

--
-- Indexes for table `icu`
--
ALTER TABLE `icu`
  ADD PRIMARY KEY (`Room_number`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- Indexes for table `operation_theaters`
--
ALTER TABLE `operation_theaters`
  ADD PRIMARY KEY (`Room_number`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Patient_ID`);

--
-- Indexes for table `patient_bill`
--
ALTER TABLE `patient_bill`
  ADD PRIMARY KEY (`Bill_Number`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `patient_patient_phone`
--
ALTER TABLE `patient_patient_phone`
  ADD PRIMARY KEY (`Patient_Phone`,`Patient_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_number`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`Treatment_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `ward_boy`
--
ALTER TABLE `ward_boy`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- Indexes for table `works_at`
--
ALTER TABLE `works_at`
  ADD PRIMARY KEY (`Department_ID`,`Staff_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `Department_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `Doctor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `Patient_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctor` (`Doctor_ID`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Constraints for table `companion`
--
ALTER TABLE `companion`
  ADD CONSTRAINT `companion_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Constraints for table `companion_comp_phone`
--
ALTER TABLE `companion_comp_phone`
  ADD CONSTRAINT `companion_comp_phone_ibfk_1` FOREIGN KEY (`Companion_ID`) REFERENCES `companion` (`Companion_ID`);

--
-- Constraints for table `disease`
--
ALTER TABLE `disease`
  ADD CONSTRAINT `disease_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`);

--
-- Constraints for table `icu`
--
ALTER TABLE `icu`
  ADD CONSTRAINT `icu_ibfk_1` FOREIGN KEY (`Room_number`) REFERENCES `room` (`Room_number`);

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`);

--
-- Constraints for table `operation_theaters`
--
ALTER TABLE `operation_theaters`
  ADD CONSTRAINT `operation_theaters_ibfk_1` FOREIGN KEY (`Room_number`) REFERENCES `room` (`Room_number`);

--
-- Constraints for table `patient_bill`
--
ALTER TABLE `patient_bill`
  ADD CONSTRAINT `patient_bill_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Constraints for table `patient_patient_phone`
--
ALTER TABLE `patient_patient_phone`
  ADD CONSTRAINT `patient_patient_phone_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Constraints for table `ward_boy`
--
ALTER TABLE `ward_boy`
  ADD CONSTRAINT `ward_boy_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`);

--
-- Constraints for table `works_at`
--
ALTER TABLE `works_at`
  ADD CONSTRAINT `works_at_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`),
  ADD CONSTRAINT `works_at_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
