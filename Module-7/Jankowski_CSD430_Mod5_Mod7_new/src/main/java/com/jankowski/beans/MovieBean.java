// Max Jankowski 
// Bellevue University 
// CSD430 Mod 7 
// Modified bean from CSD430 Mod5.3 7/10/26



package com.jankowski.beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


 //the MovieBean class is has 2 roles here, it represents a single record from the db table 
 // and also handle the data gathering from the table. 

public class MovieBean {

    // database connection settings 
    private static final String URL = "jdbc:mysql://localhost:3306/CSD430";
    private static final String USER = "student1";
    private static final String PASS = "pass";

    // forcing the MySQL driver to register itself with DriverManager. This was a problem that I encountered so it may have 
    // a negative impact on another build. But this helps in working around the classloader in tomcat if automatic self-registration doesn't always take effect.
    // Listed are the resources I used to solve this problem 
    
    // https://mkyong.com/jdbc/how-to-connect-to-mysql-with-jdbc-driver-java/
    // https://stackoverflow.com/questions/71791454/why-does-class-forname-not-seem-to-register-driver-with-drivermanager   
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        	// this will occur if the SQL connector is missing from the project, print the trace to make the issue noticeable 
            e.printStackTrace();
        }
    }
    
    
   

    // the bean fields, one for each db column
    private int movieId;
    private String title;
    private String genre;
    private int releaseYear;
    private String director;
    private double rating;

    // a no-argument constructor required for the JB, it allows for the framework 
    // to make an empty bean 
    public MovieBean() {
    }

    // getters and setters sections 

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    // DB access methods

    // opens and returns a new db connection
    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }

   
    
    //returning a list of movie primary key values for the dropdown menu population 
    // it queries the DB for each of the prime keys 
    public static List<Integer> getAllKeys() throws SQLException {
        List<Integer> keys = new ArrayList<>();
        String sql = "SELECT movie_id FROM max_movies_data ORDER BY movie_id";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
        	
        	//advanced cursor to the next row and comes back false if there is none left 
            while (rs.next()) {
                keys.add(rs.getInt("movie_id"));
            }
        }
        return keys;
    }

    
    
    // queries and calls back the full record of the movie with the matching primary key selected 
    public static MovieBean getMovieById(int id) throws SQLException {
        MovieBean movie = null;
        String sql = "SELECT * FROM max_movies_data WHERE movie_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                	
                    movie = new MovieBean();
                    movie.setMovieId(rs.getInt("movie_id"));
                    movie.setTitle(rs.getString("title"));
                    movie.setGenre(rs.getString("genre"));
                    movie.setReleaseYear(rs.getInt("release_year"));
                    movie.setDirector(rs.getString("director"));
                    movie.setRating(rs.getDouble("rating"));
                }
            }
        }
        return movie;
    }
    
    // ADDED FOR MODULE 7
    // There was some confusion as this was handled via a php file. But this module listed to include it in Java file. 
    // "Include the original create, populate, and delete **** Java source code file **** "
    
    // Function to create the table if it doesnt exist. is performing the same tasks as maxCreateTable.php did. 
   
    public static void createTable() throws SQLException {
        String sql = "CREATE TABLE IF NOT EXISTS max_movies_data (" +
                "movie_id INT AUTO_INCREMENT PRIMARY KEY," +
                "title VARCHAR(100) NOT NULL," +
                "genre VARCHAR(50)," +
                "release_year INT," +
                "director VARCHAR(100)," +
                "rating DECIMAL(3,1))";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
        }
    }
    
    

    // a function that replaces maxPopulateTable.php in java form for this module
    public static void populateTable() throws SQLException {
        String sql = "INSERT INTO max_movies_data " +
                "(title, genre, release_year, director, rating) VALUES " +
                "('Willow', 'Fantasy', 1988, 'Ron Howard', 7.4)," +
                "('Planet of the Apes', 'Sci-Fi', 1968, 'Franklin J. Schaffner', 8.0)," +
                "('The Omen', 'Horror', 1976, 'Richard Donner', 7.5)," +
                "('Aliens', 'Sci-Fi', 1986, 'James Cameron', 8.4)," +
                "('Mad Max', 'Action', 1979, 'George Miller', 6.9)," +
                "('Terminator 2: Judgment Day', 'Sci-Fi', 1991, 'James Cameron', 8.6)," +
                "('Young Frankenstein', 'Comedy', 1974, 'Mel Brooks', 8.0)," +
                "('Close Encounters of the Third Kind', 'Sci-Fi', 1977, 'Steven Spielberg', 7.6)," +
                "('Big Trouble in Little China', 'Action', 1986, 'John Carpenter', 7.3)," +
                "('Conan the Barbarian', 'Fantasy', 1982, 'John Milius', 6.9)";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
        }
    }
    
    // Functioning in the place of maxDropTable.php for this assignment, it drops the table if it was created. 
    // effectively acting like a reset  
    public static void dropTable() throws SQLException {
        String sql = "DROP TABLE IF EXISTS max_movies_data";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
        }
    }
       
    // NOW WE GET TO THE NEW FUNCTION FOR THE NEW FEATURE REQUIREMENTS 
    
    //This function inserts a new movie that the user entered in the addMovie form. the primary id is generated automatically 
    // by the use of auto increment
    public static void insertMovie(MovieBean movie) throws SQLException {
        String sql = "INSERT INTO max_movies_data " +
                "(title, genre, release_year, director, rating) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Bind each form value to its placeholder in order.
            // PreparedStatement handles type conversion and prevents
            // SQL injection from user-supplied form input.
            ps.setString(1, movie.getTitle());
            ps.setString(2, movie.getGenre());
            ps.setInt(3, movie.getReleaseYear());
            ps.setString(4, movie.getDirector());
            ps.setDouble(5, movie.getRating());

            ps.executeUpdate();
        }
    }
   
    // the other new feature being added for module 7 
    
    // this function retrieves every record thats in the movie db and is used by the new allMovies file. 
    // This is used to confirm that the new entry was indeed added by the user in addMovie. 
    public static List<MovieBean> getAllMovies() throws SQLException {
        List<MovieBean> movies = new ArrayList<>();
        String sql = "SELECT * FROM max_movies_data ORDER BY movie_id";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                MovieBean m = new MovieBean();
                m.setMovieId(rs.getInt("movie_id"));
                m.setTitle(rs.getString("title"));
                m.setGenre(rs.getString("genre"));
                m.setReleaseYear(rs.getInt("release_year"));
                m.setDirector(rs.getString("director"));
                m.setRating(rs.getDouble("rating"));
                movies.add(m);
            }
        }
        return movies;
    }
    
}