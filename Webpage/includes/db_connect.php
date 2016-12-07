<?php
include_once 'psl-config.php';   // As functions.php is not included
$mysqli = new mysqli(HOST, USER, PASSWORD, DATABASE);
if ($mysqli->connect_error) {
	die("Connection failed: " . $mysqli->connect_error);
}
?>
