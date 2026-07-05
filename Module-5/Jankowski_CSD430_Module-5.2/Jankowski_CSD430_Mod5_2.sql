--Max Jankowski 
-- Bellevue University 
--CSD430 Module5.20


CREATE DATABASE IF NOT EXISTS CSD430;

CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass';

GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost';

FLUSH PRIVILEGES;

USE CSD430;

CREATE TABLE max_movies_data (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    release_year INT,
    director VARCHAR(100),
    rating DECIMAL(3,1)
);

INSERT INTO max_movies_data (title, genre, release_year, director, rating) VALUES
('Willow', 'Fantasy', 1988, 'Ron Howard', 7.4),
('Planet of the Apes', 'Sci-Fi', 1968, 'Franklin J. Schaffner', 8.0),
('The Omen', 'Horror', 1976, 'Richard Donner', 7.5),
('Aliens', 'Sci-Fi', 1986, 'James Cameron', 8.4),
('Mad Max', 'Action', 1979, 'George Miller', 6.9),
('Terminator 2: Judgment Day', 'Sci-Fi', 1991, 'James Cameron', 8.6),
('Young Frankenstein', 'Comedy', 1974, 'Mel Brooks', 8.0),
('Close Encounters of the Third Kind', 'Sci-Fi', 1977, 'Steven Spielberg', 7.6),
('Big Trouble in Little China', 'Action', 1986, 'John Carpenter', 7.3),
('Conan the Barbarian', 'Fantasy', 1982, 'John Milius', 6.9);


