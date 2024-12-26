-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 11, 2024 at 11:47 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sample`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL,
  `activity_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`activity_id`, `activity_name`) VALUES
(1, 'Lab Work'),
(2, 'Group Project'),
(3, 'Quiz');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `program_id` int(11) NOT NULL,
  `program_name` varchar(100) NOT NULL,
  `program_acro` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`program_id`, `program_name`, `program_acro`) VALUES
(1, 'Bachelor of Science in Information Technology', 'BSIT'),
(2, 'Bachelor of Science in Computer Science', 'BSCS'),
(3, 'Bachelor of Science in Entertainment and Multimedia Computing', 'BSEMC');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `studno` varchar(20) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `extname` varchar(4) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `student_type` int(11) DEFAULT NULL,
  `complete_address` text DEFAULT NULL,
  `program_id` varchar(15) DEFAULT NULL,
  `yrlevel` int(11) DEFAULT NULL,
  `picture` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studno`, `fname`, `mname`, `lname`, `extname`, `birthdate`, `email`, `contact_number`, `student_type`, `complete_address`, `program_id`, `yrlevel`, `picture`) VALUES
('S001', 'John', 'Michael', 'Doe', 'Jr', '2000-01-15', 'john.doe@example.com', '0920-456-7890', 1, '123 Main St, Anytown, USA', 'BSIT', 2, 'john_doe_pic.jpg'),
('S002', 'Jane', 'Marie', 'Smith', 'Sr', '2001-02-20', 'jane.smith@example.com', '0920-567-8901', 2, '456 Elm St, Othertown, USA', 'BSIT', 3, 'jane_smith_pic.jpg'),
('S003', 'Alice', 'Anne', 'Johnson', 'III', '1999-03-25', 'alice.johnson@example.com', '0920-678-9012', 1, '789 Pine St, Newtown, USA', 'BSIT', 1, 'alice_johnson_pic.jpg'),
('S004', 'Bob', 'Allen', 'Brown', '', '2002-04-30', 'bob.brown@example.com', '0920-789-0123', 2, '101 Maple St, Yourtown, USA', 'BSIT', 2, 'bob_brown_pic.jpg'),
('S005', 'Emily', 'Rose', 'Davis', '', '2000-05-10', 'emily.davis@example.com', '0920-890-1234', 1, '202 Oak St, Hometown, USA', 'BSIT', 3, 'emily_davis_pic.jpg'),
('S006', 'Michael', 'Paul', 'Wilson', 'Jr', '1998-06-15', 'michael.wilson@example.com', '0920-901-2345', 2, '303 Birch St, Smalltown, USA', 'BSCS', 4, 'michael_wilson_pic.jpg'),
('S007', 'Sarah', 'Elizabeth', 'Miller', '', '2001-07-20', 'sarah.miller@example.com', '0920-012-3456', 1, '404 Cedar St, Bigcity, USA', 'BSCS', 1, 'sarah_miller_pic.jpg'),
('S008', 'David', 'James', 'Moore', '', '1999-08-25', 'david.moore@example.com', '0920-123-4567', 2, '505 Spruce St, Greentown, USA', 'BSCS', 2, 'david_moore_pic.jpg'),
('S009', 'Laura', 'Kate', 'Taylor', '', '2002-09-30', 'laura.taylor@example.com', '0920-234-5678', 1, '606 Fir St, Laketown, USA', 'BSCS', 3, 'laura_taylor_pic.jpg'),
('S010', 'James', 'Robert', 'Anderson', 'II', '2000-10-05', 'james.anderson@example.com', '0920-345-6789', 2, '707 Pine St, Rivertown, USA', 'BSCS', 4, 'james_anderson_pic.jpg'),
('S020', 'John', 'Michael', 'Doe', NULL, '2000-01-15', 'john2.doe@example.com', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `submission_id` int(11) NOT NULL,
  `studno` varchar(20) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  `remarks` enum('VG','G','S','NI') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `studno` varchar(20) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_token_college` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`studno`, `username`, `password`, `user_token_college`) VALUES
('S003', 'alicejohnson', 'mypassword789', 'token_003'),
('S004', 'bobbrown', 'password101112', 'token_004'),
('S008', 'davidmoore', 'password8765', 'token_008'),
('S005', 'emilydavis', 'pass1234word', 'token_005'),
('S010', 'jamesanderson', 'password0987', 'token_010'),
('S002', 'janesmith', 'securepass456', 'token_002'),
('S001', 'johndoe', 'password123', 'token_001'),
('S009', 'laurataylor', 'password4321', 'token_009'),
('S006', 'michaelwilson', 'qwerty5678', 'token_006'),
('S007', 'sarahmiller', 'abc123password', 'token_007');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`program_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studno`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_program` (`program_id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `idx_studno` (`studno`),
  ADD KEY `idx_activity_id` (`activity_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `program_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `submission_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
