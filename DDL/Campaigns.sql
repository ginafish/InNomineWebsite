-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2016 at 09:28 PM
-- Server version: 5.5.51-38.2
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `turnip_inNomine`
--

-- --------------------------------------------------------

--
-- Table structure for table `Campaigns`
--

CREATE TABLE IF NOT EXISTS `Campaigns` (
  `CampaignID` int(11) NOT NULL,
  `CampaignName` varchar(20) NOT NULL,
  `CampaignPassword` varchar(12) DEFAULT NULL,
  `CharacterRestrictions` varchar(1) DEFAULT NULL,
  `PlayerLimit` int(11) NOT NULL,
  `IngameDate` varchar(50) DEFAULT NULL,
  `IngameTime` varchar(50) DEFAULT NULL,
  `GameMasterUsername` varchar(12) NOT NULL,
  `CampaignBlurb` varchar(2500) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Campaigns`
--

INSERT INTO `Campaigns` (`CampaignID`, `CampaignName`, `CampaignPassword`, `CharacterRestrictions`, `PlayerLimit`, `IngameDate`, `IngameTime`, `GameMasterUsername`, `CampaignBlurb`) VALUES
(1, 'theNewDepartment', NULL, NULL, 3, NULL, NULL, 'mrayan', 'There will be something relevant here eventually, until then, it''s a big mess'),
(2, 'theOldDepartment', NULL, NULL, 0, NULL, NULL, 'Melissa', 'Probably will never be anything here...');

--
-- Triggers `Campaigns`
--
DELIMITER $$
CREATE TRIGGER `validateMaxPlayers` AFTER UPDATE ON `Campaigns`
 FOR EACH ROW BEGIN
  UPDATE Campaigns 
	SET PlayerLimit = 
		(SELECT COUNT(CharacterID) FROM CharacterCampaignParticipation WHERE
        CharacterCampaignParticipation.CampaignID = NEW.CampaignID)
    WHERE PlayerLimit<
	(SELECT COUNT(CharacterID) FROM CharacterCampaignParticipation WHERE CharacterCampaignParticipation.CampaignID=NEW.CampaignID);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Campaigns`
--
ALTER TABLE `Campaigns`
  ADD PRIMARY KEY (`CampaignID`), ADD KEY `GameMasterUsername` (`GameMasterUsername`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Campaigns`
--
ALTER TABLE `Campaigns`
  MODIFY `CampaignID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
