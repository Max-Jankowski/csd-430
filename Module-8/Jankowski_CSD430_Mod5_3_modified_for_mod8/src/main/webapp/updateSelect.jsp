<%-- 
   Max Jankowski 
   Bellevue university 
   CSD-430 Module 8 
   
   New updateSelect.jsp file to display a drop down of the movie record user wants to change. I went with this approuch 
   of two different pages as I was'nt able to thing of a way to effectively and in a user friendly way implement this function 
   into the index page. Other other option was to include buttons in the display page. But that would not have been very intuative. 
   This way the user goes to a page with a dropdown that allows them to select the movie they want to modify.  	
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.jankowski.beans.MovieBean" %>
<%@ page import="java.sql.SQLException" %>
<%
    // using a scriptlet to get all primary values of the movies same approach used on index.jsp for the lookup feature.
    
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
    <title>CSD430 - Select Movie to Update</title>
    <style>
    	/* Learned about the in in html styling and included it here to improve readability i hope. Thought is was interesting as to not have to include a seperate css file */
        body { font-family: Arial, sans-serif; margin: 40px; }
        form { margin-bottom: 20px; }
        label { display: inline-block; width: 120px; }
    </style>
</head>
<body>
    <h1>Update a Movie</h1>
    <p>Select a movie ID below to load its current values into an
       editable form.</p>
       
       <!-- the form submits GET to the updateRecords file. by not using post the movieid appears in the url  -->

    <form action="updateRecord.jsp" method="get">
        <label for="movieId">Select Movie ID:</label>
        <select name="movieId" id="movieId">
            <%
                // scriptlet to loop through the ids allowing for the building of the dropdown
                for (Integer id : movieIds) {
            %>
                <option value="<%= id %>"><%= id %></option>
            <%
                }
            %>
        </select>
        <input type="submit" value="Load Record">
    </form>

    <p><a href="index.jsp">Back to home</a></p>
</body>
</html>