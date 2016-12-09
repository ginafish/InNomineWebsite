<?php
	$_SESSION['CampaignID'] = $_POST["CampaignID"];
	if(!isset($_POST['CampaignID'])){
		echo("I'm broken");
	} else {
		#echo($_SESSION['CampaignID']);
		#echo($_POST["CampaignID"]);
		header('Location: ../../campaign-gm.php');
	}

?>