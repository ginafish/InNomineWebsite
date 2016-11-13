SELECT camps.CampaignName, camps.CampaignBlurb, camps.GameMasterUsername, charac.CharacterName 
FROM Campaigns camps
LEFT JOIN CharacterCampaignParticipation ccp
	ON camps.CampaignID = ccp.CampaignID)
JOIN Characters charac
	ON (ccp.CharacterID = charac.CharacterID)
WHERE camps.GameMasterUsername = $user
	OR charac.Username = $user