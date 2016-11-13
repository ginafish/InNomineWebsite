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
-- Table structure for table `EtherealStats`
--

CREATE TABLE `EtherealStats` (
  `CharacterID` int(11) NOT NULL,
  `Ethereal` int(11) NOT NULL,
  `Intelligence` int(11) NOT NULL,
  `Prec` int(11) NOT NULL,
  `SoulHits` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EtherealStats`
--

INSERT INTO `EtherealStats` (`CharacterID`, `Ethereal`, `Intelligence`, `Prec`, `SoulHits`) VALUES
(1, 2, 5, 3, 10),
(2, 5, 11, 9, 55);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `EtherealStats`
--
ALTER TABLE `EtherealStats`
  ADD PRIMARY KEY (`CharacterID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
