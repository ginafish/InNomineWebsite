<?php
include_once 'psl-config.php';
 
function sec_session_start() {
    $session_name = 'sec_session_id';   // Set a custom session name
    /*Sets the session name. 
     *This must come before session_set_cookie_params due to an undocumented bug/feature in PHP. 
     */
    session_name($session_name);
 
    $secure = true;
    // This stops JavaScript being able to access the session id.
    $httponly = true;
    // Forces sessions to only use cookies.
    if (ini_set('session.use_only_cookies', 1) === FALSE) {
        header("Location: ../error.php?err=Could not initiate a safe session (ini_set)");
        exit();
    }
    // Gets current cookies params.
    $cookieParams = session_get_cookie_params();
    session_set_cookie_params($cookieParams["lifetime"],
        $cookieParams["path"], 
        $cookieParams["domain"], 
        $secure,
        $httponly);
 
    session_start();            // Start the PHP session 
    session_regenerate_id(true);    // regenerated the session, delete the old one. 
}

function login($un, $password, $mysqli) {
	#echo("reached login");
    // Using prepared statements means that SQL injection is not possible. 
    if ($stmt = $mysqli->prepare("SELECT Username, UserPassword FROM Users WHERE Username = ? LIMIT 1")) {
        $stmt->bind_param('s', $un);  // Bind "$un" to parameter.
        $stmt->execute();    // Execute the prepared query.
        $stmt->store_result();
		#echo("ran query");
 
        // get variables from result.
        $stmt->bind_result($db_un, $db_password);
        $stmt->fetch();
 
        if ($stmt->num_rows == 1) {
            // If the user exists we check if the account is locked
            // from too many login attempts 
 			#echo("checking for brutes");
            if (checkbrute($db_un, $mysqli) == true) {
                // Account is locked 
                // Send an email to user saying their account is locked
				#echo("Account Locked.");
                return false;
            } else {
                // Check if the password in the database matches
                // the password the user submitted. We are using
                // the password_verify function to avoid timing attacks.
				#echo("checking password");
                if (password_verify($password, $db_password)) {
                    // Password is correct!
                    // Get the user-agent string of the user.
                    $user_browser = $_SERVER['HTTP_USER_AGENT'];
                    // XSS protection as we might print this value
                    $db_un = preg_replace("/[^a-zA-Z0-9_\-]+/", "", $db_un);
                    // XSS protection as we might print this value
                    $_SESSION['username'] = $db_un;
                    $_SESSION['login_string'] = hash('sha512', 
                              $db_password . $user_browser);
                    // Login successful.
                    return true;
                } else {
                    // Password is not correct
                    // We record this attempt in the database
					#echo("Password incorrect.");
                    $now = time();
                    $mysqli->query("INSERT INTO loginAttempts(Username, time)
                                    VALUES ('$un', '$now')");
                    return false;
                }
            }
        } else {
            // No user exists.
			#echo("User not found.");
            return false;
        }
    } else {
		echo("something went horribly wrong in the sql statement");
	}
}

function checkbrute($user_id, $mysqli) {
    // Get timestamp of current time 
    $now = time();
 
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

function login_check($mysqli) {
    // Check if all session variables are set 
    if (isset($_SESSION['username'], $_SESSION['login_string'])) {
 
        $un = $_SESSION['username'];
        $login_string = $_SESSION['login_string'];
 
        // Get the user-agent string of the user.
        $user_browser = $_SERVER['HTTP_USER_AGENT'];
 
        if ($stmt = $mysqli->prepare("SELECT UserPassword FROM Users WHERE Username = ? LIMIT 1")) {
            // Bind "$user_id" to parameter. 
            $stmt->bind_param('i', $username);
            $stmt->execute();   // Execute the prepared query.
            $stmt->store_result();
 
            if ($stmt->num_rows == 1) {
                // If the user exists get variables from result.
                $stmt->bind_result($password);
                $stmt->fetch();
                $login_check = hash('sha512', $password . $user_browser);
 
                if (hash_equals($login_check, $login_string) ){
                    // Logged In!!!! 
                    return true;
                } else {
                    // Not logged in 
					echo("hash failed");
                    return false;
                }
            } else {
                // Not logged in 
				echo("query returned nothing");
                return false;
            }
        } else {
            // Not logged in 
			echo("SQL failed");
            return false;
        }
    } else {
        // Not logged in 
		echo("Session failed");
		echo($_SESSION['username']);
		echo($_SESSION['login_string']);
        return false;
    }
}

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
