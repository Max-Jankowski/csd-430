<%-- 
	Max Jankowski 
	Bellevue University 
	CSD-430 Module 4
   
   
   This file used to instantiate a set of bean objects and populate them 
   with data, once again I'm going with clive cussler's the chase, will be adding more data 
   to this later as I continue to read more books in the series. 
   Java logic is confined entirely to scriptlet blocks
     
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.jankowski.beans.CharacterBean" %> <%-- This is a headache when not entered correctly --%>
<%@ page import="java.util.ArrayList" %>

<%-- 
	Scriplet used to build list of CharacterBean objects. All of the creation process here with no HTML in the 

 --%>
<%
    // Declaring and populating the list that will be feeding the tables rows in the body of the page 
    ArrayList<CharacterBean> characters = new ArrayList<CharacterBean>();

    // lead character
    CharacterBean c1 = new CharacterBean();
    c1.setCharacterName("Isaac Bell");
    c1.setRole("Lead Detective");
    c1.setOrganization("Van Dorn Detective Agency");
    c1.setNationality("American");
    c1.setEra("1906");
    c1.setDescription("The protagonist. A tall, blond, fearless investigator hired to "
            + "track down the Butcher Bandit across the American West.");
    characters.add(c1);

    // support role 
    CharacterBean c2 = new CharacterBean();
    c2.setCharacterName("Joseph Van Dorn");
    c2.setRole("Agency Founder & Director");
    c2.setOrganization("Van Dorn Detective Agency");
    c2.setNationality("American");
    c2.setEra("1906");
    c2.setDescription("The red-bearded founder of the agency and Bell's employer. "
            + "He oversees the nationwide manhunt from headquarters in Chicago.");
    characters.add(c2);

    // support / love intrest 
    CharacterBean c3 = new CharacterBean();
    c3.setCharacterName("Marion Morgan");
    c3.setRole("Secretary & Informant");
    c3.setOrganization("Independent");
    c3.setNationality("American");
    c3.setEra("1906");
    c3.setDescription("A pioneering female filmmaker traveling the West. She becomes "
            + "Isaac Bell's love interest and a central figure in the story.");
    characters.add(c3);

    // main antagonist 
    CharacterBean c4 = new CharacterBean();
    c4.setCharacterName("The Butcher Bandit");
    c4.setRole("Serial Bank Robber & Murderer");
    c4.setOrganization("None — operates alone (or does he?)");
    c4.setNationality("American");
    c4.setEra("1906");
    c4.setDescription("The primary antagonist. A ruthless killer who robs banks "
            + "across multiple states, leaving no witnesses alive.");
    characters.add(c4);

    // supporting agent 
    CharacterBean c5 = new CharacterBean();
    c5.setCharacterName("Detective Curtis");
    c5.setRole("Field Detective");
    c5.setOrganization("Van Dorn Detective Agency");
    c5.setNationality("American");
    c5.setEra("1906");
    c5.setDescription("One of Bell's trusted colleagues at the Van Dorn agency. "
            + "Assists with field investigation and intelligence gathering.");
    characters.add(c5);

    // historical cameo 
    CharacterBean c6 = new CharacterBean();
    c6.setCharacterName("Jack London");
    c6.setRole("Author & War Correspondent");
    c6.setOrganization("Independent");
    c6.setNationality("American");
    c6.setEra("1906");
    c6.setDescription("A real historical figure woven into the novel. The "
            + "author of The Call of the Wild appears during the aftermath of the "
            + "1906 San Francisco earthquake, which he historically documented firsthand.");
    characters.add(c6);
    
    // getting the list size for use in the caption 
    int recordCount = characters.size();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Chase – Character Data Display</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<!-- Page header, listed my name and class.   -->
<div class="page-header">
    <h1>The Chase &mdash; Character Roster</h1>
    <h2>Clive Cussler &bull; First Isaac Bell Adventure &bull; 2007</h2>
    <div class="author-line">Max Jankowski &mdash; CSD-430 Server-Side Development</div>
</div>

<!-- Providing the data description as required, viewer should know what they are looking at.  -->
<div class="dataset-description">
    <strong>Dataset Overview:</strong>
    This table presents character records from Clive Cussler's 
    <em>The Chase</em> from 2007, the first novel in the Isaac Bell series.  The story is set
    in 1906 and follows Bell, a detective for the Van Dorn Agency, as he hunts a murderous
    bank robber known only as the Butcher Bandit across the American West and Southwest.
    Nationality records present as later books broaden the settings, this is intended for later scaling.
    Each record below was stored in a <code>CharacterBean</code> object and is implementing
    <code>java.io.Serializable</code> and rendered here via JSP scriptlets.
    <strong>Total records loaded: <%=recordCount%>.</strong>
</div>

<!-- Providing information about the field descriptions. This is in an non-grid table format  -->
<div class="field-legend">
    <h3>Field Descriptions</h3>
    <table>
        <tr>
            <td>Character Name</td>
            <td>The full name (or alias) of the character as presented in the novel.</td>
        </tr>
        <tr>
            <td>Role</td>
            <td>The character's primary occupation or narrative function within the story.</td>
        </tr>
        <tr>
            <td>Organization</td>
            <td>The group, agency, or company the character is affiliated with.
                Characters with no affiliation are listed as <em>Independent</em>
                or <em>None — operates alone</em>.</td>
        </tr>
        <tr>
            <td>Nationality</td>
            <td>The character's country of origin or citizenship.</td>
        </tr>
        <tr>
            <td>Era</td>
            <td>The year or period in which the character is active within the novel's timeline.
                All entries are set in 1906 to reflect the novel's historical setting.</td>
        </tr>
        <tr>
            <td>Description</td>
            <td>A brief narrative summary of the character's significance to the plot.</td>
        </tr>
    </table>
</div>

<!--
	Rows on this table are made via scriplet. the loop opens and closes each tr, all html tags stay outside of its delimiters.   -->
<div class="data-table-wrapper">
    <table class="data-table">
        
        <thead>
            <tr>
                <th>#</th>
                <th>Character Name</th>
                <th>Role</th>
                <th>Organization</th>
                <th>Nationality</th>
                <th>Era</th> <%-- added this as the stories do move around and some characters are from the 40 and 50s  --%>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>

<%-- 
the second scriptlet, used to iterate the arraylist and write to rows above. loop opens and all td content is outside of the scriptlet  --%>
<%
    // Loop counter used for the row-number column
    int rowNum = 0;

    for (CharacterBean character : characters) {
        rowNum++;
%>
            <%-- Each <tr> and all its <td> cells are outside the scriptlet block --%>
            <tr>
                <td><%=rowNum%></td>
                <td class="name-cell"><%=character.getCharacterName()%></td>
                <td><%=character.getRole()%></td>
                <td><%=character.getOrganization()%></td>
                <td><%=character.getNationality()%></td>
                <td><%=character.getEra()%></td>
                <td class="desc-cell"><%=character.getDescription()%></td>
            </tr>

<%-- Close the for loop — still no HTML inside this scriptlet --%>
<%
    } // end for loop
%>

        </tbody>
    </table>
</div>
<div class="book-cover-wrapper">
        <img src="images/the_chase_cussler.jpg" alt="The Chase book cover">
</div> <!-- Added image to see if makes the page more interesting -->

<!-- Choosing not to do a footer at this time. at a later time I decided to move the head image to the bottom. its less in the way -->

</body>
</html>
