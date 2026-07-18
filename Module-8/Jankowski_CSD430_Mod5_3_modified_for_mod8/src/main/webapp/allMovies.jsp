<%-- Max Jankowski
	 Bellevue University 
	 New File for CSD 430 Module 7.2
	 
	 
	 Created to display all the movies in the database and to verify the user entry was added
	  --%>
	 

<%@ page import="com.jankowski.beans.MovieBean" %>
<%@ page import="java.util.List" %>
<%
        
    // Scriptlet that gets every row in our table including the newest record using the getAllMovies method 
    List<MovieBean> movies = MovieBean.getAllMovies();
%>
<!DOCTYPE html>
<html>
<head>
    <title>CSD430 - All Movies</title>
</head>
<body>

    <h1>All Movie Records</h1>
    <p>The table below displays every record currently stored in the
       max_movies_data table, including any records you've just added.
       Each column represents one field from the database, with column
       headers describing the data contained in that field.</p>

    <table border="1">
        <thead>
            <tr>
                <th>Movie ID</th>
                <th>Title</th>
                <th>Genre</th>
                <th>Release Year</th>
                <th>Director</th>
                <th>Rating</th>
            </tr>
        </thead>
        <tbody>
            <%                          
                // Looping through every MovieBean in the list and provide one table row per entry with this scriptlet 
                for (MovieBean m : movies) {
            %>
            <tr>
                <td><%= m.getMovieId() %></td>
                <td><%= m.getTitle() %></td>
                <td><%= m.getGenre() %></td>
                <td><%= m.getReleaseYear() %></td>
                <td><%= m.getDirector() %></td>
                <td><%= m.getRating() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <p>
        <a href="addMovie.jsp">Add another movie</a> |
        <a href="index.jsp">Back to home</a>
    </p>
</body>
</html>