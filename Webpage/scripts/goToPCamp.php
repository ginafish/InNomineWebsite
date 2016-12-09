<?php
	session_start();
	$_SESSION['CampaignID'] = $_GET['CampaignID'];
	$_SESSION['CharacterID'] = $_GET['CharacterID'];
	header('Location: ../../campaign-player.php');
?>
