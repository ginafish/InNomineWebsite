CREATE TABLE Users (
	Username VARCHAR(12) NOT NULL,
	Password VARCHAR(18) NOT NULL,
	Email VARCHAR(30) NOT NULL
);

CREATE TABLE Campaigns (
	CampaignID INT NOT NULL AUTO_INCREMENT,
	CampaignPassword VARCHAR(12),
	IngameDate VARCHAR(50),
	IngameTime VARCHAR(50),
	GameMasterUsername VARCHAR(12) NOT NULL
);

CREATE TABLE CharacterCampaignParticipation (
	CampaignID INT NOT NULL,
	CharacterID INT NOT NULL,
	CurrentMindHits INT NOT NULL,
	CurrentSoulHits INT NOT NULL,
	KickedStatus BOOLEAN
);

CREATE TABLE Characters (
	CharacterID INT NOT NULL AUTO_INCREMENT,
	CharacterName VARCHAR(30) NOT NULL,
	Dissonance VARCHAR(15),
	Discord VARCHAR(15),
	Superior VARCHAR(20) NOT NULL,
	ChoirBandMembership VARCHAR(1) NOT NULL,
	Essence INT NOT NULL,
	OwnerUsername VARCHAR(12) NOT NULL
);

CREATE TABLE CorporealStats (
	CharacterID INT NOT NULL,
	Strength INT NOT NULL,
	Agility INT NOT NULL,
	Corporeal INT NOT NULL
);

CREATE TABLE CelestialStats (
	CharacterID INT NOT NULL,
	Will INT NOT NULL,
	Perception INT NOT NULL,
	SoulHits INT NOT NULL
);

CREATE TABLE EtheralStats (
	CharacterID INT NOT NULL,
	Intelligence INT NOT NULL,
	Prec INT NOT NULL,
	SoulHits INT NOT NULL
);

CREATE TABLE ActiveVessels (
	CampaignID INT NOT NULL,
	VesselID INT NOT NULL,
	CurrentHitPoints INT NOT NULL
);

CREATE TABLE Vessels (
	VesselID INT NOT NULL AUTO_INCREMENT,
	CharacterID INT NOT NULL,
	VesselName VARCHAR(15) NOT NULL,
	Role VARCHAR(20),
	HitPoints INT NOT NULL
);

CREATE TABLE Items (
	ItemID INT NOT NULL,
	ItemName VARCHAR(30) NOT NULL,
	Damage INT,
	ItemDescription VARCHAR(200)
);

CREATE TABLE Skills (
	SkillName VARCHAR(16) NOT NULL,
	BaseSkill VARCHAR(4) NOT NULL,
	DefaultCheck INT NOT NULL,
	ShortDescription VARCHAR(50) NOT NULL,
	LongDescription VARCHAR(3000) NOT  NULL
);

CREATE TABLE OwnedSkills (
	RanksTaken INT NOT NULL,
	CharacterID INT NOT NULL,
	SkillName VARCHAR(16) NOT NULL
);

CREATE TABLE Songs (
	SongName VARCHAR(20) NOT NULL,
	Force VARCHAR(9) NOT NULL,
	EssenceReq INT NOT NULL,
	Duration VARCHAR(25) NOT NULL,
	ShortDescription VARCHAR(50) NOT NULL,
	LongDescription VARCHAR(3000) NOT NULL
);