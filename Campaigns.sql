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
-- Table structure for table `Campaigns`
--

CREATE TABLE `Campaigns` (
  `CampaignID` int(11) NOT NULL,
  `CampaignPassword` varchar(12) DEFAULT NULL,
  `IngameDate` varchar(50) DEFAULT NULL,
  `IngameTime` varchar(50) DEFAULT NULL,
  `GameMasterUsername` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Campaigns`
--

INSERT INTO `Campaigns` (`CampaignID`, `CampaignPassword`, `IngameDate`, `IngameTime`, `GameMasterUsername`) VALUES
(1, NULL, NULL, NULL, 'marieBomber'),
(2, NULL, NULL, NULL, 'Melissa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Campaigns`
--
ALTER TABLE `Campaigns`
  ADD PRIMARY KEY (`CampaignID`),
  ADD KEY `GameMasterUsername` (`GameMasterUsername`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Campaigns`
--
ALTER TABLE `Campaigns`
  MODIFY `CampaignID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
