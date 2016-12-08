<?php
include_once 'includes/db_connect.php';
include_once 'includes/functions.php';

#need to add buttons to each of the results for the redirect, and to make them look nice.  At this point just want to see if they work.
sec_session_start(); 
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
        <?php  
    	if(login_check($mysqli) == true) : 
        $user = htmlentities($_SESSION['username']); 
  		?>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Dashboard</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<h3>Player Campaigns</h3>
					<div class="row">
						<div class="col-md-6">
							<?php
							$playerQuery = "SELECT camps.CampaignName, camps.CampaignBlurb, charac.OwnerUsername, charac.CharacterName, ccp.KickedStatus FROM Campaigns camps LEFT JOIN CharacterCampaignParticipation ccp ON camps.CampaignID = ccp.CampaignID JOIN Characters charac ON ccp.CharacterID = charac.CharacterID WHERE charac.OwnerUsername = $user";
							$result = mysqli_query($credentials, $query);
							$numPCamps = mysqli_fetch_row($result);
							?>
							<div class='row'> <div class='col-md-6'>
							<?php
							foreach ($numQCamps as $curRow){
								echo "<span width=100>";
								echo "$curRow";
								#parse so that we can get campName and campID
								echo "<button type='button' id='btnGoToDash'>Open</button>";
								echo "</span>";
							}
						
							mysqli_free_result($result);
							?>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<h3>GM Campaigns</h3>
					<div class="row">
						<div class="col-md-6">
							<?php
							$gmQuery = "SELECT CampaignName, CampaignBlurb, GameMasterUsername FROM Campaigns WHERE GameMasterUsername = $user";
							$result = mysqli_query($credentials, $query);
							$numQCamps = mysqli_fetch_row($result);
						
							echo "<div class='row'> <div class='col-md-6'>";
							foreach ($numQCamps as $curRow){
								echo "<span width=100>";
								echo "$curRow";
								echo "</span>";
							}
						
							mysqli_free_result($result);
							?>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php else : ?> 
            <p> 
                <span class="error">You have created a disturbance in the symphony, please <a href="http://www.tablespace.org">login</a> and try again. </span> 
            </p> 
  <?php endif; ?> 
    </body>
</html>
