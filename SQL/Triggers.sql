CREATE TRIGGER `validateMaxPlayers` AFTER UPDATE ON `Campaigns`
 FOR EACH ROW BEGIN
  UPDATE Campaigns 
	SET PlayerLimit = 
		(SELECT COUNT(CharacterID) FROM CharacterCampaignParticipation WHERE
        CharacterCampaignParticipation.CampaignID = NEW.CampaignID)
    WHERE PlayerLimit<
	(SELECT COUNT(CharacterID) FROM CharacterCampaignParticipation WHERE CharacterCampaignParticipation.CampaignID=NEW.CampaignID);
END
