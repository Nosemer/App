-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306:3306
-- Generation Time: Jun 26, 2024 at 04:43 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `1styearstudent`
--

CREATE TABLE `1styearstudent` (
  `ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `1styearstudent`
--

INSERT INTO `1styearstudent` (`ID`, `First_Name`, `Last_Name`, `Email`, `Password`) VALUES
(2114114, 'Emerson ', 'Gonzales', 'eraldgolas@gmail.com', 'Emerson0909');

-- --------------------------------------------------------

--
-- Table structure for table `1styearstudentgrades`
--

CREATE TABLE `1styearstudentgrades` (
  `ID` int(11) NOT NULL,
  `CPE111` decimal(4,2) DEFAULT NULL,
  `PHY121` decimal(4,2) DEFAULT NULL,
  `CPE112` decimal(4,2) DEFAULT NULL,
  `GECS01` decimal(4,2) DEFAULT NULL,
  `GECS02` decimal(4,2) DEFAULT NULL,
  `GECS03` decimal(4,2) DEFAULT NULL,
  `GECS04` decimal(4,2) DEFAULT NULL,
  `PE1` decimal(4,2) DEFAULT NULL,
  `NSTP1` decimal(4,2) DEFAULT NULL,
  `Grade` enum('Midterm','Finals','','') DEFAULT NULL,
  `Student_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `1styearstudentgrades`
--

INSERT INTO `1styearstudentgrades` (`ID`, `CPE111`, `PHY121`, `CPE112`, `GECS01`, `GECS02`, `GECS03`, `GECS04`, `PE1`, `NSTP1`, `Grade`, `Student_ID`) VALUES
(1, '90.00', '89.00', '88.00', '76.00', '67.00', '76.00', '77.00', '99.00', '90.00', 'Midterm', 2114114),
(2, '90.00', '88.00', '89.00', '99.00', '89.00', '98.00', '77.00', '88.00', '88.00', 'Finals', 2114114);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `1styearstudent`
--
ALTER TABLE `1styearstudent`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `1styearstudentgrades`
--
ALTER TABLE `1styearstudentgrades`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Student_ID` (`Student_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `1styearstudentgrades`
--
ALTER TABLE `1styearstudentgrades`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `1styearstudentgrades`
--
ALTER TABLE `1styearstudentgrades`
  ADD CONSTRAINT `1styearstudentgrades_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `1styearstudent` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
