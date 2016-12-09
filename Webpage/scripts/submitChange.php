<?php
session_start();
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';

	if(!isset($_SESSION['CampaignID'])){
		echo("I'm broken");
	} else {
		$name=mysqli_real_escape_string($mysqli, $_POST['campName']);
		$name=htmlspecialchars($name);
		$pass=mysqli_real_escape_string($mysqli, $_POST['campPass']);
		$rstr=mysqli_real_escape_string($mysqli, $_POST['playerRestr']);
		$blurb=htmlspecialchars($_POST['campBlurb']);
		$blurb=mysqli_real_escape_string($mysqli, $blurb);
		$submitUpdate="UPDATE Campaigns SET CampaignName='".$name."', CampaignPassword='".$pass."'";
		$submitUpdate.=", CharacterRestrictions='".$rstr."', CampaignBlurb='".$blurb."', PlayerLimit='".$_POST['maxPlayers']."' WHERE CampaignID = '".$_SESSION['CampaignID']."'";
		$result=mysqli_query($mysqli, $submitUpdate);
		if($result==1){
			header('Location: ../../dashboard.php');
		} else {
			echo "HELP!";
		}
	}	
