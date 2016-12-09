<?php
session_start();
include_once 'psl-config.php';

function login($un, $password, $mysqli) {
	
    // Using prepared statements means that SQL injection is not possible. 
    if ($stmt = $mysqli->prepare("SELECT Username, UserPassword FROM Users WHERE Username = ? LIMIT 1")) {        
	$stmt->bind_param('s', $un);  // Bind "$un" to parameter.
        $stmt->execute();    // Execute the prepared query.
        $stmt->store_result();

        // get variables from result.
        $stmt->bind_result($db_un, $db_password);
        $stmt->fetch();
 	
        if ($stmt->num_rows == 1) {
            // If the user exists we check if the account is locked
            // from too many login attempts 
            if (checkbrute($db_un, $mysqli) == true) {
                // Account is locked 
                // Send an email to user saying their account is locked
		echo("You have accumulated too much discord in the symphony, please appeal to the superiors and try again.");
                return false;
            } else { 
                // Check if the password in the database matches
                // the password the user submitted. We are using
                // the password_verify function to avoid timing attacks.
		// echo "Passed Password: $password <br>";
		// echo "Databa Password: $db_password";	                
		if ($password == $db_password) {
			// Password is correct!
            // Get the user-agent string of the user.
            $user_browser = $_SERVER['HTTP_USER_AGENT'];
            // XSS protection as we might print this value
            $db_un = preg_replace("/[^a-zA-Z0-9_\-]+/", "", $db_un);
            // XSS protection as we might print this value
            $_SESSION['username'] = $db_un;
		    $_SESSION['loggedIn']="true";
					// echo($db_un);
					// echo $_SESSION['username'];
                    $_SESSION['login_string'] = hash('sha512', $db_password . $user_browser);
                    // Login successful.
                    return true;
                } else {
                    // Password is not correct
                    // We record this attempt in the database
					#echo("Password incorrect.");
                    $now = time();
                    $mysqli->query("INSERT INTO loginAttempts(Username, time) VALUES ('$un', '$now')");
                    $_SESSION['loggedIn']="false";
		    return false;
                }
            }
        } else {
            // No user exists.
			#echo("User not found.");
            return false;
        }
    } else {
		echo("Something went horribly wrong in the sql statement");
	}
}


function checkbrute($user_id, $mysqli) {
    // Get timestamp of current time 
    $now = time();
 return false;
    // All login attempts are counted from the past 2 hours. 
    $valid_attempts = $now - (2 * 60 * 60);
 
    if ($stmt = $mysqli->prepare("SELECT time 
                             FROM loginAttempts 
                             WHERE Username = ? 
                            AND time > '$valid_attempts'")) {
        $stmt->bind_param('i', $user_id);
 
        // Execute the prepared query. 
        $stmt->execute();
        $stmt->store_result();
 
        // If there have been more than 5 failed logins 
        if ($stmt->num_rows > 5) {
            return true;
        } else {
            return false;
        }
    }
}


#input cleaning:
function esc_url($url) {
 
    if ('' == $url) {
        return $url;
    }
 
    $url = preg_replace('|[^a-z0-9-~+_.?#=!&;,/:%@$\|*\'()\\x80-\\xff]|i', '', $url);
 
    $strip = array('%0d', '%0a', '%0D', '%0A');
    $url = (string) $url;
 
    $count = 1;
    while ($count) {
        $url = str_replace($strip, '', $url, $count);
    }
 
    $url = str_replace(';//', '://', $url);
 
    $url = htmlentities($url);
 
    $url = str_replace('&amp;', '&#038;', $url);
    $url = str_replace("'", '&#039;', $url);
 
    if ($url[0] !== '/') {
        // We're only interested in relative links from $_SERVER['PHP_SELF']
        return '';
    } else {
        return $url;
    }
}
