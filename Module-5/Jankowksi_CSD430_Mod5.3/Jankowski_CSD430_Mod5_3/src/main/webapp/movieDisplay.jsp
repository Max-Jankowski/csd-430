<%-- Max Jankowski
	 Bellevue University 
	 CSD 430 Module 5.3 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ page import="com.jankowski.beans.MovieBean" %>
<%
    
    // This scriptlet runs when this page is loaded after the form on index.jsp has submitted. 
    // it reads the selected key and fetchs the movie record 
    
    
    int selectedId = Integer.parseInt(request.getParameter("movieId"));
    MovieBean movie = MovieBean.getMovieById(selectedId);
%>
<!DOCTYPE html>
<html>
<head>
    <title>CSD430 - Movie Record</title>
</head>
<body>
    <h1>Movie Record Detail</h1> <!-- Informing the user of the purpose of the display page -->
    <p>The table below displays the full record from the max_movies_data
       table for the movie ID you selected. Each column represents one
       field from the database, with column headers describing the data
       contained in that field.</p>

    <table border="1">
     <!-- The thead section holds column headers only, one for each database field. -->
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
                if (movie != null) {
            %>
            <!-- Each expression calls one getter on the movie bean and inserts the returns the values into the html output  -->
            <tr>
                <td><%= movie.getMovieId() %></td>
                <td><%= movie.getTitle() %></td>
                <td><%= movie.getGenre() %></td>
                <td><%= movie.getReleaseYear() %></td>
                <td><%= movie.getDirector() %></td>
                <td><%= movie.getRating() %></td>
            </tr>
            <%
                } else {
            %>
             <!--  a fallback row shown only if getMovie returned null, no reason for this to happen unless url is manually edited.
             		But is here as best practice -->
            <tr>
                <td colspan="6">No record found for the selected ID.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <p><a href="index.jsp">Back to lookup</a></p>
</body>
</html>