<?php
// Include database connection and functions here.  See 3.1. 
sec_session_start(); 
if(login_check($mysqli) == true) {
        // Add your protected page content here!
} else { 
        echo 'You are not authorized to access this page, please login.';
}
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>TableSpace - Dashboard</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="styles/main.css" />
    </head>
    <body>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<?php 
						echo"<h3>$campaignName</h3>"
					?>
				</div>
			</div>
			<div class="row">
				<div class="col=md-4">
					<?php 
					$chrDataQuer = "SELECT CharacterID, CharacterName, Dissonance, Discord, Superior, ChoirBandMembership, Essence FROM Characters WHERE Username = $user AND CharacterID IN (SELECT CharacterID FROM CharacterCampaignParticipation WHERE CampaignID = $campID)"
					$result = msqli_query($credentials, $chrDataQuer);
					$rows = mysqli_fetch_row($result);
					
					?>
					<p>Name:</p>
				</div>
			</div>
		</div>
	</body>
</html>