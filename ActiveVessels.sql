-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql.eecs.oregonstate.edu
-- Generation Time: Oct 27, 2016 at 08:46 PM
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
-- Table structure for table `ActiveVessels`
--

CREATE TABLE `ActiveVessels` (
  `CampaignID` int(11) NOT NULL,
  `VesselID` int(11) NOT NULL,
  `CurrentHitPoints` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ActiveVessels`
--

INSERT INTO `ActiveVessels` (`CampaignID`, `VesselID`, `CurrentHitPoints`) VALUES
(2, 1, 18);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ActiveVessels`
--
ALTER TABLE `ActiveVessels`
  ADD PRIMARY KEY (`CampaignID`,`VesselID`),
  ADD KEY `VesselID` (`VesselID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
