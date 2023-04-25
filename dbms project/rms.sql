-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2023 at 04:57 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rms`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passw` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `email`, `passw`) VALUES
(1, 'tammu1000@gmail.com', 'abcd'),
(2, 'agent123@gmail.com', 'abcd'),
(3, 'nadheefahmed@gmail.com', 'test'),
(4, 'wtwtuw@gmail.com', 'abcd'),
(36, 'beh@gmail.com', 'beh'),
(328, 'fawaz@gmail.com', 'fawaz'),
(370, 'turin@gmail.com', 'turin'),
(385, 'jb@gmail.com', 'jb'),
(645, 'brihithshenoy@gmail.com', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `A_ID` int(11) NOT NULL,
  `A_NAME` varchar(10) NOT NULL,
  `A_ADDRESS` varchar(20) DEFAULT NULL,
  `A_PHNO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`A_ID`, `A_NAME`, `A_ADDRESS`, `A_PHNO`) VALUES
(1, 'Tamim', 'Bikarnakatte', '9380890029'),
(2, 'Farvath', 'Falnir', '7577781223'),
(3, 'Nadheef', 'Adyar', '9856546432'),
(4, 'Fahan', 'Shaktinagar', '9877781223');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `C_ID` int(10) NOT NULL,
  `C_NAME` varchar(20) NOT NULL,
  `C_ADDRESS` varchar(20) DEFAULT NULL,
  `C_AGE` int(11) NOT NULL,
  `C_PHNO` varchar(10) NOT NULL,
  `C_EMAIL` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`C_ID`, `C_NAME`, `C_ADDRESS`, `C_AGE`, `C_PHNO`, `C_EMAIL`) VALUES
(4, 'Vignesh', 'Kundapur', 19, '9380899111', 'wtwtuw@gmail.com'),
(36, 'Behzad', 'Anantnagar', 23, '7123867346', 'beh@gmail.com'),
(328, 'Fawaz', 'Attavar', 21, '9382891078', 'fawaz@gmail.com'),
(370, 'Turin', 'Dorlomin', 77, '9380895678', 'turin@gmail.com'),
(385, 'Justin Bieber', 'Neermarga', 35, '9123890346', 'jb@gmail.com'),
(645, 'Brihith Shenoy', 'Balmatta', 20, '9380890022', 'brihithshenoy@gmail.');

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

CREATE TABLE `listings` (
  `P_ID` int(11) NOT NULL,
  `A_ID` int(11) NOT NULL,
  `Agreement` varchar(20) NOT NULL,
  `Rent_Price` int(11) DEFAULT NULL,
  `Sales_Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`P_ID`, `A_ID`, `Agreement`, `Rent_Price`, `Sales_Price`) VALUES
