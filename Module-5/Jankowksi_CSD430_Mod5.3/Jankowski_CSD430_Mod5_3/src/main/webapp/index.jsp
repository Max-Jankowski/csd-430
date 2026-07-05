<%-- Max Jankowski
	 Bellevue University 
	 CSD 430 Module 5.3 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.jankowski.beans.MovieBean" %>
<%
    // this scriptlet fetchs all primary keys to be values for dropdown
    // calls the static getAllKeys on the java file and this opens conneciton 
    List<Integer> movieIds = MovieBean.getAllKeys();
%>
<!DOCTYPE html>
<html>
<head>
    <title>CSD430 - Movie Lookup</title>
</head>
<body>
    <h1>Movie Database Lookup</h1>
    <p>Select a movie ID below to view the full record for that entry.</p>
    
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
    </form>
</body>
</html>