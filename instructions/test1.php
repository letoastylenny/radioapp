<?php

if (isset($_GET['username'])){
$user = trim($_GET['username']);
$pwd = trim($_GET['password']);

echo "in here\n";
echo $user . "\n" . $pwd."\n";
echo "success get something--Message from server side\n" ;

}else{
	echo "nothing send to server--Message from server side\n";
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
			echo "match\n";
        } else {
            echo "password incorrect\n";
			echo $row["password"]."\t".strlen($row["password"])."\n";
			echo $pwd. "\t" .strlen($pwd);
			}
    } 
    
} else {
    echo "email doesn't exist\n";
}
$conn->close();
?>
