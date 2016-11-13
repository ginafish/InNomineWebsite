SELECT Campaigns.CampaignName, Campaigns.CampaignBlurb, Campaigns.GameMasterUsername, Characters.CharacterName 
FROM CharacterCampaignParticipation LEFT JOIN Campaigns JOIN Characters
	ON (CharacterCampaignParticipation.CampaignID = Campaigns.CampaignID)
	AND (CharacterCampaignParticipation.CharacterID = Characters.CharacterID)
	AS CampChars
WHERE CampChars.GameMasterUsername = $user
	OR CampChars.Username = $user