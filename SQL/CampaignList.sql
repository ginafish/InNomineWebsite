--Campaigns GM of:
SELECT CampaignName, CampaignBlurb, GameMasterUsername
FROM Campaigns
WHERE GameMasterUsername = $user


--Campaigns that have character in:
SELECT camps.CampaignName, camps.CampaignBlurb, charac.OwnerUsername,charac.CharacterName 
FROM Campaigns camps
LEFT JOIN CharacterCampaignParticipation ccp
	ON camps.CampaignID = ccp.CampaignID
JOIN Characters charac
	ON ccp.CharacterID = charac.CharacterID
WHERE charac.OwnerUsername = $user