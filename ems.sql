-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 09:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ems`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendees`
--

CREATE TABLE `attendees` (
  `attendeesID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendees`
--

INSERT INTO `attendees` (`attendeesID`, `name`, `contact`, `eventID`) VALUES
(1, 'Alim', '+895462', 1),
(2, 'Akib', '+487651', 2),
(3, 'Asif', '+454651', 1),
(4, 'Shafi', '+854851', 1),
(5, 'Faisal', '+457651', 2),
(6, 'Nibir', '+563251', 3),
(7, 'Siam', '+789475', 3),
(8, 'Limon', '+454879', 3),
(9, 'Sifat', '+454893', 2),
(10, 'Mizan', '+897547', 2),
(11, 'Shafayet', '+897862', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL,
  `attendeesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `name`, `address`, `contact`, `eventID`, `attendeesID`) VALUES
(1, 'Shafayet', 'Dhaka', '+897862', 1, 11),
(2, 'Alim', 'Barishal', '+895462', 1, 1),
(3, 'Shafi', 'Dhaka', '+854851', 1, 4),
(4, 'Siam', 'Barishal', '+789475', 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eventID` int(11) NOT NULL,
  `event_name` varchar(100) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `status` enum('Done','On progress','Cancelled','Scheduled') DEFAULT NULL,
  `venueID` int(11) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL,
  `organizerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventID`, `event_name`, `date_time`, `description`, `status`, `venueID`, `customerID`, `organizerID`) VALUES
(1, 'Birthday', '2024-06-03 03:34:52', 'Birthday function', 'On progress', 2, 3, 4),
(2, 'Wedding', '2024-06-12 05:34:52', 'Wedding function', 'Done', 3, 4, 3),
(3, 'Reunion ', '2024-06-30 04:37:36', 'Reunion of batch 17', 'Scheduled', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expenseID` int(11) NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_type` enum('Checkbook','Cash','Card','Online Payment') DEFAULT NULL,
  `eventID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`expenseID`, `total_amount`, `payment_type`, `eventID`) VALUES
(1, 15000.00, 'Card', 1),
(2, 10000.00, 'Card', 3),
(3, 20000.00, 'Cash', 2);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackID` int(11) NOT NULL,
  `rating` enum('0 Stars','1 Star','2 Stars','3 Stars','4 Stars','5 Stars') DEFAULT NULL,
  `descripition` varchar(300) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `eventID` int(11) NOT NULL,
  `attendeesID` int(11) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackID`, `rating`, `descripition`, `date_time`, `eventID`, `attendeesID`, `customerID`) VALUES
(1, '3 Stars', 'Medium service', '2024-06-07 17:45:06', 1, 1, 2),
(2, '4 Stars', 'Good', '2024-06-07 17:45:31', 3, 6, NULL),
(3, '5 Stars', 'Best service', '2024-06-07 17:46:01', 3, 7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `organizers`
--

CREATE TABLE `organizers` (
  `organizerID` int(11) NOT NULL,
  `organizer_name` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('Main organizer','Sub organizer') DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL,
  `sponsorID` int(11) NOT NULL,
  `vendorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizers`
--

INSERT INTO `organizers` (`organizerID`, `organizer_name`, `contact`, `email`, `role`, `eventID`, `sponsorID`, `vendorID`) VALUES
(1, 'SM', '85963', 'sm@gmail.com', 'Sub organizer', NULL, 4, 3),
(2, 'KP ', '856875', 'kpo@gmail.com', 'Main organizer', 3, 3, 1),
(3, 'MJP', '564214', 'mj@gmail.com', 'Sub organizer', 2, 4, 6),
(4, 'JKT', '254144', 'jk@gmail.com', 'Sub organizer', 1, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `requirement`
--

CREATE TABLE `requirement` (
  `requirementID` int(11) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `organizerID` int(11) NOT NULL,
  `eventID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requirement`
--

INSERT INTO `requirement` (`requirementID`, `description`, `organizerID`, `eventID`, `customerID`) VALUES
(1, 'Should have AC, Water Supply, Enough Space', 4, 1, 3),
(2, 'Enough space needed', 3, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `speakers`
--

CREATE TABLE `speakers` (
  `speakerID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `eventID` int(11) NOT NULL,
  `attendeesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `speakers`
--

INSERT INTO `speakers` (`speakerID`, `name`, `contact`, `eventID`, `attendeesID`) VALUES
(1, 'Alim', '+895462', 1, 1),
(2, 'Nibir', '+563251', 3, 6),
(3, 'Faisal', '+457651', 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `sponsorID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contribution_type` enum('Checkbook','Cash','Card','Online Payment') DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL,
  `organizerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsors`
--

INSERT INTO `sponsors` (`sponsorID`, `name`, `contact`, `email`, `contribution_type`, `amount`, `eventID`, `organizerID`) VALUES
(1, 'Alamgir Hossain', '012547', 'alm@gmail.com', 'Cash', 10000.00, NULL, NULL),
(2, 'Samsuzzaman', '017548', 'smz@gmail.com', 'Online Payment', 14000.00, NULL, NULL),
(3, 'Kader Rahman', '012498', 'kd@gmail.com', 'Card', 20000.00, NULL, NULL),
(4, 'Millat Hossain', '014765', 'mil@gmail.com', 'Online Payment', 5000.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `vendorID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `service_type` varchar(200) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL,
  `organizerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendorID`, `name`, `service_type`, `contact`, `eventID`, `organizerID`) VALUES
(1, 'KB Commpany', 'Catering', '025478', NULL, NULL),
(2, 'NM Sounds', 'Sound Services', '014785', NULL, NULL),
(3, 'RFL', 'Seats and Chair', '023547', NULL, NULL),
(4, 'Cafe de Salam', 'Food & Restaurant Service', '023547', NULL, NULL),
(5, 'SK Lights', 'Lighting', '014521', NULL, NULL),
(6, 'MN Decorations', 'Decoration Ideas', '536987', NULL, NULL),
(7, 'Aquafina', 'Water supply', '254865', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `venueID` int(11) NOT NULL,
  `venue_name` varchar(100) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `eventID` int(11) NOT NULL,
  `organizerID` int(11) NOT NULL,
  `requirementID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `venues`
--

INSERT INTO `venues` (`venueID`, `venue_name`, `capacity`, `address`, `contact`, `eventID`, `organizerID`, `requirementID`) VALUES
(1, 'SM House', 100, 'Mirpur 1, Dhaka', '214578', 3, 3, 1),
(2, 'Slick Dines', 500, 'Mirpur 11, Dhaka', '236547', 1, 4, 2),
(3, 'Sams Residence', 2500, 'Dhanmondi, Dhaka', '589654', 2, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendees`
--
ALTER TABLE `attendees`
  ADD PRIMARY KEY (`attendeesID`),
  ADD KEY `eventID` (`eventID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD KEY `fk_events` (`eventID`),
  ADD KEY `fk_attendees` (`attendeesID`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventID`),
  ADD KEY `fk_venues` (`venueID`),
  ADD KEY `fk_customer` (`customerID`),
  ADD KEY `fk_organizers` (`organizerID`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expenseID`),
  ADD KEY `eventID` (`eventID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackID`),
  ADD KEY `eventID` (`eventID`),
  ADD KEY `attendeesID` (`attendeesID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `organizers`
--
ALTER TABLE `organizers`
  ADD PRIMARY KEY (`organizerID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_sponsors` (`sponsorID`),
  ADD KEY `fk_vendors` (`vendorID`);

--
-- Indexes for table `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`requirementID`),
  ADD KEY `organizerID` (`organizerID`),
  ADD KEY `eventID` (`eventID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `speakers`
--
ALTER TABLE `speakers`
  ADD PRIMARY KEY (`speakerID`),
  ADD KEY `eventID` (`eventID`),
  ADD KEY `attendeesID` (`attendeesID`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`sponsorID`),
  ADD KEY `eventID` (`eventID`),
  ADD KEY `organizerID` (`organizerID`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`vendorID`),
  ADD KEY `eventID` (`eventID`),
  ADD KEY `organizerID` (`organizerID`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`venueID`),
  ADD KEY `eventID` (`eventID`),
  ADD KEY `organizerID` (`organizerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendees`
--
ALTER TABLE `attendees`
  MODIFY `attendeesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expenseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `organizers`
--
ALTER TABLE `organizers`
  MODIFY `organizerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `requirement`
--
ALTER TABLE `requirement`
  MODIFY `requirementID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `speakers`
--
ALTER TABLE `speakers`
  MODIFY `speakerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `sponsorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `vendorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `venueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendees`
--
ALTER TABLE `attendees`
  ADD CONSTRAINT `attendees_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_attendees` FOREIGN KEY (`attendeesID`) REFERENCES `attendees` (`attendeesID`),
  ADD CONSTRAINT `fk_events` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `fk_organizers` FOREIGN KEY (`organizerID`) REFERENCES `organizers` (`organizerID`),
  ADD CONSTRAINT `fk_venues` FOREIGN KEY (`venueID`) REFERENCES `venues` (`venueID`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`attendeesID`) REFERENCES `attendees` (`attendeesID`),
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`);

--
-- Constraints for table `organizers`
--
ALTER TABLE `organizers`
  ADD CONSTRAINT `fk_sponsors` FOREIGN KEY (`sponsorID`) REFERENCES `sponsors` (`sponsorID`),
  ADD CONSTRAINT `fk_vendors` FOREIGN KEY (`vendorID`) REFERENCES `vendors` (`vendorID`);

--
-- Constraints for table `requirement`
--
ALTER TABLE `requirement`
  ADD CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`organizerID`) REFERENCES `organizers` (`organizerID`),
  ADD CONSTRAINT `requirement_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`),
  ADD CONSTRAINT `requirement_ibfk_3` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`);

--
-- Constraints for table `speakers`
--
ALTER TABLE `speakers`
  ADD CONSTRAINT `speakers_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`),
  ADD CONSTRAINT `speakers_ibfk_2` FOREIGN KEY (`attendeesID`) REFERENCES `attendees` (`attendeesID`);

--
-- Constraints for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD CONSTRAINT `sponsors_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`),
  ADD CONSTRAINT `sponsors_ibfk_2` FOREIGN KEY (`organizerID`) REFERENCES `organizers` (`organizerID`);

--
-- Constraints for table `vendors`
--
ALTER TABLE `vendors`
  ADD CONSTRAINT `vendors_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`),
  ADD CONSTRAINT `vendors_ibfk_2` FOREIGN KEY (`organizerID`) REFERENCES `organizers` (`organizerID`);

--
-- Constraints for table `venues`
--
ALTER TABLE `venues`
  ADD CONSTRAINT `venues_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`),
  ADD CONSTRAINT `venues_ibfk_2` FOREIGN KEY (`organizerID`) REFERENCES `organizers` (`organizerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
