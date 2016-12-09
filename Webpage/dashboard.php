<?php
session_start(); 
include_once 'includes/db_connect.php';
include_once 'includes/functions.php';

?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>TableSpace - Dashboard</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="home.css">
		<link rel="icon" href="favicon.png">
		<style>
			input[type="submit"] {
				color: black;
			}
		</style>
    </head>
    <body>
		<a href="logout.php">Logout?</a>
		<?php
		if($_SESSION['loggedIn']=="true") : 
			$user = $_SESSION['username'];
		echo("Logged in as: $user");
		$_SESSION['CampaignID'] = NULL;
		?>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Dashboard</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<h3>Player Campaigns</h3>
					<?php
					/*if($_SESSION['loggedIn']=="true") : 
						$user = $_SESSION['username'];*/
					$playerQuery = "SELECT camps.CampaignID, camps.CampaignName, camps.CampaignBlurb, charac.OwnerUsername, charac.CharacterName, charac.CharacterID, ccp.KickedStatus FROM Campaigns camps LEFT JOIN CharacterCampaignParticipation ccp ON camps.CampaignID = ccp.CampaignID JOIN Characters charac ON ccp.CharacterID = charac.CharacterID WHERE charac.OwnerUsername = '";
					$playerQuery .= $user . "'";
					$result = mysqli_query($mysqli, $playerQuery) or die(mysqli_error($link));
					if(mysqli_connect_errno()){
						printf("Connection failed: %s\n", mysqli_connect_error());
						exit();
					}
					if($result === FALSE){
						echo("<p>You have no characters.</p>");
					}
					else {
						$fields_num = mysqli_num_fields($result);
						while($row = mysqli_fetch_array($result)) {
							echo("<span width=100 style='border: 1px black'>");
							echo('<form action=".\campaign-player.php" method="post">');
							
							echo ('<input type="text" name="CampaignID" value="');
							echo ($row['CampaignID']);
							echo ('" hidden>');
							echo "CampaignID: ";
							echo($row['CampaignID']);
							echo('</input><br />');
							
							echo ('<input type="text" name="CampaignName" value="');
							echo ($row['CampaignName']);
							echo ('" hidden>');
							echo "Campaign Name: ";
							echo($row['CampaignName']);
							echo('</input><br />');
							
							echo ('<input type="text" name="CampaignBlurb" value="');
							echo ($row['CampaignBlurb']);
							echo ('" hidden>');
							echo "Campaign Blurb: ";
							echo($row['CampaignBlurb']);
							echo('</input><br />');
							
							echo ('<input type="text" name="OwnerUsername" value="');
							echo ($row['OwnerUsername']);
							echo ('" hidden>');
							echo('</input>');
							
							echo ('<input type="text" name="CharacterName" value="');
							echo ($row['CharacterName']);
							echo ('" hidden>');
							echo "Character Name: ";
							echo($row['CharacterName']);
							echo('</input><br />');
							
							echo ('<input type="text" name="CharacterID" value="');
							echo ($row['CharacterID']);
							echo ('" hidden>');
							echo('</input>');
							
							echo ('<input type="text" name="KickedStatus" value="');
							echo ($row['KickedStatus']);
							echo ('" hidden>');
							echo('</input>');
							
							
							echo "<input type='submit' id='btnGoToCamp' value='Open'></input>";
							echo('</form>');
							echo("</span>");
							echo("<hr />");
						}
						mysqli_free_result($result);
					}
					?>
					<p><a href=".\charactercreate.php">Join a campaign</a></p>
				</div>
				<div class="col-md-6">
					<h3>GM Campaigns</h3>
					<?php
					$gmQuery = "SELECT CampaignID, CampaignName, CampaignBlurb, GameMasterUsername FROM Campaigns WHERE GameMasterUsername = '";
					$gmQuery .= $user . "'";
					$result = mysqli_query($mysqli, $gmQuery) or die(mysqli_error($link));
					if(mysqli_connect_errno($mysqli)){
						echo("Connection failed: " . mysqli_error($mysqli));
						exit();
					}
					#echo(mysqli_num_rows($result));
					if($result === FALSE){
						echo("<p>You have no campaigns.</p>");
					}
					else {
						$fields_num = mysqli_num_fields($result);
						while($row = mysqli_fetch_array($result)) {
							echo("<span width=100 style='border: 1px black'>");
							echo('<form action=".\campaign-gm.php" method="post">');
							
							echo ('<input type="text" name="CampaignID" value="');
							echo ($row['CampaignID']);
							echo ('" hidden>');
							echo "CampaignID: ";
							echo($row['CampaignID']);
							echo('</input><br />');
							
							echo ('<input type="text" name="CampaignName" value="');
							echo ($row['CampaignName']);
							echo ('" hidden>');
							echo "Campaign Name: ";
							echo($row['CampaignName']);
							echo('</input><br />');
							
							echo ('<input type="text" name="CampaignBlurb" value="');
							echo ($row['CampaignBlurb']);
							echo ('" hidden>');
							echo "Campaign Blurb: ";
							echo($row['CampaignBlurb']);
							echo('</input><br />');
							
							echo ('<input type="text" name="GameMasterUsername" value="');
							echo ($row['GameMasterUsername']);
							echo ('" hidden>');
							echo "Game Master: ";
							echo($row['GameMasterUsername']);
							echo('</input><br />');
							
							
							echo "<input type='submit' id='btnGoToCamp' value='Open'></input>";
							echo('</form>');
							echo("</span>");
							echo("<hr />");
						}
						mysqli_free_result($result);
					}
					?>
					<p><br /><a href=".\managecampaign.php">Create a campaign</a></p>
				</div>
			</div>
		</div>
		<?php else : ?> 
            <p> 
                <span class="error">You have created a disturbance in the symphony, please <a href="http://www.tablespace.org">login</a> and try again. </span> 
            </p> 
  <?php  endif; ?> 
    </body>
</html>
