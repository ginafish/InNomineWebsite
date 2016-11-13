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
-- Table structure for table `CelestialStats`
--

CREATE TABLE `CelestialStats` (
  `CharacterID` int(11) NOT NULL,
  `Celestial` int(11) NOT NULL,
  `Will` int(11) NOT NULL,
  `Perception` int(11) NOT NULL,
  `SoulHits` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CelestialStats`
--

INSERT INTO `CelestialStats` (`CharacterID`, `Celestial`, `Will`, `Perception`, `SoulHits`) VALUES
(1, 4, 10, 6, 40),
(2, 3, 6, 6, 18);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CelestialStats`
--
ALTER TABLE `CelestialStats`
  ADD PRIMARY KEY (`CharacterID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
