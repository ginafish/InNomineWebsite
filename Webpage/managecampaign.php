<?php
session_start();
include_once 'includes/db_connect.php';
include_once 'includes/functions.php';
 ?>

<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="home.css">
		<link rel="icon" href="favicon.png">
		<?php if($_SESSION['CampaignID']!= NULL){?>
		<title>Manage Campaign</title>
		<?php } else { ?>
		<title>Create Campaign</title>
		<?php } ?>
		<style>
			.campBlurbInp{
				width: 100%;
				height: 200px;
			}
		</style>
		
	</head>
	
	<body>

<?php if($_SESSION['loggedIn']="true") { ?>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
			<?php
			echo "campaignId: ".$_SESSION['CampaignID'];
			if($_SESSION['CampaignID']!= NULL){
				$queryCampaign="SELECT CampaignID, CampaignName, CampaignBlurb, CampaignPassword, PlayerLimit FROM Campaigns WHERE CampaignID = '".$_SESSION['CampaignID']."'";
				$result = mysqli_query($mysqli, $queryCampaign) or die(mysqli_error($link));
					if(mysqli_connect_errno($mysqli)){
						echo("Connection failed: " . mysqli_error($mysqli));
						exit();
					}
				$row = mysqli_fetch_array($result, MYSQL_ASSOC);
				echo("<h2>Manage Campaign</h2>");
			} else {
				echo("<h2>Create Campaign</h2>");
			}
			?>
				</div>
				<span class="pull-right">
					<a href="dashboard.php">Back to dashboard.</a>
				</span>
			</div>
			
			
			<div class="row">
				<form action="<?php if($_SESSION['CampaignID']!=NULL){
						echo "..\scripts\submitChange.php";
					} else {
						echo "..\scripts\addCampaign.php";
					} ?>" method="post" class="form-horizontal">			
					<div class="row">
						<div class="form-group col-md-5">
							<label class="control-label" for="campName">Campaign Name</label>
							<input type="text" name="campName" class="form-control" value="<?php  echo (isset($row['CampaignName']))?$row['CampaignName']:'';?>">
						</div>
						<div class="col-md-2"></div>
						<div class="form-group col-md-5">
							<label class="control-label" for="campPass">Campaign Password (leave blank if you want no password)</label>
							<input type="text" name="campPass" class="form-control" value="<?php  echo (isset($row['CampaignPassword']))?$row['CampaignPassword']:'';?>">
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="control-label" for="campBlurb">Campaign Blurb</label>
							<input type="text" name="campBlurb" class="form-control campBlurbInp" value="<?php  echo (isset($row['CampaignBlurb']))?$row['CampaignBlurb']:'';?>" maxlength=2500>
						</div>
					</div>
					
					<div class="row">
						
						<div class="form-group col-md-3">
							<label class="control-label sr-only" for="playerRestr">Player Types Restriction</label>							
							<select class="form-control" name="playerRestr">
								<option value="c">Angels Only</option>
								<option value="b">Demons Only</option>
								<option selected="selected" value="">Allow Both</option>
							</select>
						</div>
						
						<div class="form-group col-md-3">
							<label class="control-label" for="maxPlayers">Maximum Number of Players</label>
							<input type="number" class="form-control" name="maxPlayers" value="<?php  echo (isset($row['PlayerLimit']))?$row['PlayerLimit']:'';?>"> 
						</div>
						
						<br />
						<div class="pull-right">
							<?php 
							if($_SESSION['CampaignID']!=NULL) {
								echo('<button type="submit" value="UpdCampInfo" class="btn btn-default">Update Campaign</button>');
							} else {
								echo('<button type="submit" value="SubCampInfo" class="btn btn-default">Create Campaign</button>');
							}
							?>
					</div>
						
					</div>
					
					
				</form>				
			</div>
			
			<?php if($_SESSION['CampaignID']== (-1)){
?>
			<div class="row">
				<div class="col-md-6">
					<form class="form-horizontal">
						<label class="control-label" for="kickPlayer">Players</label>
						<select class="form-control" name="kickPlayer" id="kickPlayList" multiple="">
							<!-- Populate with players -->
							<option>Test</option>
						</select>
						<button type="submit" class="btn btn-default" value="btnKickPlayer">Kick Permanently</button>
					</form>
				</div>
			</div>
			<?php } ?>
			
		</div>
<?php
} else { 
        echo 'You have created a disturbance in the symphony, please login.';
}
?>
	</body>
</html>
