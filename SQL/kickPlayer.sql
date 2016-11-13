UPDATE CharacterCampaignParticipation
SET kickedStatus = True
WHERE CampaignID = $campaign, CharacterID = $kickedchar