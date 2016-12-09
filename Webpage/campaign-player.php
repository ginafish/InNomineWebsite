<?php
// Include database connection and functions here.  See 3.1. 
session_start();
include_once 'includes/db_connect.php';
include_once 'includes/functions.php';

?>

<!DOCTYPE html>
<html>
    <head>
        <title>TableSpace - Dashboard</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="home.css">
		<link rel="icon" href="favicon.png">
    </head>
	
    <body>
		<?php if($_SESSION['loggedIn']=="true") { ?>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<?php
					$campID = $_SESSION["CampaignID"];
					$user = $_SESSION["Username"];
						echo"<h3>Player Campaign View</h3>";
					?>
				</div>
			</div>
			<div class="row">
				<div class="col=md-4">		<!-- character data -->
					<?php
					$charName = "";
					$charSuperior = "";
					$choirBandMem = "";
					$chrCorp = "";
					$chrStr = "";
					$chrAgi = "";
					$chrEth = "";
					$chrInt = "";
					$chrPrec = "";
					$chrCel = "";
					$chrWill = "";
					$chrPerc = "";
					$chrEss = "";
					$chrDataQuer = "SELECT CharacterID, CharacterName, Dissonance, Discord, Superior, ChoirBandMembership, Essence FROM Characters WHERE Username =" . $user . "AND CharacterID IN (SELECT CharacterID FROM CharacterCampaignParticipation WHERE CampaignID =" . $campID . ")";
					echo $chrDataQuer . "<br />";
					$chrDatresult = mysqli_query($mysqli, $chrDataQuer);
					$fields_num = mysqli_num_fields($chrDatresult);
						while($row = mysqli_fetch_array($chrDatresult)) {
							for($i=0; $i<$fields_num; $i++)  { 
								$field = mysqli_fetch_field($chrDatresult);
								echo "{$field->name}: "; 
								echo($row[$field->name]); 
								echo('<hr />');
              				}
							$charName = $row['CharacterName'];
							$charSuperior = $row['Superior'];
							$choirBandMem = $row['ChoirBandMembership'];
							$chrEss = $row['Essence'];
						}
					
					$chrCelStatQuer = "SELECT Celestial, Will, Perception, SoulHits FROM CelestialStats WHERE CharacterID = " . $charID;
					$chrCelStatRes = mysqli_query($mysqli, $chrCelStatQuer);
					$fields_num = mysqli_num_fields($chrCelStatRes);
						while($row = mysqli_fetch_array($chrCelStatRes)) {
							for($i=0; $i<$fields_num; $i++)  { 
								$field = mysqli_fetch_field($chrCelStatRes);
								echo "{$field->name}: "; 
								echo($row[$field->name]); 
								echo('<hr />');
              				}
							$chrCel = $row['Celestial'];
							$chrWill = $row['Will'];
							$chrPerc = $row['Perception'];
						}
					
					$chrCorpStatQuer = "SELECT Corporeal, Strength, Agility FROM CorporealStats WHERE CharacterID = " . $charID;
					$chrCorpStatRes = mysqli_query($mysqli, $chrCorpStatQuer);
					$fields_num = mysqli_num_fields($chrCorpStatRes);
						while($row = mysqli_fetch_array($chrCorpStatRes)) {
							for($i=0; $i<$fields_num; $i++)  { 
								$field = mysqli_fetch_field($chrCorpStatRes);
								echo "{$field->name}: "; 
								echo($row[$field->name]); 
								echo('<hr />');
              				}
							$chrCorp = $row['Corporeal'];
							$chrStr = $row['Strength'];
							$chrAgi = $row['Agility'];
						}
					
					$chrEthStatQuer = "SELECT Ethereal, Intelligence, Prec, SoulHits FROM EtherealStats WHERE CharacterID = " . $charID;
					$chrEthStatRes = mysqli_query($mysqli, $chrEthStatQuer);
					$fields_num = mysqli_num_fields($chrCorpStatRes);
						while($row = mysqli_fetch_array($chrCorpStatRes)) {
							for($i=0; $i<$fields_num; $i++)  { 
								$field = mysqli_fetch_field($chrCorpStatRes);
								echo "{$field->name}: "; 
								echo($row[$field->name]); 
								echo('<hr />');
              				}
							$chrEth = $row['Ethereal'];
							$chrInt = $row['Intelligence'];
							$chrPrec = $row['Prec'];
						}
					
					
					$charDataElem = "<span><p>Name: " . $charName . "</p><p>Archangel/Demon Prince: " . $charSuperior . "</p><p>Choir/Band: " . $choirBandMem . "</p><p>Corporeal Forces: " . $chrCorp . "</p><p>Strength: " . $chrStr . "</p><p>Agility: " . $chrAgi . "</p><p>Ethereal Forces: " . $chrEth . "</p><p>Intelligence: " . $chrInt . "</p><p>Precision: " . $chrPrec . "</p><p>Celestial Forces: " . $chrCel . "</p><p>Will: " . $chrWill . "</p><p>Perception: " . $chrPerc . "</p><p>Essence: " . $chrEss . "</p></span>";
					?>
					<!--<span>
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
					</span> -->
					
					<span>
						<textarea>Notes</textarea>
					</span>
				</div>
				<div class="col-md-4">
					<?php
					$skillDataQuer = "SELECT OwnedSkills.SkillName, OwnedSkills.RanksTaken, Skills.BaseSkill, Skills.ShortDescription, Skills.LongDescription FROM OwnedSkills JOIN Skills ON OwnedSkills.SkillName = Skills.SkillName WHERE OwnedSkills.CharacterID = $charID";
					$result = mysqli_query($mysqli, $skillDataQuer);
					$rows = mysqli_fetch_row($result);
					echo "<span>$rows</span>";
					
					$songDataQuer = "SELECT OwnedSongs.SongName, OwnedSongs.Force, OwnedSongs.RanksTaken, Songs.EssenceRequired, Songs.Duration, Songs.Disruption, Songs.ShortDescription, Songs.LongDescription FROM OwnedSongs JOIN Songs ON OwnedSongs.SongName = Songs.SongName AND OwnedSongs.Force = Songs.Force WHERE OwnedSongs.CharacterID = $charID";
					$songResults = mysqli_query($mysqli, $skillDataQuer);
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
<?php
} else { 
        echo 'You have created a disturbance in the symphony, please login.';
}
?>	
	</body>
</html>