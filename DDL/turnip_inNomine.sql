-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 09, 2016 at 06:05 AM
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

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`turnip`@`localhost` FUNCTION `effectSkl`(`characterID` INT UNSIGNED, `skllNm` VARCHAR(20)) RETURNS int(10) unsigned
    NO SQL
    DETERMINISTIC
BEGIN
DECLARE effectSkl int;
DECLARE bsSkll VARCHAR(4);
DECLARE skillStatModify int;
SET bsSkll = (SELECT baseSkill FROM Skills WHERE SkillName = skllNm);
SET skillStatModify = 0;

IF (bsSkll='STR') THEN
SET skillStatModify = (SELECT Strength FROM CorporealStats WHERE CoporealStats.CharacterID = characterID);
ELSEIF (bsSkll = 'AGI') THEN
SET skillStatModify = (SELECT Agility FROM CorporealStats WHERE CharacterID = characterID);
ELSEIF (bsSkll = 'INT') THEN
SET skillStatModify = (SELECT Intelligence FROM EtherealStats WHERE CharacterID = characterID);
ELSEIF (bsSkll = 'PREC') THEN
SET skillStatModify = (SELECT Prec FROM EtherealStats WHERE CharacterID = characterID);
ELSEIF (bsSkll = 'WILL') THEN
SET skillStatModify = (SELECT Will FROM CelestialStats WHERE CharacterID = characterID);
ELSE
SET skillStatModify = (SELECT Perception FROM CelestialStats WHERE CharacterID = characterID);
END IF;

SET effectSkl = (SELECT RanksTaken FROM OwnedSkills WHERE SkillName = skllNm AND CharacterID=characterID);
SET effectSkl = (effectSkl + skillStatModify);

RETURN (effectSkl);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ActiveVessels`
--

CREATE TABLE IF NOT EXISTS `ActiveVessels` (
  `CampaignID` int(11) NOT NULL,
  `VesselID` int(11) NOT NULL,
  `CurrentHitPoints` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ActiveVessels`
--

INSERT INTO `ActiveVessels` (`CampaignID`, `VesselID`, `CurrentHitPoints`) VALUES
(2, 1, 18);

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Campaigns`
--

INSERT INTO `Campaigns` (`CampaignID`, `CampaignName`, `CampaignPassword`, `CharacterRestrictions`, `PlayerLimit`, `IngameDate`, `IngameTime`, `GameMasterUsername`, `CampaignBlurb`) VALUES
(1, 'theNewDepartment', '', '', 3, NULL, NULL, 'mrayan', 'Hopefully will have a real change here. '),
(2, 'theOldDepartment', NULL, NULL, 3, NULL, NULL, 'Melissa', 'Probably will never be anything here...'),
(3, 'kjhjkl', NULL, NULL, 6, NULL, NULL, 'newtest', 'xcxcvbbcvxxbcvbxcvbxcvbvcxzbvcx'),
(4, 'testCamp', NULL, NULL, 5, NULL, NULL, 'newtest', 'Words and stuff and things.'),
(6, 'aNewCampaign', '', '', 3, NULL, NULL, 'mrayan', 'Hopefully this will work'),
(8, 'A Third Campaign', '', 'c', 6, NULL, NULL, 'mrayan', 'Do these work?');

-- --------------------------------------------------------

--
-- Table structure for table `CelestialStats`
--

CREATE TABLE IF NOT EXISTS `CelestialStats` (
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
(2, 3, 6, 6, 18),
(4, 5, 2, 2, 1),
(3, 6, 6, 18, 3),
(6, 10, 3, 3, 0),
(7, 10, 3, 3, 0),
(8, 10, 3, 3, 0),
(9, 9, 2, 2, 0);

--
-- Triggers `CelestialStats`
--
DELIMITER $$
CREATE TRIGGER `setSoulHits` BEFORE INSERT ON `CelestialStats`
 FOR EACH ROW BEGIN
SET new.SoulHits = (new.Will * new.Celestial);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `CharacterCampaignParticipation`
--

CREATE TABLE IF NOT EXISTS `CharacterCampaignParticipation` (
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
(2, 2, 0, 0, 0),
(1, 4, 5, 2, 0),
(2, 9, 0, 18, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Characters`
--