(51, 3, 'Rent', 25000, 0),
(213, 4, 'Sale', 0, 75000000),
(221, 1, 'Rent', 15000, 0),
(474, 1, 'Rent', 25000, 0),
(560, 2, 'Rent', 20000, 0),
(672, 4, 'Rent', 7000, 0),
(746, 1, 'Sale', 0, 5000000),
(826, 2, 'Rent', 30000, 0),
(832, 2, 'Rent', 10000, 0),
(963, 4, 'Sale', NULL, 5000000),
(964, 3, 'Rent', 10000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`log_id`, `user_id`, `action`, `time`) VALUES
(7, 645, 'Property Inserted', '2023-01-24 08:38:05'),
(8, 645, 'Property Inserted', '2023-01-24 08:38:26'),
(9, 328, 'Property Inserted', '2023-01-24 08:39:46'),
(10, 385, 'Property Inserted', '2023-01-24 08:42:36'),
(11, 385, 'Property Inserted', '2023-01-24 08:43:15'),
(12, 385, 'Property Inserted', '2023-01-24 08:46:36'),
(13, 36, 'Property Inserted', '2023-01-24 08:47:54'),
(14, 328, 'Property Inserted', '2023-01-24 08:48:55'),
(15, 36, 'Property Inserted', '2023-01-24 08:49:51'),
(16, 645, 'Property Inserted', '2023-01-24 08:50:38'),
(17, 36, 'Property Updated', '2023-01-24 08:51:14'),
(18, 36, 'Property Updated', '2023-01-24 08:51:20'),
(19, 385, 'Property Deleted', '2023-01-24 08:51:54'),
(20, 370, 'Property Inserted', '2023-01-24 08:53:24'),
(21, 370, 'Property Inserted', '2023-01-24 09:01:33');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `O_ID` int(11) NOT NULL,
  `O_NAME` varchar(20) NOT NULL,
  `O_PHNO` varchar(10) NOT NULL,
  `O_ADDRESS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`O_ID`, `O_NAME`, `O_PHNO`, `O_ADDRESS`) VALUES
(36, 'Behzad', '7123867346', 'Anantnagar'),
(328, 'Fawaz', '9382891078', 'Attavar'),
(370, 'Turin', '9380895678', 'Dorlomin'),
(385, 'Justin Bieber', '9123890346', 'Neermarga'),
(645, 'Brihith Shenoy', '9380890022', 'Balmatta');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `P_ID` int(11) NOT NULL,
  `P_NAME` varchar(20) NOT NULL,
  `P_TYPE` varchar(20) NOT NULL,
  `P_SQFT` int(11) NOT NULL,
  `P_BHK` int(11) NOT NULL,
  `P_LOC` varchar(20) NOT NULL,
  `O_ID` int(11) NOT NULL,
  `A_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`P_ID`, `P_NAME`, `P_TYPE`, `P_SQFT`, `P_BHK`, `P_LOC`, `O_ID`, `A_ID`) VALUES
(51, 'Plama', 'Flat', 2500, 3, 'Kulshekar', 370, 3),
(213, 'Nargothrond', 'Flat', 4500, 5, 'Pandeshwar', 370, 4),
(221, 'Presidium', 'Flat', 1500, 2, 'Attavar', 328, 1),
(474, 'Abhiman ', 'Flat', 1400, 2, 'Balmatta', 645, 1),
(560, 'West Winds ', 'Flat', 2000, 3, 'Balmatta', 645, 2),
(672, 'Milan', 'Flat', 800, 1, 'Maroli', 36, 4),
(746, 'Al Falah', 'Villa', 4000, 4, 'Bikarnakatte', 385, 1),
(826, 'Ashiana', 'Villa', 4000, 3, 'Bikarnakatte', 385, 2),
(832, 'Paramount', 'Flat', 1500, 3, 'Shaktinagar', 36, 2),
(963, 'Deepa ', 'Flat', 2000, 3, 'Balmatta', 328, 4),
(964, 'Twin House', 'Villa', 4000, 4, 'Bikarnakatte', 645, 3);

--
-- Triggers `property`
--
DELIMITER $$
CREATE TRIGGER `deleted` AFTER DELETE ON `property` FOR EACH ROW INSERT INTO log VALUES(null,OLD.O_ID,"Property Deleted",NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert` AFTER INSERT ON `property` FOR EACH ROW INSERT INTO log VALUES(null,NEW.O_ID,"Property Inserted",NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update` AFTER UPDATE ON `property` FOR EACH ROW INSERT INTO log VALUES(null,NEW.O_ID,"Property Updated",NOW())
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`A_ID`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`C_ID`);

--
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`P_ID`),
  ADD KEY `agent` (`A_ID`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`O_ID`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`P_ID`),
  ADD KEY `A_ID` (`A_ID`),
  ADD KEY `O_ID` (`O_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=914;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `C_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=914;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `P_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=965;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agents`
--
ALTER TABLE `agents`
  ADD CONSTRAINT `agents_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `listings`
--
ALTER TABLE `listings`
  ADD CONSTRAINT `agent` FOREIGN KEY (`A_ID`) REFERENCES `property` (`A_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `prop` FOREIGN KEY (`P_ID`) REFERENCES `property` (`P_ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `owner`
--
ALTER TABLE `owner`
  ADD CONSTRAINT `owner_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `property_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `agents` (`A_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `property_ibfk_2` FOREIGN KEY (`O_ID`) REFERENCES `owner` (`O_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
