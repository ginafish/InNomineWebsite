CREATE TABLE Users (
	Username VARCHAR(12) NOT NULL,
	UserPassword VARCHAR(18) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	PRIMARY KEY (Username)
);

CREATE TABLE Campaigns (
	CampaignID INT NOT NULL AUTO_INCREMENT,
	CampaignPassword VARCHAR(12),
	IngameDate VARCHAR(50),
	IngameTime VARCHAR(50),
	GameMasterUsername VARCHAR(12) NOT NULL,
	PRIMARY KEY(CampaignID),
	FOREIGN KEY(GameMasterUsername) REFERENCES Users(Username) ON UPDATE CASCADE
);

CREATE TABLE CharacterCampaignParticipation (
	CampaignID INT NOT NULL,
	CharacterID INT NOT NULL,
	CurrentMindHits INT NOT NULL,
	CurrentSoulHits INT NOT NULL,
	KickedStatus BOOLEAN DEFAULT 0,
	FOREIGN KEY(CampaignID) REFERENCES Campaigns(CampaignID) ON UPDATE CASCADE,
	FOREIGN KEY(CharacterID) REFERENCES Characters(CharacterID) ON UPDATE CASCADE,
	PRIMARY KEY(CharacterID, CampaignID)
);

CREATE TABLE Characters (
	CharacterID INT NOT NULL AUTO_INCREMENT,
	CharacterName VARCHAR(30) NOT NULL,
	Dissonance VARCHAR(15),
	Discord VARCHAR(15),
	Superior VARCHAR(20) NOT NULL,
	ChoirBandMembership VARCHAR(1) NOT NULL,
	ChoirBandName VARCHAR(20) NOT NULL,
	Essence INT NOT NULL,
	OwnerUsername VARCHAR(12) NOT NULL,
	PRIMARY KEY(CharacterID)
);

CREATE TABLE CorporealStats (
	CharacterID INT NOT NULL,
	Corporeal INT NOT NULL,
	Strength INT NOT NULL,
	Agility INT NOT NULL,
	FOREIGN KEY(CharacterID) REFERENCES Characters(CharacterID) ON UPDATE CASCADE,
	PRIMARY KEY(CharacterID)
);

CREATE TABLE CelestialStats (
	CharacterID INT NOT NULL,
	Celestial INT NOT NULL,
	Will INT NOT NULL,
	Perception INT NOT NULL,
	SoulHits INT NOT NULL,
	FOREIGN KEY(CharacterID) REFERENCES Characters(CharacterID) ON UPDATE CASCADE,
	PRIMARY KEY(CharacterID)
);

CREATE TABLE EtherealStats (
	CharacterID INT NOT NULL,
	Ethereal INT NOT NULL,
	Intelligence INT NOT NULL,
	Prec INT NOT NULL,
	SoulHits INT NOT NULL,
	FOREIGN KEY(CharacterID) REFERENCES Characters(CharacterID) ON UPDATE CASCADE,
	PRIMARY KEY(CharacterID)
);

CREATE TABLE Vessels (
	VesselID INT NOT NULL AUTO_INCREMENT,
	CharacterID INT NOT NULL,
	VesselName VARCHAR(15) NOT NULL,
	Role VARCHAR(20),
	HitPoints INT NOT NULL,
	FOREIGN KEY(CharacterID) REFERENCES Characters(CharacterID) ON UPDATE CASCADE,
	PRIMARY KEY(VesselID)
);

CREATE TABLE ActiveVessels (
	CampaignID INT NOT NULL,
	VesselID INT NOT NULL,
	CurrentHitPoints INT NOT NULL,
	FOREIGN KEY(CampaignID) REFERENCES Campaigns(CampaignID) ON UPDATE CASCADE,
	FOREIGN KEY(VesselID) REFERENCES Vessels(VesselID) ON UPDATE CASCADE,
	PRIMARY KEY(CampaignID, VesselID)
);

CREATE TABLE Items (
	ItemID INT NOT NULL AUTO_INCREMENT,
	ItemName VARCHAR(30) NOT NULL,
	Damage INT,
	ItemDescription VARCHAR(200),
	CharacterID INT NOT NULL,
	PRIMARY KEY(ItemID),
	FOREIGN KEY(CharacterID) REFERENCES Characters(CharacterID) ON UPDATE CASCADE
);

CREATE TABLE Skills (
	SkillName VARCHAR(16) NOT NULL,
	BaseSkill VARCHAR(4) NOT NULL,
	DefaultCheck INT NOT NULL,
	ShortDescription VARCHAR(50) NOT NULL,
	LongDescription VARCHAR(3000) NOT  NULL,
	PRIMARY KEY(SkillName)
);

CREATE TABLE OwnedSkills (
	RanksTaken INT NOT NULL,
	CharacterID INT NOT NULL,
	SkillName VARCHAR(16) NOT NULL,
	FOREIGN KEY(CharacterID) REFERENCES Characters(CharacterID) ON UPDATE CASCADE,
	FOREIGN KEY(SkillName) REFERENCES Skills(SkillName) ON UPDATE CASCADE,
	PRIMARY KEY(CharacterID, SkillName)
);

CREATE TABLE Songs (
	SongName VARCHAR(20) NOT NULL,
	SongForce VARCHAR(9) NOT NULL,
	EssenceReq INT NOT NULL,
	Duration VARCHAR(25) NOT NULL,
	ShortDescription VARCHAR(50) NOT NULL,
	LongDescription VARCHAR(3000) NOT NULL,
	PRIMARY KEY(SongName, SongForce)
);

CREATE TABLE OwnedSongs (
	CharacterID INT NOT NULL,
	SongName VARCHAR(20) NOT NULL,
	SongForce VARCHAR(9) NOT NULL,
	RanksTaken INT NOT NULL,
	FOREIGN KEY(CharacterID) REFERENCES Characters(CharacterID) ON UPDATE CASCADE,
	FOREIGN KEY(SongName) REFERENCES Songs(SongName) ON UPDATE CASCADE,
	FOREIGN KEY(SongForce) REFERENCES Songs(Force) ON UPDATE CASCADE,
	PRIMARY KEY(CharacterID, SongName, SongForce)
);