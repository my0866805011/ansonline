<?php
//echo "Connecteding ";
$servername = "localhost";
$username = "myhomeco_user";
$password = "250000xxXX";
$dbname = "myhomeco_user";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
// #<!-- echo "Connected successfully"; >
?> 