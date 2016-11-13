-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql.eecs.oregonstate.edu
-- Generation Time: Oct 27, 2016 at 08:48 PM
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
-- Table structure for table `Characters`
--

CREATE TABLE `Characters` (
  `CharacterID` int(11) NOT NULL,
  `CharacterName` varchar(30) NOT NULL,
  `Dissonance` varchar(15) DEFAULT NULL,
  `Discord` varchar(15) DEFAULT NULL,
  `Superior` varchar(20) NOT NULL,
  `ChoirBandMembership` varchar(1) NOT NULL,
  `ChoirBandName` varchar(20) NOT NULL,
  `Essence` int(11) NOT NULL,
  `OwnerUsername` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Characters`
--

INSERT INTO `Characters` (`CharacterID`, `CharacterName`, `Dissonance`, `Discord`, `Superior`, `ChoirBandMembership`, `ChoirBandName`, `Essence`, `OwnerUsername`) VALUES
(1, 'Raziel', NULL, NULL, 'Marc', 'C', 'Kyriotate', 9, 'fletcal'),
(2, 'Mika', NULL, NULL, 'Jean', 'C', 'Malakim', 9, 'mrayan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Characters`
--
ALTER TABLE `Characters`
  ADD PRIMARY KEY (`CharacterID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Characters`
--
ALTER TABLE `Characters`
  MODIFY `CharacterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
