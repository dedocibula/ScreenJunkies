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
                   <ul><a href="/ScreenJunkies/" style="text-decoration: none">Home</a></ul>
                    <ul><a href="/ScreenJunkies/query/one" style="text-decoration: none">Query1</a></ul>
                    <ul><a href="/ScreenJunkies/query/two" style="text-decoration: none">Query2</a></ul>
                    <ul><a href="/ScreenJunkies/query/three" style="text-decoration: none">Query3</a></ul>
                    <ul><a href="/ScreenJunkies/query/four" style="text-decoration: none">Query4</a></ul>
                    <ul><a href="/ScreenJunkies/query/five" style="text-decoration: none">Query5</a></ul>
                    <ul><a href="certificates" style="text-decoration: none">Certificates</a></ul>
                    <ul><a href="directors" style="text-decoration: none">Directors</a></ul>
                    <ul><a href="performers" style="text-decoration: none">Performers</a></ul>
                    <ul><a href="seasons" style="text-decoration: none">Seasons</a></ul>
                    <ul><a href="users" style="text-decoration: none">Users</a></ul>                     

              </div>
            </nav> <!-- Navigation Bar -->
 
            <div id="content"> <!-- Will use "content" styles in css file -->

<h1>Season Table</h1>

<c:if test="${not empty seasons}">
    <table>
        <tr>
            <th>Title</th>
            <th>Number</th>
        </tr>
        <c:forEach var="season" items="${seasons}">
            <tr>
                <td>${season.title}</td>
                <td>${season.number}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

            </div> <!-- Content -->

       
    </body>
</html>