<?php
	$_SESSION['CampaignID'] = $_POST['CampaignID'];
	echo($_POST['CampaignID']);
	header('Location: ../../campaign-gm.php');
?>