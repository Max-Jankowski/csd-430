<%-- 
   Max Jankowski 
   Bellevue university 
   CSD-430 Module 8 
    
    
Added new file updateRecord.jsp to handle the steps of the update the GET request and the POST 
  
--%>
<%@ page import="com.jankowski.beans.MovieBean" %>
<%@ page import="java.sql.SQLException" %>
<%
    String method = request.getMethod();
    MovieBean movie = null;
    String errorMessage = null;
    boolean showResult = false;

    if (method.equalsIgnoreCase("GET")) {
        // Scriptlet loads the currently stored values for the selected movie_id, and pre-fills the form below.
       
        int selectedId = Integer.parseInt(request.getParameter("movieId"));
        try {
            movie = MovieBean.getMovieById(selectedId);
        } catch (SQLException e) {
            errorMessage = "Error loading record: " + e.getMessage();
        }

    } else if (method.equalsIgnoreCase("POST")) {
        // Scriptlet to read the submitted form values, that includes the hidden movie_id field, and apply the update.         
        try {
            int id = Integer.parseInt(request.getParameter("movieId"));
            String title = request.getParameter("title");
            String genre = request.getParameter("genre");
            int year = Integer.parseInt(request.getParameter("releaseYear"));
            String director = request.getParameter("director");
            double rating = Double.parseDouble(request.getParameter("rating"));

            movie = new MovieBean();
            movie.setMovieId(id);
            movie.setTitle(title);
            movie.setGenre(genre);
            movie.setReleaseYear(year);
            movie.setDirector(director);
            movie.setRating(rating);

            MovieBean.updateMovie(movie);

            // Refetching the record from the db after updating, so the result on the table reflects what was saved rather than just echoing back the submitted value.           
            movie = MovieBean.getMovieById(id);
            showResult = true;

        } catch (NumberFormatException e) {
            errorMessage = "Release year and rating must be numbers.";
        } catch (SQLException e) {
            errorMessage = "Database error: " + e.getMessage();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>CSD430 - Update Movie</title>
    <style>  /* Once again added the style with the html or jsp code. Really weird to use css comments within html code. used https://webcode.tools/css-generator*/
        body { font-family: Arial, sans-serif; margin: 40px; }
        table { border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #999; padding: 8px 14px; text-align: left; }
        th { background-color: #eee; }
        label { display: inline-block; width: 120px; }
        form div { margin-bottom: 10px; }
    </style>
</head>
<body>

<%
    if (errorMessage != null) {
%>
    <p style="color:red;"><%= errorMessage %></p> <%-- I have been liking these in file styling features. saves some time creating a seperate CSS from boilerplate  --%>
    <p><a href="updateSelect.jsp">Back to selection</a></p>
<%
    } else if (showResult) {
        
        // POST result shows the updated record of the table
       
%>
    <h1>Movie Updated Successfully</h1>
    <p>The table below shows the current values for this record after
       the update, including each field's data type as a column
       description.</p>

    <table>
        <thead>
            <tr>
                <th>Movie ID (int)</th>
                <th>Title (varchar)</th>
                <th>Genre (varchar)</th>
                <th>Release Year (int)</th>
                <th>Director (varchar)</th>
                <th>Rating (decimal)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= movie.getMovieId() %></td>
                <td><%= movie.getTitle() %></td>
                <td><%= movie.getGenre() %></td>
                <td><%= movie.getReleaseYear() %></td>
                <td><%= movie.getDirector() %></td>
                <td><%= movie.getRating() %></td>
            </tr>
        </tbody>
    </table>

    <p>
        <a href="updateSelect.jsp">Update another movie</a> |
        <a href="index.jsp">Back to home</a>
    </p>
<%
    } else {
    	
    	// the GET branch to show the editable form, pre-filled with current values. the MovieID is displayed as read only and passed as hidden field thus submitted 
    	// with the form and still not changable 
    	
    	// Started here and branched off to make sure the pri key was safe: https://stackoverflow.com/questions/21607487/how-can-i-prevent-a-primary-key-that-i-have-to-display-to-the-user-from-being-up
    	
%>
    <h1>Update Movie Record</h1>
    <p>Edit the fields below and submit to save your changes. The
       movie ID cannot be changed.</p>

    <form action="updateRecord.jsp" method="post">
        <div>
            <label>Movie ID:</label>
            <span><%= movie.getMovieId() %></span>
            <input type="hidden" name="movieId" value="<%= movie.getMovieId() %>">
        </div>
        <div>
            <label for="title">Title:</label>
            <input type="text" id="title" name="title"
                   value="<%= movie.getTitle() %>" required>
        </div>
        <div>
            <label for="genre">Genre:</label>
            <input type="text" id="genre" name="genre"
                   value="<%= movie.getGenre() %>" required>
        </div>
        <div>
            <label for="releaseYear">Release Year:</label>
            <input type="number" id="releaseYear" name="releaseYear"
                   value="<%= movie.getReleaseYear() %>" required>
        </div>
        <div>
            <label for="director">Director:</label>
            <input type="text" id="director" name="director"
                   value="<%= movie.getDirector() %>" required>
        </div>
        <div>
            <label for="rating">Rating:</label>
            <input type="number" step="0.1" id="rating" name="rating"
                   value="<%= movie.getRating() %>" required>
        </div>
        <input type="submit" value="Save Changes">
    </form>

    <p><a href="updateSelect.jsp">Back to selection</a></p>
<%
    }
%>
</body>
</html>