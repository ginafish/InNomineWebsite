<?php
session_start();
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';

	if(!isset($_SESSION['CampaignID'])){
		echo("I'm broken");
	} else {
		$submitUpdate="UPDATE Campaigns SET CampaignName='".$_POST['campName']."', CampaignPassword='".$_POST['campPass']."'";
		$submitUpdate.=", CharacterRestrictions='".$_POST['playerRestr']."', CampaignBlurb='".$_POST['campBlurb']."', PlayerLimit='".$_POST['maxPlayers']."' WHERE CampaignID = '".$_SESSION['CampaignID']."'";
		$result=mysqli_query($mysqli, $submitUpdate);
		if($result==1){
			header('Location: ../../dashboard.php');
		} else {
			echo "HELP!";
		}
	}	
