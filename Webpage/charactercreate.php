<?php
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
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="home.css">
		<link rel="icon" href="favicon.png">
	
		<title>InNomine Character Creation</title>
	
		<script type="application/javascript">
			/* For preventing nonsensical race options */
			function updateRace(cbMembership){
				var raceOps = document.getElementById("race").getElementsByTagName("option"); 
				/*var raceOptions = raceElem.children();*/
        		for (var i = 0; i < raceOps.length; i++){
					var curVal = raceOps[i].value;
					(curVal.includes(cbMembership))
					? raceOps[i].hidden = false
					: raceOps[i].hidden = true;
					console.log(raceOps[i].value + " " + cbMembership);
				}
				document.getElementById("race").selectedIndex = 0;
			}
		</script>
	</head>
	<body>
		<div class="container">
			
			<!-- header -->
			<div class="row">
				<div class="col-md-12">
					<h1>Character Sheet</h1>
					<span class="pull-right">
						<a href="dashboard.php">Back to dashboard.</a>
					</span>
				</div>
			</div>
			
			<!-- Form for all of the character data -->
			<form action="scripts/createChar.php" class="form-horizontal" method="post">
				<div class="row">
					
					<div class="col-md-3">
						<div class="form-group form-group-lg">
							<label class="control-label" for="newCampID">Campaign ID</label>
							<input type='number' name='newCampID' class="form-control" id="newCampID" required="required">
						</div>
						<div class="form-group form-group-lg">
							<label class="control-label" for="charName">Character Name</label>
							<input type="text" name="charName" class="form-control" id="charName" required="required">
						</div>
					</div>
					
					<div class="col-md-3">
						<div class="form-group form-group-lg">
							<select class="form-control" name="bandchoir" id="bandchoir" required="required" onchange="updateRace(this.value)">
								<option selected="selected" disabled="disabled" value="prompt" hidden>Choose band or choir</option>
								<option value="B">Band</option>
								<option value="C">Choir</option>
							</select>
						</div>
					</div>
					
					<div class="col-md-3">
						<div class="form-group form-group-lg">
							<select class="form-control" name="race" id="race" required="required">
								<option selected="selected" disabled="disabled" hidden>Choose race</option>
								<option value="Choir - Seraphim">Seraphim</option>
								<option value="Choir - Cherium">Cherium</option>
								<option value="Choir - Malikem">Malikem</option>
								<option value="Band - Succubus">Incubus</option>
							</select>
						</div>
					</div>
						
					<div class="col-md-3">
						<div class="form-group form-group-lg">
							<select class="form-control" name="superior" id="superior" required="required">
								<option selected="selected" disabled="disabled" value="prompt">Superior</option>
								<option value="Choir - Superior">Choir Superior</option>
								<option value="Band - Superior">Band Superior</option>
							</select>
						</div>
					</div>
					
				
				</div>
				
				<div class="row">
				<!-- Stat values -->
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label" for="corppoints">Corporeal Force</label>
							<input class="form-control" type="range" name="corppoints" min="0" max="20">
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label" for="ethpoints">Ethereal Force</label>
							<input class="form-control" type="range" name="ethpoints" min="0" max="20">
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label" for="celpoints">Celestial Force</label>
							<input class="form-control" type="range" name="celespoints" min="0" max="20">
						</div>
					</div>
					
				</div>
				
				<!-- Substat values -->
				<div class="row">
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label" for="str">Strength</label>
							<input class="form-control" type="number" name="str">
						</div>
						<div class="form-group">
							<label class="control-label" for="agi">Agility</label>
							<input class="form-control" type="number" name="agi">
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label" for="int">Intelligence</label>
							<input class="form-control" type="number" name="int">
						</div>
						<div class="form-group">
							<label class="control-label" for="prec">Precision</label>
							<input class="form-control" type="number" name="prec">
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label" for="will">Will</label>
							<input class="form-control" type="number" name="will">
						</div>
						<div class="form-group">
							<label class="control-label" for="perc">Perception</label>
							<input class="form-control" type="number" name="perc">
						</div>
					</div>
					
				</div>
				<br /> <br />
				
				<!-- Skills and Songs -->
				<!-- <div class="row">
					
					<!-- For this, I'm guessing that we'll have a textbox for searching, add to add to the box below, so going to make that a multiselect drop box
					<div class="col-md-5">
						<div class="form-group">
							<label class="control-label sr-only" for="addskill">Add Skill</label>
							<input type="text" class="form-control" name="addskill">
							<button onclick="addSkillToLi()" name="btnAddSkill">Add</button>
						</div>
						<div class="form-group">
							<label class="control-label sr-only" for="skilllist">Skills:</label>
							<select class="form-control" name="skilllist" id="skilllist" multiple>
								<option selected="selected" disabled="disabled" value="prompt">Skill</option>
							</select>
							<button onclick="remoSkillFrLi()" name="btnRemovSkill">Remove</button>
						</div>
					</div>
					<div class="col-md-2" id="space">
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<label class="control-label sr-only" for="addsong">Add Song</label>
							<input type="text" class="form-control" name="addsong">
							<button onclick="addSongToLi()" name="btnAddSong">Add</button>
						</div>
						<div class="form-group">
							<label class="control-label sr-only" for="songlist">Songs:</label>
							<select class="form-control" name="songlist" id="songlist" multiple>
								<option selected="selected" disabled="disabled" value="prompt">Song</option>
							</select>
							<button onclick="remoSongFrLi()" name="btnRemovSong">Remove</button>
						</div>
					</div>
					
				</div>-->
				
				<!-- Vessels -->
				<!--<div class="row">
					<div class="col-md-11">
						<fieldset class="form-inline">
							<div class="form-group col-md-5">
								<label class="control-label" for="vesselName">Vessel Name</label>
								<input type="text" class="form-control" name="vesselName">
							</div>
							<div class="form-group col-md-6">
								<label class="control-label" for="vesselRanks">Vessel Ranks</label>
								<input type="number" class="form-control" name="vesselRanks">
							</div>
							<span class="row">
								<div class="form-group col-md-5">
									<label class="control-label" for="vesselRole">Vessel Role</label>
									<input type="text" class="form-control" name="vesselRole">
								</div>
								<div class="form-group col-md-6">
									<label class="control-label" for="roleRanks">Role Ranks</label>
									<input type="number" class="form-control" name="roleRanks">
								</div>
							</span>
							<button onclick="addVesToLi()" name="btnAddVes">Add Vessel</button>
						</fieldset>
						<div class="form-group">
							<label class="control-label sr-only" for="veslist">Vessels:</label>
							<select class="form-control" name="veslist" id="veslist" multiple>
								<option selected="selected" disabled="disabled" value="prompt">Vessel</option>
							</select>
							<button onclick="remoVesFrLi()" name="btnRemovVes">Remove</button>
						</div>
					</div>-->
					
					<div class="col-md-1">
						<button type="submit" value="CreateCharacter" class="btn btn-default">Finish and create character</button>
					</div>
				
				
			</form>
			
		</div>
	</body>
</html>