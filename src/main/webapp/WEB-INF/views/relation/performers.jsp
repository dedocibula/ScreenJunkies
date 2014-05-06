<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="utf-8" />

       <style type="text/css">
            <%@ include file="/WEB-INF/views/css/layout.css" %>
        </style>
        
    </head>
 
    <body> <!-- Will use "body" styles in css file -->
        
 
            <header> <!-- New HTML5 tag, uses 'header' styles in css file -->
              <table style="width: 98%">
                <tr>
              <td align="right"><font color="#F8F8F8" size="6">Screen Junkies</font><br></td>
              <td align="center">
                    <form action="j_security_check" method=post>
                        <p> <font color="F8F8F8" size="2">Enter Query Here:</font>
                        <input type="text" name="j_username" size="25">
                        <input type="reset" value="Clear">
                        <input type="submit" value="Submit">
                    </form>
              </td>
              <td align="right"><font color="#F8F8F8">Mohammed Tanvir | Dev Mehta | Andrej Galad</font></td>
            </tr>
            </table>
            </header> <!-- Header -->
 
            <nav> <!-- New HTML5 tag, uses 'nav' styles in css file -->
              <div class="menu">
                    <ul><a href="homepage.html" style="text-decoration: none">Home</a></ul>
                    <ul><a href="movies.html" style="text-decoration: none">Movies</a></ul>
                    
                    <ul><a href="directors.html" style="text-decoration: none">Directors</a></ul>                    
                    <ul><a href="performers.html" style="text-decoration: none">Performers</a></ul> 
					<ul><a href="collections.html" style="text-decoration: none">Collections</a></ul> 
					<ul><a href="seasons.html" style="text-decoration: none">Seasons</a></ul> 
                    
                    <ul><a href="tvshows.html" style="text-decoration: none">TV Shows</a></ul>
                    <ul><a href="friends.html" style="text-decoration: none">Friends</a></ul>
                    <ul><a href="userprofile.html" style="text-decoration: none">User Profile</a></ul>
                    
                    <ul><a href="login.html" style="text-decoration: none">Log in</a></ul>        
                    <ul><a href="createaccount.html" style="text-decoration: none">Create Account</a></ul>                   

              </div>
            </nav> <!-- Navigation Bar -->
 
            <div id="content"> <!-- Will use "content" styles in css file -->

            <h1>Performer Table</h1>

<c:if test="${not empty performers}">
    <table>
        <tr>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
            <th>Gender</th>
        </tr>
        <c:forEach var="performer" items="${performers}">
            <tr>
                <td>${performer.id}</td>
                <td>${performer.firstName}</td>
                <td>${performer.lastName}</td>
                <td>${performer.age}</td>
                <td>${performer.gender}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

            </div> <!-- Content -->

       
    </body>
</html>