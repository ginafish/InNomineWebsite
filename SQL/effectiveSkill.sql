--Character skills proceedure: Take $characterID and process their skill list and attributes and gives the 'effective skill' for each owned skill

function effectiveSkillCalc (in $characterID, in $skillName)
returns int
deterministic
begin
	declare effectSkl int;
	declare bsSkll VARCHAR(4);
	set bsSkll = (SELECT baseSkill FROM Skills WHERE SkillName = $skillName);
	
	declare skillStatModify int;
	IF (bsSkll = 'STR') THEN
		set skillStatModify = (SELECT Strength FROM CorporealStats WHERE CharacterID = $characterID);
	ELSE IF (bsSkll = 'AGI') THEN
		set skillStatModify = (SELECT Agility FROM CorporealStats WHERE CharacterID = $characterID);
	ELSE IF (bsSkll = 'INT') THEN
		set skillStatModify = (SELECT Intelligence FROM EtherealStats WHERE CharacterID = $characterID);
	ELSE IF (bsSkll = 'PREC') THEN
		set skillStatModify = (SELECT Prec FROM EtherealStats WHERE CharacterID = $characterID);
	ELSE IF (bsSkll = 'WILL') THEN
		set skillStatModify = (SELECT Will FROM CelestialStats WHERE CharacterID = $characterID);
	ELSE
		set skillStatModify = (SELECT Perception FROM CelestialStats WHERE CharacterID = $characterID);
	end if;	
	
	set effectSkl = (SELECT DefaultCheck FROM Skill WHERE SkillName = $skillName)
	
	set effectSkl = effectSkl + skillStatModify;
	return effectSkl;
end;