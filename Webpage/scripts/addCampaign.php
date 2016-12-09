<?php
session_start();
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';

	if(!isset($_POST['campName'])){
		echo("I'm broken");
	} else {
		$name=mysqli_real_escape_string($mysqli, $_POST['campName']);
		$name=htmlspecialchars($name);
		$pass=mysqli_real_escape_string($mysqli, $_POST['campPass']);
		$rstr=mysqli_real_escape_string($mysqli, $_POST['playerRestr']);
		$blurb=htmlspecialchars($_POST['campBlurb']);
		$blurb=mysqli_real_escape_string($mysqli, $blurb);
		$submitNew="INSERT INTO Campaigns (CampaignName, CampaignPassword, CharacterRestrictions, CampaignBlurb, PlayerLimit, GameMasterUsername) VALUES('".$name."', '".$pass."', '".$rstr. "', '".$blurb. "', '".$_POST['maxPlayers']."', '".$_SESSION['username']."')";
		$result=mysqli_query($mysqli, $submitNew);
		if($result==1){
			header('Location: ../../dashboard.php');
		} else {
			echo "HELP!";
		}
	}	
