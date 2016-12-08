<?php
// Include database connection and functions here.  See 3.1. 
sec_session_start(); 
if(login_check($mysqli) == true) {
        // Add your protected page content here!
} else { 
        echo 'You are not authorized to access this page, please login.';
}
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>TableSpace - Dashboard</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="styles/main.css" />
    </head>
    <body>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<?php 
						echo"<h3>$campaignName</h3>"
					?>
				</div>
			</div>
			<div class="row">
				<div class="col=md-4">		<!-- character data -->
					<?php 
					$chrDataQuer = "SELECT CharacterID, CharacterName, Dissonance, Discord, Superior, ChoirBandMembership, Essence FROM Characters WHERE Username = $user AND CharacterID IN (SELECT CharacterID FROM CharacterCampaignParticipation WHERE CampaignID = $campID)";
					$chrDatresult = mysqli_query($credentials, $chrDataQuer);
					$chrResRows = mysqli_fetch_row($chrDatresult);
					
					#need to assign results to $vars
					
					$chrCelStatQuer = "SELECT Celestial, Will, Perception, SoulHits FROM CelestialStats WHERE CharacterID = $charID";
					$chrCelStatRes = mysqli_query($credentials, $chrCelStatQuer);
					$chrCelStatResRows = mysqli_fetch_row($chrCelStatRes);
					
					$chrCorpStatQuer = "SELECT Corporeal, Strength, Agility FROM CorporealStats WHERE CharacterID = $charID";
					$chrCorpStatRes = mysqli_query($credentials, $chrCorpStatQuer);
					$chrCorpStatResRows = mysqli_fetch_row($chrCorpStatRes);
					
					$chrEthStatQuer = "SELECT Ethereal, Intelligence, Prec, SoulHits FROM EtherealStats WHERE CharacterID = $charID";
					$chrEthStatRes = mysqli_query($credentials, $chrEthStatQuer);
					$chrEthStatResRows = mysqli_fetch_row($chrEthStatRes);
					
					
					$charDataElem = "<span><p>Name: $charName</p><p>Archangel/Demon Prince: $charSuperior</p><p>Choir/Band: $choirBandMem</p><p>Corporeal Forces: $chrCorp</p><p>Strength: $chrStr</p><p>Agility: $chrAgi</p><p>Ethereal Forces: $chrEth</p><p>Intelligence: $chrInt</p><p>Precision: $chrPrec</p><p>Celestial Forces: $chrCel</p><p>Will: $chrWill</p><p>Perception: $chrPerc</p><p>Essence: $chrEss</p></span>";
					?>
					<span>
						<p>Name:</p>
						<p>Archangel/Demon Prince</p>
						<p>Choir/Band</p>
						<p>Corporeal Forces</p>
						<p>Str</p>
						<p>Agi</p>
						<p>Ethereal Forces:</p>
						<p>Int</p>
						<p>Precision</p>
						<p>Celestial Forces:</p>
						<p>Will</p>
						<p>Perception</p>
						<p>Essence:</p>
					</span>
					
					<span>
						<textarea>Notes</textarea>
					</span>
				</div>
				<div class="col-md-4">
					<?php
					?skillDataQuer = "SELECT OwnedSkills.SkillName, OwnedSkills.RanksTaken, Skills.BaseSkill, Skills.ShortDescription, Skills.LongDescription FROM OwnedSkills JOIN Skills ON OwnedSkills.SkillName = Skills.SkillName WHERE OwnedSkills.CharacterID = $charID";
					$result = mysqli_query($credentials, $skillDataQuer);
					$rows = mysqli_fetch_row($result);
					echo "<span>$rows</span>";
					
					$songDataQuer = "SELECT OwnedSongs.SongName, OwnedSongs.Force, OwnedSongs.RanksTaken, Songs.EssenceRequired, Songs.Duration, Songs.Disruption, Songs.ShortDescription, Songs.LongDescription FROM OwnedSongs JOIN Songs ON OwnedSongs.SongName = Songs.SongName AND OwnedSongs.Force = Songs.Force WHERE OwnedSongs.CharacterID = $charID";
					$songResults = mysqli_query($credentials, $skillDataQuer);
					$songRows = mysqli_fetch_row($result);
					echo "<span>$songRows</span>";
					?>
				</div>
				<div class="col-md-4">
					<?php
					?>
				</div>
			</div>
		</div>
	</body>
</html>