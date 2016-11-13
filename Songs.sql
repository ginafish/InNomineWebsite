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
-- Table structure for table `Songs`
--

CREATE TABLE `Songs` (
  `SongName` varchar(20) NOT NULL,
  `SongForce` varchar(9) NOT NULL,
  `EssenceReq` int(11) NOT NULL,
  `Duration` varchar(25) NOT NULL,
  `ShortDescription` varchar(50) NOT NULL,
  `LongDescription` varchar(3000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Songs`
--

INSERT INTO `Songs` (`SongName`, `SongForce`, `EssenceReq`, `Duration`, `ShortDescription`, `LongDescription`) VALUES
('Attraction', 'Coporeal', 1, '(Hours+Skill)*Essence', 'Attune two objects to one another', '"The Corporeal Song of Attraction is designed to attune items to each other. Once attuned, each “tugs” gently in the direction of the other. A Perception roll, plus the check digit of the successful performance roll, must he made to correctly determine the direction of the object’s tugging.\r\nThis Song cannot he performed on living beings – only on objects. Both objects must he in physical contact with the performer’s vessel when the Songs effects are activated. If one object is destroyed, the effects of this Song end."'),
('Attraction', 'Ethereal', 1, '(Hours+Skill)*Essence', 'Make victim attracted to person/object of choice', '"The Ethereal Song of Attraction makes its victim madly, passionately attracted to any person or object of the performer’s choosing. The object of attraction must be within eyesight of the performer, and the target must be within a number of feet equal to the performer’s Ethereal Forces. The target may resist with a Will roll. If he fails to resist, he’ll feel compelled to possess and protect the object of his desire, and to stay in its presence, for the length of the Songs duration.\r\nIn a combat situation, the victim will defend himself normally, but must make a Will roll, minus the check digit of the Song’s performance roll, when forced to choose between self-preservation and protecting the object of his desire."'),
('Attraction', 'Celestial', 1, '(Hours+Skill)*Essence', 'Divine location of attuned object', 'Placeholder');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Songs`
--
ALTER TABLE `Songs`
  ADD PRIMARY KEY (`SongName`,`SongForce`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
