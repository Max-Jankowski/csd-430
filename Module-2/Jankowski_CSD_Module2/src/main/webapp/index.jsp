<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--     
    Max Jankowski
    Bellevue University 
    CSD-430 Module 2
    
    Description: Displays character data from Clive Cussler's "The Chase" (2007)
                 using JSP scriptlets for Java logic and an external CSS stylesheet.
--%>

<%-- Scriptlet, declaring and populating data arrays --%>
<%
    /* Three fields per record: Name, Role, Description */
    String[] names = {
        "Isaac Bell",
        "The Butcher",
        "Marion Morgan",
        "Joseph Van Dorn",
        "Detective Curtis"
    };

    String[] roles = {
        "Protagonist",
        "Antagonist",
        "Love Interest",
        "Agency Founder",
        "Supporting Detective"
    };

    String[] descriptions = {
        "A determined Van Dorn detective hired to track down a serial killer across the American West.",
        "A ruthless serial killer and bank robber known for leaving no witnesses and no trail.",
        "A bold and independent woman who becomes close to Isaac Bell during the investigation.",
        "Founder of the Van Dorn Detective Agency who assigns Bell to the case.",
        "A fellow Van Dorn detective who assists Bell in gathering intelligence on the Butcher."
    };

    /* number of records */
    int recordCount = names.length;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>The Chase - Character Data</title>

    <%-- Link to the CSS stylesheet --%>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

    <%-- Page title and description, indicating that its a book and including cover image --%>
    <h1>The Chase &mdash; Clive Cussler (2007)</h1>
    <img src="images/the_chase_cussler.jpg" 
     	 alt="The Chase by Clive Cussler" 
     	 width="150">
    <h2>Character Record Data</h2>
    <p>
        The following table displays key character records from Clive Cussler's
        historical thriller <em>The Chase</em>. Set to the interesting backdrop of just before and during the
        1906 San Francisco earthquake, the novel follows the adventure of Van Dorn detective Isaac Bell
        as he pursues a cunning serial killer known as the Butcher Bandit (antagonists hates the name) across the American West.
        Another interesting note is that due to the setting, its great for historical cameos, Jack London makes an appearance. 
    </p>
    <p>Total records: <%= recordCount %></p>

    <%-- building the html table and displaying  data --%>
    <table>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th>Description</th>
        </tr>

        <%-- Scriptlet loop through records and write table rows --%>
        <%
            for (int i = 0; i < recordCount; i++) {
        %>
            <%-- HTML table row outside of the scriptlet --%>
            <tr>
                <td><%= names[i] %></td>
                <td><%= roles[i] %></td>
                <td><%= descriptions[i] %></td>
            </tr>
        <%
            } /* end of the loop */
        %>

    </table>

      
</body>
</html>