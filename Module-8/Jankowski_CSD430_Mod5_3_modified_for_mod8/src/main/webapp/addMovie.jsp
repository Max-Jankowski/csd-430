<%-- Max Jankowski
	 Bellevue University 
	 New file for CSD 430 Module 7.2 
	 
	 Used to provide a user a form to add a movie entry into the DB
	 
	 --%>

<%@ page import="com.jankowski.beans.MovieBean" %>
<%@ page import="java.sql.SQLException" %>
<%

    // scriptlet to check if the page was reached by a sub or a simpe page load. request.getMethod()
    // tells us which HTTP verb was used
    String method = request.getMethod();
    String errorMessage = null;

    if (method.equalsIgnoreCase("POST")) {
        // gathering each form field's submitted value from the request.
        // the getParameter() always returns a String, so numeric fields
        // (release_year, rating) will need conversion.
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String director = request.getParameter("director");
        String yearParam = request.getParameter("releaseYear");
        String ratingParam = request.getParameter("rating");

        try {
            int year = Integer.parseInt(yearParam);
            double rating = Double.parseDouble(ratingParam);

            // building a MovieBean from the values provided. movie_id is deliberately never set here, see java code and auto incrment 
            MovieBean newMovie = new MovieBean();
            newMovie.setTitle(title);
            newMovie.setGenre(genre);
            newMovie.setReleaseYear(year);
            newMovie.setDirector(director);
            newMovie.setRating(rating);

            // inserts new record into the db
            MovieBean.insertMovie(newMovie);

            
            // proceed to allMovies to display entry 
            response.sendRedirect("allMovies.jsp");
            return;

        } catch (NumberFormatException e) {
            // is user didnt enter numbers message is triggered 
            errorMessage = "Release year and rating must be numbers.";
        } catch (SQLException e) {
            errorMessage = "Database error: " + e.getMessage();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>CSD430 - Add a Movie</title>
</head>
<body>

    <h1>Add a New Movie</h1>
    <p>Fill out the form below to add a new record to the Movie Database 
       table. The movie ID is generated automatically and does not need
       to be entered.</p>

    <%
    
        // Only shown if an error occurred during a previous submission attempt on this same page        
        if (errorMessage != null) {
    %>
        <p style="color:red;"><%= errorMessage %></p>
    <%
        }
    %>

    <form action="addMovie.jsp" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required><br><br>

        <label for="genre">Genre:</label>
        <input type="text" id="genre" name="genre" required><br><br>

        <label for="releaseYear">Release Year:</label>
        <input type="number" id="releaseYear" name="releaseYear" required><br><br>

        <label for="director">Director:</label>
        <input type="text" id="director" name="director" required><br><br>

        <label for="rating">Rating:</label>
        <input type="number" step="0.1" id="rating" name="rating" required><br><br>

        <input type="submit" value="Add Movie">
    </form>

    <p><a href="index.jsp">Back to home</a></p>
</body>
</html>