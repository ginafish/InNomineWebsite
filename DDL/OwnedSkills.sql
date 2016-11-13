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
-- Table structure for table `OwnedSkills`
--

CREATE TABLE `OwnedSkills` (
  `RanksTaken` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL,
  `SkillName` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `OwnedSkills`
--

INSERT INTO `OwnedSkills` (`RanksTaken`, `CharacterID`, `SkillName`) VALUES
(7, 1, 'Ranged Weapon'),
(1, 1, 'Savoir Faire'),
(4, 1, 'Singing'),
(4, 1, 'Acrobatics'),
(1, 1, 'Large Weapon'),
(1, 2, 'Computer Operati'),
(3, 2, 'Chemistry'),
(5, 2, 'Dodge'),
(1, 2, 'Driving'),
(1, 2, 'Electronics'),
(1, 2, 'Engineering'),
(1, 2, 'Knowledge '),
(1, 2, 'Language'),
(1, 2, 'Medicine'),
(1, 2, 'Ranged Weapon'),
(1, 2, 'Singing'),
(1, 2, 'Small Weapon'),
(1, 2, 'Throwing');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `OwnedSkills`
--
ALTER TABLE `OwnedSkills`
  ADD PRIMARY KEY (`CharacterID`,`SkillName`),
  ADD KEY `SkillName` (`SkillName`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
