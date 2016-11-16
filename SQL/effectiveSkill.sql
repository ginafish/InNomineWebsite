CREATE DEFINER=`cpses_tu913vF31i`@`localhost` FUNCTION `SkillCalc`(`characterID` INT(1), `skllNm` VARCHAR(20)) RETURNS int(1)
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

SET effectSkl = (SELECT DefaultCheck FROM Skills WHERE SkillName = skllNm);
SET effectSkl = (effectSkl + skillStatModify);

RETURN (effectSkl);
END
