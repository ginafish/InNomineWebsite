-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql.eecs.oregonstate.edu
-- Generation Time: Oct 27, 2016 at 08:50 PM
-- Server version: 5.5.37-MariaDB-wsrep
-- PHP Version: 5.6.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_bomberm`
--

-- --------------------------------------------------------

--
-- Table structure for table `Vessels`
--

CREATE TABLE `Vessels` (
  `VesselID` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL,
  `VesselName` varchar(15) NOT NULL,
  `Role` varchar(20) DEFAULT NULL,
  `HitPoints` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Vessels`
--

INSERT INTO `Vessels` (`VesselID`, `CharacterID`, `VesselName`, `Role`, `HitPoints`) VALUES
(1, 2, 'Michelle', 'Grad Student', 18);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Vessels`
--
ALTER TABLE `Vessels`
  ADD PRIMARY KEY (`VesselID`),
  ADD KEY `CharacterID` (`CharacterID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Vessels`
--
ALTER TABLE `Vessels`
  MODIFY `VesselID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
