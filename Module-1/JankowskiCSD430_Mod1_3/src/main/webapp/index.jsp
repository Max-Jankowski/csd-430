<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>    
    <title>First JSP Page module1.3</title>
</head>
<body>
<div class="card">

    <h1>Jankowski CSD 430 module 1.3 JSP</h1>

    <%-- displaying info declaring variables and perform logic server-side --%>
    <%
        String studentName = "Max Jankowski";
        String course      = "CSD-430 Server Side Development";
        java.util.Date now = new java.util.Date();

        int a = 15;
        int b = 27;
        int sum = a + b;
    %>

    <%-- HTML with embedded JSP expressions --%>
    <p>Student: <span class="highlight"><%= studentName %></span></p>
    <p>Course:  <span class="highlight"><%= course %></span></p>
    <p>Server time: <span class="highlight"><%= now %></span></p>

    <hr>
    <p>Java calculation: <%= a %> + <%= b %> = <span class="highlight"><%= sum %></span></p>
    <p>This value was computed on the <em>server side</em> using Java,
       then delivered to the browser as plain HTML.</p>

</div>
</body>
</html>