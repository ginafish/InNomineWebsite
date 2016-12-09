<?php
session_start();
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';

$campID = $_POST['newCampID'];
$characterName = $_POST['charName'];
$choirBandMem = $_POST['bandchoir'];
$cbName = $_POST['race'];
$superior = $_POST['superior'];
$corp = $_POST['corppoints'];
$eth = $_POST['ethpoints'];
$celes = $_POST['celespoints'];
$str = $_POST['str'];
$agi = $_POST['agi'];
$intel = $_POST['int'];
$prec = $_POST['prec'];
$will = $_POST['will'];
$perc = $_POST['perc'];
$essence = 6;

$getNextCharIDQuer = "SELECT MAX(CharacterID) AS LastID FROM Characters";
$nextIDRes = mysqli_query($mysqli, $getNextCharIDQuer);
$lastID = mysqli_fetch_array($nextIDRes);
$lastID = $lastID['LastID'];
$nextID = $lastID + 1;
echo $nextID . "<br />";

$charInsQuer = "INSERT INTO Characters (CharacterID, CharacterName, Superior, ChoirBandMembership, ChoirBandName, Essence, OwnerUsername) VALUES (" . $nextID . ", '" . $characterName . "', '" . $superior . "', '" . $choirBandMem . "', '" . $cbName . "', '" . $essence . "', '" . $_SESSION['username'] . "');";
echo $charInsQuer . "<br />";
mysqli_query($mysqli, $charInsQuer) or die(mysqli_error($db));

$corpInsQuer = "INSERT INTO CorporealStats VALUES (" . $nextID . ", " . $corp . ", " . $str . ", " . $agi . ");";
echo $corpInsQuer . "<br />";
mysqli_query($mysqli, $corpInsQuer) or die(mysqli_error($db));

$ethInsQuer = "INSERT INTO EtherealStats (CharacterID, Ethereal, Intelligence, Prec) VALUES (" . $nextID . ", " . $eth . ", " . $intel . ", " . $prec . ");";
mysqli_query($mysqli, $ethInsQuer) or die(mysqli_error($db));

$celInsQuer = "INSERT INTO CelestialStats (CharacterID, Celestial, Will, Perception) VALUES (" . $nextID . ", " . $celes . ", " . $will . ", " . $perc . ");";
echo $celInsQuer . "<br />";
mysqli_query($mysqli, $celInsQuer) or die(mysqli_error($db));

$joinCampQuer = "INSERT INTO CharacterCampaignParticipation VALUES (" . $campID . ", " . $nextID . ", " . ($int * $eth) . ", " . ($will * $celes) . ", 0);";
echo $joinCampQuer . "<br />";
mysqli_query($mysqli, $joinCampQuer) or die(mysqli_error($db));


#header('Location: ../../dashboard.php');
?>