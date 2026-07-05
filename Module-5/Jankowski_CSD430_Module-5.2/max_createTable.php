


<?php
// Max Jankowski 
// Bellevue University 
// CSD430 Module5.20

$servername = "localhost";
$username = "student1";
$password = "pass";
$dbname = "CSD430";

// opening a mysql connection and uses the required student1 credentials 
$conn = new mysqli("localhost", "student1", "pass", "CSD430");

//checks to see if the connection attempt fails. stops if it did prints error message 
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

//defining the statement that makes the table. The IF NOT EXISTS prevents errors if the this script is run more then one 

$sql = "CREATE TABLE IF NOT EXISTS max_movies_data (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    release_year INT,
    director VARCHAR(100),
    rating DECIMAL(3,1)
)";

//executes the CREATE TABLE in a conneciton and returns true if successful 
if ($conn->query($sql) === TRUE) {
    echo "Table max_movies_data created successfully."; // successful print 
} else {
    echo "Error creating table: " . $conn->error; //prints when and if error occurs 
}

$conn->close(); // closing the conneciton 
?>