CREATE TABLE IF NOT EXISTS `Characters` (
  `CharacterID` int(11) NOT NULL,
  `CharacterName` varchar(30) NOT NULL,
  `Dissonance` varchar(15) DEFAULT NULL,
  `Discord` varchar(15) DEFAULT NULL,
  `Superior` varchar(20) NOT NULL,
  `ChoirBandMembership` varchar(1) NOT NULL,
  `ChoirBandName` varchar(20) NOT NULL,
  `Essence` int(11) NOT NULL,
  `OwnerUsername` varchar(12) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Characters`
--

INSERT INTO `Characters` (`CharacterID`, `CharacterName`, `Dissonance`, `Discord`, `Superior`, `ChoirBandMembership`, `ChoirBandName`, `Essence`, `OwnerUsername`) VALUES
(1, 'Raziel', NULL, NULL, 'Marc', 'C', 'Kyriotate', 9, 'fletcal'),
(2, 'Mika', NULL, NULL, 'Jean', 'C', 'Malakim', 9, 'mrayan'),
(4, 'Ezekiel', NULL, NULL, 'Novalis', 'c', 'Seraphim', 5, 'newtest'),
(3, 'Samuel', NULL, NULL, 'Malphas', 'D', 'Impudite', 9, 'hollowSam'),
(6, 'fgdxsfgdfdgs', NULL, NULL, 'Band - Superior', 'B', 'Band - Succubus', 6, 'newtest'),
(5, 'fgdxsfgdfdgs', NULL, NULL, 'Band - Superior', 'B', 'Band - Succubus', 6, 'newtest'),
(7, 'fgdxsfgdfdgs', NULL, NULL, 'Band - Superior', 'B', 'Band - Succubus', 6, 'newtest'),
(8, 'fgdxsfgdfdgs', NULL, NULL, 'Band - Superior', 'B', 'Band - Succubus', 6, 'newtest'),
(9, 'asfdas', NULL, NULL, 'Choir - Superior', 'B', 'Band - Succubus', 6, 'newtest');

-- --------------------------------------------------------

--
-- Stand-in structure for view `CharacterSheet`
--
CREATE TABLE IF NOT EXISTS `CharacterSheet` (
`CharacterName` varchar(30)
,`Dissonance` varchar(15)
,`Discord` varchar(15)
,`Superior` varchar(20)
,`ChoirBandName` varchar(20)
,`Essence` int(11)
,`Corporeal` int(11)
,`Strength` int(11)
,`Agility` int(11)
,`Ethereal` int(11)
,`Intelligence` int(11)
,`Prec` int(11)
,`MindHits` int(11)
,`Celestial` int(11)
,`Will` int(11)
,`Perception` int(11)
,`SoulHits` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `CorporealStats`
--

CREATE TABLE IF NOT EXISTS `CorporealStats` (
  `CharacterID` int(11) NOT NULL,
  `Corporeal` int(11) NOT NULL,
  `Strength` int(11) NOT NULL,
  `Agility` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CorporealStats`
--

INSERT INTO `CorporealStats` (`CharacterID`, `Corporeal`, `Strength`, `Agility`) VALUES
(1, 3, 9, 3),
(2, 1, 3, 1),
(4, 2, 1, 1),
(3, 6, 6, 3),
(7, 10, 4, 4),
(6, 10, 4, 4),
(5, 10, 4, 4),
(8, 10, 4, 4),
(9, 7, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `EtherealStats`
--

CREATE TABLE IF NOT EXISTS `EtherealStats` (
  `CharacterID` int(11) NOT NULL,
  `Ethereal` int(11) NOT NULL,
  `Intelligence` int(11) NOT NULL,
  `Prec` int(11) NOT NULL,
  `MindHits` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EtherealStats`
--

INSERT INTO `EtherealStats` (`CharacterID`, `Ethereal`, `Intelligence`, `Prec`, `MindHits`) VALUES
(1, 2, 5, 3, 10),
(2, 5, 11, 9, 55),
(4, 3, 1, 1, 1),
(3, 6, 6, 18, 3),
(7, 10, 3, 3, 0),
(6, 10, 3, 3, 0),
(5, 10, 3, 3, 0),
(8, 10, 3, 3, 0),
(9, 5, 2, 2, 0);

--
-- Triggers `EtherealStats`
--
DELIMITER $$
CREATE TRIGGER `setMindHits` BEFORE INSERT ON `EtherealStats`
 FOR EACH ROW BEGIN
SET new.MindHits = (new.Intelligence * new.Ethereal);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `GMSheet`
--
CREATE TABLE IF NOT EXISTS `GMSheet` (
`CampaignID` int(11)
,`CharacterID` int(11)
,`CurrentMindHits` int(11)
,`CurrentSoulHits` int(11)
,`CharacterName` varchar(30)
,`Dissonance` varchar(15)
,`Discord` varchar(15)
);

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE IF NOT EXISTS `Items` (
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(30) NOT NULL,
  `Damage` int(11) DEFAULT NULL,
  `ItemDescription` varchar(200) DEFAULT NULL,
  `CharacterID` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`ItemID`, `ItemName`, `Damage`, `ItemDescription`, `CharacterID`) VALUES
(1, 'Octipi', NULL, 'A stuffed octopus', 2);

-- --------------------------------------------------------

--
-- Table structure for table `loginAttempts`
--

CREATE TABLE IF NOT EXISTS `loginAttempts` (
  `Username` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loginAttempts`
--

INSERT INTO `loginAttempts` (`Username`, `time`) VALUES
('testuser', '1481244609'),
('testuser', '1481247789'),
('newtest', '1481258740'),
('mrayan', '1481265810');

-- --------------------------------------------------------

--
-- Table structure for table `OwnedSkills`
--

CREATE TABLE IF NOT EXISTS `OwnedSkills` (
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
(1, 2, 'Throwing'),
(1, 4, 'Singing');

-- --------------------------------------------------------

--
-- Table structure for table `OwnedSongs`
--

CREATE TABLE IF NOT EXISTS `OwnedSongs` (
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
(2, 'Healing', 'Celestial', 1),
(3, 'Thunder', 'Coporeal', 1),
(4, 'Healing', 'Ethereal', 1),
(4, 'Attraction', 'Corporeal', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Skills`
--

CREATE TABLE IF NOT EXISTS `Skills` (
  `SkillName` varchar(16) NOT NULL,
  `BaseSkill` varchar(4) NOT NULL,
  `DefaultCheck` int(11) NOT NULL,
  `ShortDescription` varchar(50) NOT NULL,
  `LongDescription` varchar(3000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Skills`
--

INSERT INTO `Skills` (`SkillName`, `BaseSkill`, `DefaultCheck`, `ShortDescription`, `LongDescription`) VALUES
('Computer Operati', 'Int', 4, 'Use computers', 'This skill allows for the quick comprehension of a piece of software, its operation and its function. Above level 3, the computer operator may also use this skill in an attempt to repair a malfunctioning piece of hardware.'),
('Detect Lies', 'Per', 2, 'Detect lying', 'Detect Lies, obviously, lets you tell when someone is lying. The check digit of the successful Detect Lies roll must be higher than the check digit of the liar’s successful Lying roll. When someone fails a Detect Lies roll, the suspected liar may make a Perception roll (with the check digit of the failed roll added as a modifier) to see if he notices that his listener doesn’t trust him!'),
('Dodge', 'Var', 1, 'Dodge attacks', 'This skill lets you reduce the effects of attacks in Combat (see p. 66). In general, you may Dodge any attack that cannot be resisted. A successful Acrobatics roll adds its check digit to the target number for a Dodge roll against nonprojectile weapons -- you can acrobatically dodge a sword, but not a rain of bullets.'),
('Driving', 'Pre', 2, 'Drive 1 vehicle', 'This is your ability to drive any normal domestic vehicle, such as a car, truck or motorcycle. If someone has driven a specific vehicle often, the GM may give him a +1 modifier for controlling it. Driving rolls are generally made on two occasions – when you’re trying to get from one place to another, and when some\nspecific hazard pops up in the process.\nNormally, the check digit of a successful roll reflects how much time the driver was able to trim off the trip, while the check digit of a failed roll reflects how delayed the driver is due to traffic, poor navigational decisions, and so on. If he rolls a check digit of 6 on a failed roll, throw a random road hazard at hire. When a specific hazard occurs in play – for example, when the\nangels chasing the characters try to ram them, or when two Boy Scouts randomly lead a little old lady across the street in front of their vehicle – then the check digit of a Driving roll reflects how spectacularly the driver is able to (or fails to) avoid the situation.'),
('Electronics', 'Hig', 5, 'Invent or use electronic gadgets', 'You have the skill of inventing electronic gadgets and the knowledge of how best to implement them.\nLike Chemistry, the GM should rule on its use on a case-by-case basis. This skill is also useful for disarming and disassembling electronic traps, locks and other nuisances.\nThe check digit of a successful roll can represent the amount of time taken to achieve the goal, from a lot to a little, and (like the Chemistry skill) the overall quality of the end product. The check digit of a failed roll can represent the amount of time the character wasted before realizing he’s not getting anywhere (after which the player can roll again), the number of specific parts he finds he’s missing to complete his work, or the number of hits of damage he takes when he accidentally elbows his beer into the works.'),
('Emote', 'Per', 1, 'Expressing or hiding emotions', 'Emote is the skill of expressing feelings (or disguising them) through body language and vocal subtleties. A character making a successful Emote roll will appear sincere and genuine about his feelings. Those who have mastered it are both excellent communicators and excellent actors. \nFor example, a young woman walks into the room and want to attract some attention; she successfully Emotes sadness. “You think her daughter is sad,” the\nGM tells the players.Detect Lies can only be used against the Emote of a person trying to feign an emotion he doesn’t feel. If the emoter failed his roll, add the check digit to any Detect Lies roll!'),
('Engineering', 'Pre', 4, 'Design and repair physical systems', 'Engineers know how to design and repair devices in which moving parts are more important than electronics.'),
('Escape', 'Hig', 3, 'Escape artist', 'This skill brings freedom from knots, handcuffs, straitjackets and other annoyances. The check digit represents the amount of time it takes to gain freedom, with 1 being a long time and 6 being almost no time at all or, in the case of a failed roll, the amount of time spent struggling in the attempt.\nThe GM may inflict a -1 penalty for each bound arm.\nA separate Escape roll must be made for each binding. For example, if someone is bound and gagged, he must make one roll to free his mouth and another for his hands. (Since it’s more difficult to remove a gag with hands tied, he should work on freeing his hands first!)'),
('Fast-Talk', 'Wil', 1, 'Bend the rules, not lying', 'There is a difference between lying and “fast-talking,” albeit a subtle one. Fast-talking involves quickly persuading someone to do something relatively minor that’s against his nature – such as talking a security guard into letting you pass, or convincing a postal employee to give you a package that’s not yours.\nIts effect exists only in the moment, a brief lapse of common sense that doesn’t change the person’s basic nature: you’ve only convinced him to “bend the rules just this once.”\nThe character engages in a Contest of his Fast-Talk versus the victim’s roll.\nIf the target wins the Contest, he will get a +1 to resist further Fast-Talking by that person for the rest of the day. The check digit of a failed Fast-talk roll tells the number of hours you must wait before having any kind of chance to Fast-Talk that target again.'),
('Fighting', 'Var', 0, 'Unarmed combat', 'In the corporeal world, this is skill at unarmed combat, anything from brawling to a formal martial art. Celestials can use the same martial discipline when they battle with sheer force of Will, instead of hammering away with Strength. The check digit of a successful roll is generally the number of hits of damage done to the target; see the combat mechanics on p. 61 for more details.\nIn game terms, there is no difference between the various combat styles, but for roleplaying purposes, a fighter’s style should be defined. Does he use the crushing blows of a boxer, or the cunning grips of an Oriental master?\nFighting is based on Strength, Intelligence, or Will, plus appropriate Forces, depending on the type of combat (see pp. 62-64).'),
('Knowledge', 'Int', 4, 'Knowledge of one subject', 'There are hundreds of different Knowledge skills. Any sort of “book learning” can be a Knowledge skill – any field of scientific or cultural study. The player may define it as he chooses, but a general sort of Knowledge (like History) would be more diffuse than a specific Knowledge (French history).\nA character rolls against Knowledge to answer an appropriate question. The more specifically the question relates to his Knowledge, the more of a bonus the GM should give him to answer the question!\nA special kind of Knowledge is Area Knowledge. A character could have a high Area Knowledge for his hometown – for example, Knowledge/6 (.Arlington, Texas) – he’d know a lot about its people, politics and social mores, plus details about things like store locations and local hangouts. For a larger area, Area Knowledge would cover general subjects like politics and current events, geography, history, and so on. Because Area Knowledge is such an encompassing skill, the GM can let it serve for a variety of things, but often\nat a penalty!\nThe check digit of a successful roll determines how specifically the character can recall his knowledge.\nExample: A demon is trying to remember the best place in his town to dump a body. With a check digit of 1, the demon could conic up with a general area, but perhaps not the best place. With a check digit of 6, he could remember that tree trunk at the lake’s edge with the deep sand pit of to the side.\nThe check digit of a failed roll represents the number of hours before the character can attempt another Knowledge roll on the same subject. It may also represent the amount of time he has wasted, or the amount of trouble he and his companions get into because of his poor memory, at the GM’s discretion.\nExample: If the demon had failed his roll, a check digit of 1 might mean he wastes an hour driving around, unsuccessfully looking for the right spot With a check digit of 6, the demon might pull up to a park late in the evening – and, as he’s dragging the body by its feet toward the playground realize he’s just yards from the drunken remnants of a police officers’ picnic.'),
('Language', 'Int', 4, 'Knowledge of one language', 'Every language is a different skill, written as Language/2 (French), Language/4 (Basque), etc. Mortals automatically understand one language, their native tongue, at level 3; no skill roll is needed to use your native tongue. Any Celestial assigned to Earth will likewise know the language of his assigned area at level 3, at no cost.\nLanguage rolls are generally only used to determine how well nonnative speakers communicate in foreign languages. The check digit of a successful Language roll determines how much of the meaning came through.\nUsually, a failed roll represents the amount of time wasted stumbling through the language barrier, but in a high-stress situation the check digit is a penalty toward an immediate reaction roll made against the speaker by\nthe listener.\nThis skill gives you proficiency in one language. Buy it repeatedly to learn more languages.'),
('Large Weapon', 'Str', 3, 'Proficientcy of a single large weapon', 'This ability lets you use contact weapons of great size and strength, from swords to battleaxes. The check digit of a successful roll generally adds damage to the attack; see the combat mechanics on p. 61 for more information.'),
('Lockpicking', 'Pre', 3, 'Ability to pick mechanical locks', 'This skill will let you open mechanical locking mechanisms and defeat simple security systems. The check digit reflects the amount of time it takes (with 1 being a lot and 6 being a little) or the amount of time spent in vain (with 1 being a little and 6 being a lot).\nIf a failed roll has a check digit of 6, it not only wasted a lot of time but set off any alarms or traps that were there!'),
('Lying', 'Hig', 2, 'Ability to lie convincingly (Unless you''re Brendan', 'Oh, what a tangled web we weave! Well, not all that tangled – if you’re good at it. The check digit of a successful Lying roll represents the amount of time it takes the liar to persuade his victim of “the truth,” with 1 being a long time and 6 being a little, but the victim is free to make a Detect Lies roll. If the liar fails his roll, the victim should make an immediate reaction roll, minus the failed roll’s check digit.\nNote that Balseraphs don’t need or use this skill. They don’t think they’re lying. Not really.'),
('Medicine', 'Pre', 4, 'Diagnose and treat sickness and injuries', 'With this skill, you can diagnose sickness and injuries, as well as treat the damage if adequate materials are available. The degree to which you can heal a victim is based on your knowledge of medicine (i.e., your skill level); see the chart on page 76. A patient may only benefit from one successful Medicine roll until he makes a full natural recovery.\nThe check digit of a successful Medicine roll has no specific meaning – except when it’s a 6, in which case the patient is helped as though the doctor was one level higher. A failed Medicine roll has no ill effect unless the check digit is a 6, in which case the patient takes 1d-damage from his poor treatment. However, a failed roll cannot be repeated by that healer, that day, on that patient.'),
('Move Silently', 'Agi', 1, 'Pass unnoticed', 'This skill covers various tactics a person could use to pass unnoticed – such as walking without making a sound, hiding in shadows or disappearing into a crowd. The check digit of a skill roll acts as a modifier, negative in the case of a successful roll or positive in the case of a failed one, to the Perception skill of anyone trying to spot or follow him.\nMove Silently has no effect against the resonance of either the Cherubim or the Djinn.'),
('Ranged Weapon', 'Pre', 2, 'Use of one ranged weapon', 'This skill enables you to hit a target using a ranged weapon, such as a bow, a pistol or a rifle. It will also help you maintain and, at level 4 and above, repair such a weapon. See the combat mechanics, p. 61, for more\ninformation.\nThis skill gives you proficiency in one type of ranged weapon; important types include Rifle, Pistol, Longbow.'),
('Running', 'Hig', 1, 'Book it', 'This skill lets you move as fast as your legs will carry you. In a pursuit, roll against this skill. The check digit of a success is the number of extra yards per round gained beyond your basic movement. A failure brings no benefit – and if its check digit is 6, you fall and make no forward progress that round.'),
('Savoir-Faire', 'Hig', 4, 'Worldwide etiquette', 'This is a knowledge of worldwide etiquette. Those with Savoir-Faire can dine gracefully at any table, and handle touchy social situations with perfect style. The check digit of a Savoir-Faire roll may be added (or, in the case of a failed roll, subtracted) from immediate reaction rolls made by anyone observing the character.'),
('Seduction', 'Wil', 1, 'Seduce', 'This talent tells a character whether NPCs are attracted to him – and flirtatiously encourages such interest. When the object is actual seduction, if the target would not generally be inclined toward the seducer (for any reason ranging from marriage vows to a difference in orientation), then subtract the target’s Will from the seducer’s target number. The GM may add other modifiers as he sees fit, including Charisma based on looks, fame or sex appeal!\nThis is a talent to be used on NPCs. The behavior of a PC is up to the player, not the dice. The check digit of a piled roll is a penalty to an immediate reaction roll (p. 44) by the target. Interpret the results in a general fashion. Yes, it’s possible to fail a seduction attempt yet leave the “victim” smiling. If the seducer’s roll is successful, then what happens after that is entirely up to him . . .'),
('Singing', 'Per', 2, 'Vocal performance', 'This is skill at vocal performance. A singer may add his Emote skill to his Singing skill roll. Also, skill at Singing (unmodified by Emoting) enhances the effects of some Songs.\nAngels and demons with the Singing skill may use a side effect that is seldom considered – humming. Angels and demons on Earth can hum back and forth to each\nother, speaking “pig-celestial,” without fearing that their communication might be intercepted (except, of course, by other angels or demons). Players who attempt this must actually hum before making the skill roll. The check digit of a successful roll represents the number of words the singer has successfully broadcast to all celestials within listening range. The check digit of a failed roll represents the number of rounds the singer (or hummer) must wait before trying again.'),
('Small Weapon', 'Pre', 2, 'Use of a single small weapon', 'This skill defines a character’s ability to use any kind of small hand-held weapon. See the combat mechanics, p. 61, for more information. There is a separate skill for proficiency with each specific kind of small weapon, such as a dagger, a shortsword, or a sap.'),
('Survival', 'Hig', 4, 'Survive in specific hostile enviroment', 'This skill lets you forage for food and move easily through one specific hostile environment (desert, swamp, etc.), chosen when the skill is obtained. A successful roll’s check digit represents the number of hours you can survive in reasonable comfort before your next roll. A failed roll’s check digit is the number of hits you take from the hostile environment; roll again in six\nhours.\nThe GM should describe the injuries taken by those who fail their rolls, and may modify the default depending on the environment.'),
('Swimming', 'Agi', 2, 'Ability to swim', 'Add the check digit of a successful Swimming roll to a swimmer’s Strength to get the distance he moves that round. A failed roll indicates no progress; a check digit of 6 indicates a hit of damage from breathing water. All this damage is temporary and will be erased by an hour of rest, if the swimmer can just get out of the water.\nExample: Greg decides to dive into the water to get to two Purifiers sitting in a rowboat. Ignoring the fact that he’ll have to make an Agility roll to pull off the dive, he’ll need a Swimming roll to see how long it takes him to make it to the rowboat, currently 10 yards away. His Agility is 6, and his skill at Swimming is 4, so he’ll need to roll a 10 or less to make it. He does, with a check digit of 3. With a Strength of 6, he can close 9 yards in one turn. Unless the people he’s chasing have an outboard motor, Greg will grab the boat in the next combat round.'),
('Tactics', 'Int', 2, 'Leading up to 30 people through conflict', 'This is the skill of leading a small number of people (fewer than 30) through a small area of conflict, such as a group of buildings. The “tactical” skirmish can either be rolled out – with a contest between the two leaders’ Tactics skills – or played out, with the fighters actually infiltrating a site, and Tactics rolls giving the advantage of surprise to one side or the other.'),
('Throwing', 'Hig', 3, 'Throw small objects accurately', 'This skill lets you throw a light object (such as a knife or a grenade) accurately. The check digit of a successful roll is generally subtracted from the target number of your foe’s Dodge roll to avoid being hit. The check digit of a failed roll represents the number of feet by which the throw misses. Make a separate roll for all other potential targets (characters or objects) within range, starting at the original target and moving outward, until something is hit. If nothing within range is hit, the thrown object continues its trajectory to strike harmlessly (or, in the case of a grenade, not so harmlessly!) behind the original target.\nObjects can be thrown a number of yards equal to the character’s Strength, plus his Agility and his skill level at Throwing, plus or minus the check digit of a successful or failed Throwing skill roll. Halve the range in for every 5 pounds by which the weight of the object thrown exceeds the thrower’s Strength. Double the range for even’ 5 pounds by which it is less than his Strength.\nExample: Greg has a Strength of 6 and an Agility of 6. His skill at Throwing is 3, so he could throw an object weighing a poured or less – say, a holy football – at least 30 yards without trying too hard (6 + 6 + 3, doubled because its weight is 5 pounds less than his Strength). If he makes his Throwing roll, even with an average check, digit of 3 he could peg a dime from as far as 36 yards away.\nAnother example: A professional quarterback has a Strength of 7, an Agility of 9 and a Throwing skill of 6. On a great day, with a successful Throwing roll’s check digit of 6, he could go for the Hail Mary and land the ball up to 56 yards (7 + 9 + 6 + 6, doubled because off its weight) away!'),
('Tracking', 'Per', 2, 'Trail through familiar terrain', 'This allows you to trail someone through familiar terrain. If your prey has the Survival skill, and doesn’t want to be followed, a Contest between your Tracking skill and the targets Survival skill determines the outcome. The check digit of a successful Tracking roll usually represents the time the tracker takes to locate his prey, in minutes, hours or days, depending on the\nsituation.\nFor instance, tracking an imp through the woods behind a high school might only take a few minutes, but following a Renegade demon across a desert may take hours – or even days, if the quarry had a big enough head start. The check digit of a failed Tracking roll represents how many minutes, hours or days the tracker will wander about before realizing he’s lost the trail.');

-- --------------------------------------------------------

--
-- Table structure for table `Songs`
--

CREATE TABLE IF NOT EXISTS `Songs` (
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
('Attraction', 'Corporeal', 1, '(Hours+Skill)*Essence', 'Attune two objects to one another', '"The Corporeal Song of Attraction is designed to attune items to each other. Once attuned, each “tugs” gently in the direction of the other. A Perception roll, plus the check digit of the successful performance roll, must he made to correctly determine the direction of the object’s tugging.\r\nThis Song cannot he performed on living beings – only on objects. Both objects must he in physical contact with the performer’s vessel when the Songs effects are activated. If one object is destroyed, the effects of this Song end."'),
('Attraction', 'Ethereal', 1, '(Hours+Skill)*Essence', 'Make victim attracted to person/object of choice', '"The Ethereal Song of Attraction makes its victim madly, passionately attracted to any person or object of the performer’s choosing. The object of attraction must be within eyesight of the performer, and the target must be within a number of feet equal to the performer’s Ethereal Forces. The target may resist with a Will roll. If he fails to resist, he’ll feel compelled to possess and protect the object of his desire, and to stay in its presence, for the length of the Songs duration.\r\nIn a combat situation, the victim will defend himself normally, but must make a Will roll, minus the check digit of the Song’s performance roll, when forced to choose between self-preservation and protecting the object of his desire."'),
('Attraction', 'Celestial', 1, '(Hours+Skill)*Essence', 'Divine location of attuned object', 'Placeholder');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `Username` varchar(12) NOT NULL,
  `UserPassword` char(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`Username`, `UserPassword`, `Email`) VALUES
('fletcal', 'PASSWORD', 'caleb.fletcher@NOEMAIL.com'),
('mrayan', '51ff4147a152e44fe667a21e10b914475ecd28c73ff6bc37b7629037154bfc10152777322002846b8efbe998aef15017523e7dc5577a01a3a2fb5adf2277a495', 'bomberm@oregonstate.edu'),
('testuser', '$2y$10$0Q9v/AXl.LxCzOYZdKQd1OaH9ml8vBQzgIEjic73Q3shM7o4m2gcK', 'potato@potato.fake'),
('newtest', '84f17e93dde35157f85e4904490872837de18f78abf6cb7c20a0ea39f252aac61513f42276c4f5649806be621a6346c10d5500dc5cdc827e438595ad23e5ac05', 'fake@fake.potato');

-- --------------------------------------------------------

--
-- Table structure for table `Vessels`
--

CREATE TABLE IF NOT EXISTS `Vessels` (
  `VesselID` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL,
  `VesselName` varchar(15) NOT NULL,
  `Role` varchar(20) DEFAULT NULL,
  `HitPoints` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Vessels`
--

INSERT INTO `Vessels` (`VesselID`, `CharacterID`, `VesselName`, `Role`, `HitPoints`) VALUES
(1, 2, 'Michelle', 'Grad Student', 18),
(2, 3, 'Marcus', 'Student', 18),
(3, 4, 'Miriam', 'Chef', 5);

-- --------------------------------------------------------

--
-- Structure for view `CharacterSheet`
--
DROP TABLE IF EXISTS `CharacterSheet`;

CREATE ALGORITHM=UNDEFINED DEFINER=`turnip`@`localhost` SQL SECURITY DEFINER VIEW `CharacterSheet` AS select `C`.`CharacterName` AS `CharacterName`,`C`.`Dissonance` AS `Dissonance`,`C`.`Discord` AS `Discord`,`C`.`Superior` AS `Superior`,`C`.`ChoirBandName` AS `ChoirBandName`,`C`.`Essence` AS `Essence`,`O`.`Corporeal` AS `Corporeal`,`O`.`Strength` AS `Strength`,`O`.`Agility` AS `Agility`,`E`.`Ethereal` AS `Ethereal`,`E`.`Intelligence` AS `Intelligence`,`E`.`Prec` AS `Prec`,`E`.`MindHits` AS `MindHits`,`L`.`Celestial` AS `Celestial`,`L`.`Will` AS `Will`,`L`.`Perception` AS `Perception`,`L`.`SoulHits` AS `SoulHits` from (((`Characters` `C` join `CorporealStats` `O` on((`C`.`CharacterID` = `O`.`CharacterID`))) join `EtherealStats` `E` on((`C`.`CharacterID` = `E`.`CharacterID`))) join `CelestialStats` `L` on((`C`.`CharacterID` = `L`.`CharacterID`))) where 1;

-- --------------------------------------------------------

--
-- Structure for view `GMSheet`
--
DROP TABLE IF EXISTS `GMSheet`;

CREATE ALGORITHM=UNDEFINED DEFINER=`turnip`@`localhost` SQL SECURITY DEFINER VIEW `GMSheet` AS select `C`.`CampaignID` AS `CampaignID`,`C`.`CharacterID` AS `CharacterID`,`C`.`CurrentMindHits` AS `CurrentMindHits`,`C`.`CurrentSoulHits` AS `CurrentSoulHits`,`A`.`CharacterName` AS `CharacterName`,`A`.`Dissonance` AS `Dissonance`,`A`.`Discord` AS `Discord` from (`CharacterCampaignParticipation` `C` join `Characters` `A` on((`A`.`CharacterID` = `C`.`CharacterID`))) where 1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ActiveVessels`
--
ALTER TABLE `ActiveVessels`
  ADD PRIMARY KEY (`CampaignID`,`VesselID`), ADD KEY `VesselID` (`VesselID`);

--
-- Indexes for table `Campaigns`
--
ALTER TABLE `Campaigns`
  ADD PRIMARY KEY (`CampaignID`), ADD KEY `GameMasterUsername` (`GameMasterUsername`);

--
-- Indexes for table `CelestialStats`
--
ALTER TABLE `CelestialStats`
  ADD PRIMARY KEY (`CharacterID`);

--
-- Indexes for table `CharacterCampaignParticipation`
--
ALTER TABLE `CharacterCampaignParticipation`
  ADD PRIMARY KEY (`CharacterID`,`CampaignID`), ADD KEY `CampaignID` (`CampaignID`);

--
-- Indexes for table `Characters`
--
ALTER TABLE `Characters`
  ADD PRIMARY KEY (`CharacterID`);

--
-- Indexes for table `CorporealStats`
--
ALTER TABLE `CorporealStats`
  ADD PRIMARY KEY (`CharacterID`);

--
-- Indexes for table `EtherealStats`
--
ALTER TABLE `EtherealStats`
  ADD PRIMARY KEY (`CharacterID`);

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`ItemID`), ADD KEY `CharacterID` (`CharacterID`);

--
-- Indexes for table `OwnedSkills`
--
ALTER TABLE `OwnedSkills`
  ADD PRIMARY KEY (`CharacterID`,`SkillName`), ADD KEY `SkillName` (`SkillName`);

--
-- Indexes for table `OwnedSongs`
--
ALTER TABLE `OwnedSongs`
  ADD PRIMARY KEY (`CharacterID`,`SongName`,`SongForce`), ADD KEY `SongName` (`SongName`), ADD KEY `SongForce` (`SongForce`);

--
-- Indexes for table `Skills`
--
ALTER TABLE `Skills`
  ADD PRIMARY KEY (`SkillName`);

--
-- Indexes for table `Songs`
--
ALTER TABLE `Songs`
  ADD PRIMARY KEY (`SongName`,`SongForce`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `Vessels`
--
ALTER TABLE `Vessels`
  ADD PRIMARY KEY (`VesselID`), ADD KEY `CharacterID` (`CharacterID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Campaigns`
--
ALTER TABLE `Campaigns`
  MODIFY `CampaignID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Characters`
--
ALTER TABLE `Characters`
  MODIFY `CharacterID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `Items`
--
ALTER TABLE `Items`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Vessels`
--
ALTER TABLE `Vessels`
  MODIFY `VesselID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
