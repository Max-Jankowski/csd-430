<?php
// Max Jankowski 
// Bellevue University 
// CSD430 Module5.20

$servername = "localhost";
$username = "student1";
$password = "pass";
$dbname = "CSD430";

// opening conneciton, same as prior code to create
$conn = new mysqli("localhost", "student1", "pass", "CSD430");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// running script to populate table 
$sql = "INSERT INTO max_movies_data (title, genre, release_year, director, rating) VALUES
('Willow', 'Fantasy', 1988, 'Ron Howard', 7.4),
('Planet of the Apes', 'Sci-Fi', 1968, 'Franklin J. Schaffner', 8.0),
('The Omen', 'Horror', 1976, 'Richard Donner', 7.5),
('Aliens', 'Sci-Fi', 1986, 'James Cameron', 8.4),
('Mad Max', 'Action', 1979, 'George Miller', 6.9),
('Terminator 2: Judgment Day', 'Sci-Fi', 1991, 'James Cameron', 8.6),
('Young Frankenstein', 'Comedy', 1974, 'Mel Brooks', 8.0),
('Close Encounters of the Third Kind', 'Sci-Fi', 1977, 'Steven Spielberg', 7.6),
('Big Trouble in Little China', 'Action', 1986, 'John Carpenter', 7.3),
('Conan the Barbarian', 'Fantasy', 1982, 'John Milius', 6.9)";


// Like before just provided success or fail information 
if ($conn->query($sql) === TRUE) {
    echo "Records inserted successfully.";
} else {
    echo "Error inserting records: " . $conn->error;
}

$conn->close();
?>
