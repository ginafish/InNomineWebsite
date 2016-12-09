<?php
session_start();
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';

	if(!isset($_POST['campName'])){
		echo("I'm broken");
	} else {
		$submitNew="INSERT INTO Campaigns CampaignName='".$_POST['campName']."', CampaignPassword='".$_POST['campPass']."'";
		$submitNew.=", CharacterRestrictions='".$_POST['playerRestr']."', CampaignBlurb='".$_POST['campBlurb']."', PlayerLimit='".$_POST['maxPlayers']."'";
		echo $submitNew;
		$result=mysqli_query($mysqli, $submitNew);
		if($result==1){
			header('Location: ../../dashboard.php');
		} else {
			echo "HELP!";
		}
	}	
