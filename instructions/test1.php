<?php

if (isset($_GET['username'])){
$user = trim($_GET['username']);
$pwd = trim($_GET['password']);

}
//}

$servername = "localhost";
$username = "root";	
$password = "";
$dbname = "flutter_app";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM users WHERE username = '" . $user . "'";
$result = $conn->query($sql);

if ($result->num_rows == 1) {

    if ($row = $result->fetch_assoc()) {
        if (strcmp($pwd,$row["password"]) == 0) {
			echo "match";
        } else {
            echo "non";
			}
    } 
    
} else {
            echo "non";
}
$conn->close();
?>