<?php 
// Include database connection and functions here.  See 3.1. 
session_start();
include_once 'includes/db_connect.php';
include_once 'includes/functions.php';

?>

<!DOCTYPE html>
<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="home.css">
		<link rel="icon" href="favicon.png">
		
		<title>GM View - CampaignName</title>
		
		<style>
			html, body {
				width: 100%;
				height: 100%;
			}
			#gmnotes {
				width: 100%;
				height: 80vh;
			}
			body {
				background-image: url("img/innombannur.png");
				background-position: left bottom;
				background-repeat: no-repeat;
			}
		</style>
		
	</head>
	
	<body>
		<?php if($_SESSION['loggedIn']=="true") { ?>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 id="campName">Campaign Name</h2>
					<span class="pull-right">
						<a href="dashboard.php">Back to dashboard.</a>
						<a href="./managecampaign.php" style="-webkit-appearance: button; -moz-appearance: button; appearance: button; text-decoration: none; color: white; background-color: grey;" >Edit Campaign</a>
					</span>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-4">
					<h5>Characters</h5>
					<span id="charList">
						<?php
						$_SESSION['CampaignID'] = $_POST["CampaignID"];
						echo("<br />");
						if(isset($_SESSION['CampaignID'])){
							$playerListQuery = "SELECT * FROM GMSheet WHERE CampaignID = '";
	                    	$playerListQuery .= $_SESSION['CampaignID'] . "'";
							$result = mysqli_query($mysqli, $playerListQuery) or die(mysqli_error($link));		#query with error checking below
							if(mysqli_connect_errno()){
								printf("Connection failed: %s\n", mysqli_connect_error());
								exit();
							}
							if($result === FALSE){
								echo("<p>You have no players.</p>");
							} else {		#print all that the query returns
								$fields_num = mysqli_num_fields($result);
								while($row = mysqli_fetch_array($result)) {
									echo "Character: " . $row['CharacterName'] . "<br />MHP: " . $row['CurrentMindHits'] . "<br />SHP: " . $row['CurrentSoulHits'];
									echo('<br />');
								}
								echo("</span>");
							}
							mysqli_free_result($result); 
						} else {
							echo("Choose a campaign man. Jeez.");
						}
						?>
					</span>
					<hr />
					
					
				</div>
				
				<div class="col-md-8">
					<h4>Freeform Notes</h4>
					<textarea name="gmnotes" id="gmnotes"></textarea>
				</div>
			</div>
		</div>
<?php
} else { 
        echo 'You have created a disturbance in the symphony, please <a href="http://tablespace.org">login.</a>';
}
?>	
	</body>
</html>
