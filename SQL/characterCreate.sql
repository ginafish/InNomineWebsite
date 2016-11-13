INSERT INTO Characters
VALUES ($characterName, $dissonance, $discord, $superior, $choirBandMem, $essence, $user)

/*make this some kind of trigger or something to store CharacterID in a variable, since CharacterID is an autogennumthing???*/

INSERT INTO CorporealStats
VALUES ($characterID, $str, $agi, $corp)

INSERT INTO CelestialStats
VALUES ($characterID, $will, $perc, $soulhp, $celes)

INSERT INTO EtherealStats
VALUES ($characterID, $int, $prec, $mindhp, $eth)

INSERT INTO Vessels
VALUES ($characterID, $vesselName, $vesselRole, $hitPoints)

INSERT INTO Items
VALUES ($characterID, $itemName, $dmg, $itmdesc)

INSERT INTO OwnedSkills
VALUES ($characterID, $skillName, $ranksTaken)

INSERT INTO OwnedSongs
VALUES ($characterID, $songName, $force, $ranksTaken)
