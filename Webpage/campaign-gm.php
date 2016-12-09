<?php 
// Include database connection and functions here.  See 3.1. 
session_start(); 
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
		</style>
		
	</head>
	
	<body>
		<?php if($_SESSION['loggedIn']=="true") { ?>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 id="campName">Campaign Name</h2>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-4">
					<h5>Characters</h5>
					<span id="charList"></span>		<!-- I assume let's fill this with elements on page load -->
					<hr />
					<h5>Campaign Tools</h5>
					<!-- Do onchange events instead of form? -->
					<form class="form-inline">
						<div class="form-group">
							<input type="text" class="form-control" id="month" width="25px">/<input type="text" class="form-control" id="day" width="25px">/<input type="text" class="form-control" id="year" width="50px">
							<button type="submit">Change Date</button>
						</div>
					</form>
					<button onclick="manageCampaign">Manage Campaign</button>
				</div>
				
				<div class="col-md-8">
					<h4>Freeform Notes</h4>
					<textarea name="gmnotes" id="gmnotes"></textarea>
				</div>
			</div>
		</div>
<?php
} else { 
        echo 'You have created a disturbance in the symphony, please login.';
}
?>	
	</body>
</html>
