<?php
include_once 'includes/db_connect.php';
include_once 'includes/functions.php';
 
sec_session_start();
 
if (login_check($mysqli) == true) {
    $logged = 'in';
} else {
    $logged = 'out';
}
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
	
	<title>Tblspace - InNomine Login</title>
	
	<style>
		#loginerrormsg {
			display: none;
		}
	</style>
	
	<script type="application/javascript">
		function createAccount(){
			
		}
	</script>
	
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">
				<img class="img-responsive media-right" src="img/innomfeather.png" alt="burning feather" />
			</div>
			<div class="col-md-8">
				<span class="text-center">
					<img src="" id="homepagebanner" />
					<h1>TableSpace In Nomine Login (dummy for banner) </h1>
				</span>
				
				
				<span class="text-center" id="login">
				<?php
					if (isset($_GET['error'])) {
						echo '<p class="error">Error Logging In!</p>';
					}
				?> 
					<form action="includes/process_login.php" method="post" class="form-horizontal" name="login_form">
						<div class="form-group">
							<label for="username" class="control-label col-sm-2">Username:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="username" id="username">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="control-label col-sm-2">Password:</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="password" id="password">
							</div>
						</div>
						<div class="checkbox">
							<fieldset class="form-inline">
								<label for="rememberme" class="control-label">Remember me</label>
								<input type="checkbox" name="rememberme" class="form-control">
							</fieldset>
						</div>
						<button type="Login" value="Login" class="btn btn-default" onclick="formhash(this.form, this.form.password);">Submit</button>
					</form>
					<button type="button" onclick="createAccount()" name="btnCreateAccount">CreateAccount</button>
				</span>	
				<span class="alert alert-warning" id="loginerrormsg">
				</span>
		
			</div>
			
			
		</div>
		
		
		
		
		
	</div>
<?php
if (login_check($mysqli) == true) {
	echo '<p>Currently logged ' . $logged . ' as ' . htmlentities($_SESSION['username']) . '.</p>';
	echo '<p>Do you want to change user? <a href="includes/logout.php">Log out</a>.</p>';
}
else {
	echo '<p>Currently logged ' . $logged . '.</p>';
	echo "<p>If you don't have a login, please <a href='register.php'>register</a></p>";
}
?>
	
</body>
</html>
<?php
include_once 'scripts/psl-config.php';   // As functions.php is not included
$mysqli = new mysqli(HOST, USER, PASSWORD, DATABASE);
?>
