-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql.eecs.oregonstate.edu
-- Generation Time: Oct 27, 2016 at 08:49 PM
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
-- Table structure for table `OwnedSongs`
--

CREATE TABLE `OwnedSongs` (
  `CharacterID` int(11) NOT NULL,
  `SongName` varchar(20) NOT NULL,
  `SongForce` varchar(9) NOT NULL,
  `RanksTaken` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `OwnedSongs`
--

INSERT INTO `OwnedSongs` (`CharacterID`, `SongName`, `SongForce`, `RanksTaken`) VALUES
(1, 'Healing ', 'Coporeal', 3),
(1, 'Healing', 'Ethereal', 3),
(1, 'Healing', 'Celestial', 1),
(1, 'Entropy', 'Celestial', 4),
(2, 'Healing', 'Coporeal', 3),
(2, 'Healing', 'Ethereal', 1),
(2, 'Healing', 'Celestial', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `OwnedSongs`
--
ALTER TABLE `OwnedSongs`
  ADD PRIMARY KEY (`CharacterID`,`SongName`,`SongForce`),
  ADD KEY `SongName` (`SongName`),
  ADD KEY `SongForce` (`SongForce`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
