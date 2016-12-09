<?php
// Include database connection and functions here.  See 3.1. 
session_start();
#echo "Character ID: " . $_POST['CharacterID'];
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
		
		<style>
			#playernotes {
				width: 100%;
				height: 40vh;
			}
		</style>
		
    </head>
	
    <body>
		<?php if($_SESSION['loggedIn']=="true") { ?>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<?php
					$_SESSION['CampaignID'] = $_POST["CampaignID"];				
					$campID = $_SESSION["CampaignID"];
					$user = $_POST["OwnerUsername"];
					$_SESSION['User'] = $user;
					$charID = $_POST['CharacterID'];
					?>
					<h3>Player Campaign View</h3>
					
					<span class="pull-right">
						<a href="dashboard.php">Back to dashboard.</a>
					</span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<?php
					$charName = "";
					$charSuperior = "";
					$choirBandNam = "";
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
	
					$chrDataQuer = 'SELECT CharacterID, CharacterName, Superior, ChoirBandName, Essence FROM Characters WHERE CharacterID = "' . $charID . '"';
					#echo $chrDataQuer . "<br />";
					$chrDatresult = mysqli_query($mysqli, $chrDataQuer);
					$fields_num = mysqli_num_fields($chrDatresult);
						while($row = mysqli_fetch_array($chrDatresult)) {
							$charName = $row['CharacterName'];
							$charSuperior = $row['Superior'];
							$choirBandMem = $row['ChoirBandName'];
							$chrEss = $row['Essence'];
						}
					
					$chrCelStatQuer = "SELECT Celestial, Will, Perception, SoulHits FROM CelestialStats WHERE CharacterID = " . $charID;
					$chrCelStatRes = mysqli_query($mysqli, $chrCelStatQuer);
					$fields_num = mysqli_num_fields($chrCelStatRes);
						while($row = mysqli_fetch_array($chrCelStatRes)) {
							$chrCel = $row['Celestial'];
							$chrWill = $row['Will'];
							$chrPerc = $row['Perception'];
						}
					
					$chrCorpStatQuer = "SELECT Corporeal, Strength, Agility FROM CorporealStats WHERE CharacterID = " . $charID;
					$chrCorpStatRes = mysqli_query($mysqli, $chrCorpStatQuer);
					$fields_num = mysqli_num_fields($chrCorpStatRes);
						while($row = mysqli_fetch_array($chrCorpStatRes)) {
							$chrCorp = $row['Corporeal'];
							$chrStr = $row['Strength'];
							$chrAgi = $row['Agility'];
						}
					
					$chrEthStatQuer = "SELECT Ethereal, Intelligence, Prec, MindHits FROM EtherealStats WHERE CharacterID = " . $charID;
					$chrEthStatRes = mysqli_query($mysqli, $chrEthStatQuer);
					$fields_num = mysqli_num_fields($chrEthStatRes);
						while($row = mysqli_fetch_array($chrEthStatRes)) {
							$chrEth = $row['Ethereal'];
							$chrInt = $row['Intelligence'];
							$chrPrec = $row['Prec'];
						}
					
	
					echo("<hr />");
	
					$charDataElem = "Name: " . $charName . "<br />Archangel/Demon Prince: " . $charSuperior . "<br />Choir/Band: " . $choirBandMem . "<br />Corporeal Forces: " . $chrCorp . "<br />Strength: " . $chrStr . "<br />Agility: " . $chrAgi . "<br />Ethereal Forces: " . $chrEth . "<br />Intelligence: " . $chrInt . "<br />Precision: " . $chrPrec . "<br />Celestial Forces: " . $chrCel . "<br />Will: " . $chrWill . "<br />Perception: " . $chrPerc . "<br />Essence: " . $chrEss . "<br />";
					
					echo($charDataElem);
					?>
					
					<hr />
					<span>
						<textarea id="playernotes" value="Put temporary notes here"></textarea>
					</span>
					<hr />
				</div>
				<div class="col-md-4">
					<hr />
					<?php
					echo("<h4>Skills:</h4>");
					$skillDataQuer = "SELECT OwnedSkills.SkillName, OwnedSkills.RanksTaken, Skills.BaseSkill, Skills.ShortDescription, Skills.LongDescription FROM OwnedSkills JOIN Skills ON OwnedSkills.SkillName = Skills.SkillName WHERE OwnedSkills.CharacterID = " . $charID;
					#echo($skillDataQuer);
					$result = mysqli_query($mysqli, $skillDataQuer);
					$fields_num = mysqli_num_fields($result);
						while($row = mysqli_fetch_array($result)) {
							echo "Skill: " . $row['SkillName'] . "<br />Ranks Taken: " . $row['RanksTaken'] . "<br />Base Skill: " . $row['BaseSkill'] . "<br />Short Description: " . $row['ShortDescription'] . "<br />";
						}
					mysqli_free_result($result);
					echo("<hr />");
					
					echo("<h4>Songs:</h4>");
					$songDataQuer = "SELECT OwnedSongs.SongName, OwnedSongs.SongForce, OwnedSongs.RanksTaken, Songs.EssenceReq, Songs.Duration, Songs.ShortDescription, Songs.LongDescription FROM OwnedSongs JOIN Songs ON OwnedSongs.SongName = Songs.SongName AND OwnedSongs.SongForce = Songs.SongForce WHERE OwnedSongs.CharacterID = " . $charID;
					#echo "<br />" . $songDataQuer . "<br />";
					$songResults = mysqli_query($mysqli, $songDataQuer);
					$fields_num = mysqli_num_fields($songResults);
						while($othRow = mysqli_fetch_array($songResults)) {
							echo "Song: " . $othRow['SongName'] . "<br />Ranks Taken: " . $othRow['RanksTaken'] . "<br />Force: " . $othRow['SongForce'] . "<br />Essence Required: " . $othRow['EssenceReq'] . "<br />Duration: " . $othRow['Duration'] . "<br />Short Description: " . $othRow['ShortDescription'] . "<br />";
						}
					echo("<hr />");
					?>
				</div>
				<div class="col-md-4">
					<hr />
					<?php
					echo "Vessels will reside here.<hr />";
	
					$chrHPQuer = "SELECT CurrentMindHits, CurrentSoulHits FROM CharacterCampaignParticipation WHERE CharacterID = " . $charID . " AND CampaignID = " . $campID;
					$chrHPRes = mysqli_query($mysqli, $chrHPQuer);
					$fields_num = mysqli_num_fields($chrHPRes);
					while($row = mysqli_fetch_array($chrHPRes)) {
						echo "Mind HP: " . $row['CurrentMindHits'] . "<br />Soul HP: " . $row['CurrentSoulHits'];
					}
					echo("<hr />");
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
