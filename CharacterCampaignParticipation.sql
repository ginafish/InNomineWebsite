-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql.eecs.oregonstate.edu
-- Generation Time: Oct 27, 2016 at 08:47 PM
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
-- Table structure for table `CharacterCampaignParticipation`
--

CREATE TABLE `CharacterCampaignParticipation` (
  `CampaignID` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL,
  `CurrentMindHits` int(11) NOT NULL,
  `CurrentSoulHits` int(11) NOT NULL,
  `KickedStatus` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CharacterCampaignParticipation`
--

INSERT INTO `CharacterCampaignParticipation` (`CampaignID`, `CharacterID`, `CurrentMindHits`, `CurrentSoulHits`, `KickedStatus`) VALUES
(1, 1, 0, 0, 0),
(2, 2, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CharacterCampaignParticipation`
--
ALTER TABLE `CharacterCampaignParticipation`
  ADD PRIMARY KEY (`CharacterID`,`CampaignID`),
  ADD KEY `CampaignID` (`CampaignID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
