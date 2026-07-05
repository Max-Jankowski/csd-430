// Max Jankowski 
// Bellevue University 
// CSD430 Mod5.3



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
}