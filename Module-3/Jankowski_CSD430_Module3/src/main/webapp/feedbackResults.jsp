<!-- Max Jankowski 
	 Bellevue University 
	 CSD 430 Module 3 results jsp -->


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Genre Fiction Reader Feedback - Results</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>



<%
    // Scriptlet meant to capture submitted form data. request.getParameter() returns a single value, used here for the
    // text input,

    String readerName = request.getParameter("readerName");
    String ageRange = request.getParameter("ageRange");
    String preferredFormat = request.getParameter("preferredFormat");
    String[] genresSelected = request.getParameterValues("genres");
    String satisfaction = request.getParameter("satisfaction");
    String comments = request.getParameter("comments");

    // Build one readable string out of the genres array, since the
    // checkbox group can submit zero, one, or several values.
    String genresDisplay;
    if (genresSelected == null || genresSelected.length == 0) {
        genresDisplay = "No genres selected";
    } else {
        StringBuilder genresBuilder = new StringBuilder();
        for (int i = 0; i < genresSelected.length; i++) {
            genresBuilder.append(genresSelected[i]);
            if (i < genresSelected.length - 1) {
                genresBuilder.append(", ");
            }
        }
        genresDisplay = genresBuilder.toString();
    }

    // Comments are on optinal field for the user so there is a fall back to a placeholder if left blank
    if (comments == null || comments.trim().isEmpty()) {
        comments = "No additional comments provided";
    }
%>

<h1>Genre Fiction Reader Feedback - Submission Summary</h1>

<p class="intro">This page displays the feedback a client of our fiction just
    submitted through the survey. Each row below corresponds to one
    question on the form: the <strong>Field</strong> column names the
    question, the <strong>Description</strong> column explains what it was
    asking, and the <strong>Submitted Value</strong> column shows the
    reader's actual answer, pulled from the HTTP POST request.</p>


<!-- Building a table to display data collected from feedbackForm file.  -->
<table>
    <tr>
        <th>Field</th>
        <th>Description</th>
        <th>Submitted Value</th>
    </tr>
    <tr>
        <td>Reader Name</td>
        <td>The name the reader entered to identify their submission.</td>
        <td><%= readerName %></td>
    </tr>
    <tr>
        <td>Age Range</td>
        <td>The age bracket the reader selected from the dropdown menu.</td>
        <td><%= ageRange %></td>
    </tr>
    <tr>
        <td>Preferred Reading Format</td>
        <td>How the reader most often consumes books: physical, e-book, or audiobook.</td>
        <td><%= preferredFormat %></td>
    </tr>
    <tr>
        <td>Favorite Genres</td>
        <td>One or more genres the reader enjoys, selected from a checkbox list.</td>
        <td><%= genresDisplay %></td>
    </tr>
    <tr>
        <td>Satisfaction with Genre Selection</td>
        <td>A 1-5 rating of how satisfied the reader is with available titles in their favorite genres.</td>
        <td><%= satisfaction %></td>
    </tr>
    <tr>
        <td>Additional Comments</td>
        <td>Free-text feedback the reader chose to add.</td>
        <td><%= comments %></td>
    </tr>
</table>



</body>
</html>
