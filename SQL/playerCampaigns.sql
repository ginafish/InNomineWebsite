--Character Data Query:

SELECT CharacterID, CharacterName, Dissonance, Discord, Superior, ChoirBandMembership, Essence
FROM Characters
WHERE Username = $user
AND CharacterID IN (SELECT CharacterID FROM CharacterCampaignParticipation WHERE CampaignID = $campID)

--After that query, save the CharacterID for these queries:

--Skills
SELECT OwnedSkills.SkillName, OwnedSkills.RanksTaken, Skills.BaseSkill, Skills.ShortDescription, Skills.LongDescription
FROM OwnedSkills JOIN Skills ON OwnedSkills.SkillName = Skills.SkillName
WHERE OwnedSkills.CharacterID = $charID

--Songs
SELECT OwnedSongs.SongName, OwnedSongs.Force, OwnedSongs.RanksTaken, Songs.EssenceRequired, Songs.Duration, Songs.Disruption, Songs.ShortDescription, Songs.LongDescription
FROM OwnedSongs JOIN Songs ON OwnedSongs.SongName = Songs.SongName AND OwnedSongs.Force = Songs.Force
WHERE OwnedSongs.CharacterID = $charID

