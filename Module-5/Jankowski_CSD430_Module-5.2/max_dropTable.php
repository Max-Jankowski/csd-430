<?php
 // Max Jankowski 
// Bellevue University 
// CSD430 Module5.20


$servername = "localhost";
$username = "student1";
$password = "pass";
$dbname = "CSD430";

$conn = new mysqli("localhost", "student1", "pass", "CSD430");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Running script to removce table structure and data, this doesnt just delete rows. if exists prevents an error if the table was already dropped 
$sql = "DROP TABLE IF EXISTS max_movies_data";

// informing user of success or failure 
if ($conn->query($sql) === TRUE) {
    echo "Table max_movies_data dropped successfully.";
} else {
    echo "Error dropping table: " . $conn->error;
}

$conn->close();
?>

