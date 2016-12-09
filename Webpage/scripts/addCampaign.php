<?php
session_start();
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';

	if(!isset($_POST['campName'])){
		echo("I'm broken");
	} else {
		$submitNew="INSERT INTO Campaigns (CampaignName, CampaignPassword, CharacterRestrictions, CampaignBlurb, PlayerLimit, GameMasterUsername) VALUES('".$_POST['campName']."', '".$_POST['campPass']."', '".$_POST['playerRestr']. "', '".$_POST['campBlurb']. "', '".$_POST['maxPlayers']."', '".$_SESSION['username']."')";
		$result=mysqli_query($mysqli, $submitNew);
		if($result==1){
			header('Location: ../../dashboard.php');
		} else {
			echo "HELP!";
		}
	}	
