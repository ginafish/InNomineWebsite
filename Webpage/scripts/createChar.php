<?php
session_start();
include_once 'includes/db_connect.php';
include_once 'includes/functions.php';

$campID = $_POST['newCampID'];
$characterName = $_POST['charName'];
$choirBandMem = $_POST['bandchoir'];
$cbName = $_POST['race'];
$superior = $_POST['superior'];
$corp = $_POST['corppoints'];
$eth = $_POST['ethpoints'];
$celes = $_POST['celpoints'];
$str = $_POST['str'];
$agi = $_POST['agi'];
$intel = $_POST['int'];
$prec = $_POST['prec'];
$will = $_POST['will'];
$prec = $_POST['perc'];

$getNextCharIDQuer = "SELECT MAX(CharacterID) AS LastID FROM Characters";
$nextIDRes = mysqli_query($mysqli, $getNextCharIDQuer);
$lastID = mysqli_fetch_array($chrCelStatRes);
$lastID = $lastID['LastID'];
echo($lastID);
$nextID = $lastID + 1;

$charInsQuer = "INSERT INTO Characters (CharacterID, CharacterName, Superior, ChoirBandMembership, ChoirBandName, Essence, OwnerUsername) VALUES (" . $nextID . "," . $characterName . ", " . $superior . ", " . $choirBandMem . ", " . $cbName . ", " . $essence . ", " . $_SESSION['username'] . ");";
if(!mysqli_query($mysqli, $charInsQuer)){
	echo("Character Data Insert failed.");
}

$corpInsQuer = "INSERT INTO CorporealStats VALUES (" . $nextID . ", " . $corp . ", " . $str . ", " . $agi . ");";
if(!mysqli_query($mysqli, $corpInsQuer)){
	echo("Corporeal Insert failed.");
}

$ethInsQuer = "INSERT INTO EtherealStats (CharacterID, Ethereal, Intelligence, Prec) VALUES (" . $nextID . ", " . $eth . ", " . $intel . ", " . $prec . ");";
if(!mysqli_query($mysqli, $ethInsQuer)){
	echo("Ethereal Insert failed.");
}

$celInsQuer = "INSERT INTO CelestialStats (CharacterID, Celestial, Will, Perception) VALUES (" . $nextID . ", " . $celes . ", " . $will . ", " . $perc . ");";
if(!mysqli_query($mysqli, $celInsQuer)){
	echo("Celestial Insert failed.");
}

$joinCampQuer = "INSERT INTO CharacterCampaignParticipation VALUES (" . $campID . ", " . $nextID . ", " . ($int * $eth) . ", " . ($will * $celes) . ", 0);";
if(!mysqli_query($mysqli, $joinCampQuer)){
	echo("Campaign Join add failed.");
}


#header('Location: ../../dashboard.php');
?>