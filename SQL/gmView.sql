-- Generate character list:
SELECT CharacterName, CharacterID FROM Characters WHERE CharacterID IN 
	(SELECT CharacterID FROM CharacterCampaignParticipation WHERE CampaignID=$CampaignID AND KickedStatus!=1)

-- Current campaign data:
SELECT CampaignName, IngameDate, IngameTime FROM Campaigns WHERE CampaignID=$CampaignID

-- Character Skills Query:
SELECT Skills.SkillName, OwnedSkills.RanksTaken FROM Skills JOIN OwnedSkills ON Skills.SkillName=OwnedSkills.SkillName WHERE OwnedSkills.CharacterID=2

