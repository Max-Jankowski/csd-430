<%-- Max Jankowski
	 Bellevue University 
	 CSD 430 Module 5.3
	 Modified for Module 7 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.jankowski.beans.MovieBean" %>
<%@ page import="java.sql.SQLException" %> <%-- Added for module 7 for adding button to execute dropTable function --%>
											<%-- As I found out later, I will also need a way to load the db from index as well --%>

<%

	// ADDED SCRIPTLET FOR MODULE 7 
	// to execute the dropTable funtion in the Java Bean 
	// ADDED later: I needed a way to load the db as well as droping from this single index.jsp
	// so this also checks which buttons have been used.  
	String action = request.getParameter("action");
    String resultMessage = null;

    if ("load".equals(action)) {
        try {
            MovieBean.dropTable();
            MovieBean.createTable();
            MovieBean.populateTable();
            resultMessage = "Database loaded successfully with 10 movies.";
        } catch (SQLException e) {
            resultMessage = "Error loading database: " + e.getMessage();
        }
    } else if ("drop".equals(action)) {
        try {
            MovieBean.dropTable();
            resultMessage = "Table dropped successfully.";
        } catch (SQLException e) {
            resultMessage = "Error dropping table: " + e.getMessage();
        }
    }

	
    // this scriptlet fetchs all primary keys to be values for dropdown
    // calls the static getAllKeys on the java file and this opens conneciton 
    // ADDED For this module, the get all keys is wrapped in a try and catch so that a missing table 
    // shows an emtpy drop down, not a 500 error 
   List<Integer> movieIds;
    try {
        movieIds = MovieBean.getAllKeys();
    } catch (SQLException e) {
        movieIds = new java.util.ArrayList<>();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>CSD430 - Movie Lookup</title>
</head>
<body>
    <h1>Movie Database Lookup</h1>
    <p>Select a movie ID below to view the full record for that entry.</p>
    
    
    <%   
    	// ADDED for mod 7	
        // Only shown right after a drop action was triggered
        if (resultMessage != null) {
    %>
        <p><%= resultMessage %></p>
    <%
        }
    %>
    
    <form action="index.jsp" method="get"> <!-- Added buttons to the top for dropping and loading a db. 
    fits better then at the bottom. This I hope will allow the use to see and use this feature better -->
        <button type="submit" name="action" value="load">Load Database</button>
        <button type="submit" name="action" value="drop">Drop Table</button>
    </form>
    
	 <!-- this submits to movieDisplay using a GET request. so the selected movieId shows
         up directly in the URL query string -->
    <form action="movieDisplay.jsp" method="get">
        <label for="movieId">Select Movie ID:</label>
        <select name="movieId" id="movieId">
            <%
                // Scriptlet loops through keys to build tags
                for (Integer id : movieIds) {
            %>
                <option value="<%= id %>"><%= id %></option>
            <%
                }
            %>
        </select>
        <input type="submit" value="View Movie">
   <%-- Link to the new Module 7 add-a-movie feature --%>

    </form>
    
    <p><a href="addMovie.jsp">Add a new movie</a></p> <!--new buttons added to provide access to new features for this module  --> 
    <p><a href="allMovies.jsp">View all movies</a></p>
   
    
</body>
</html>