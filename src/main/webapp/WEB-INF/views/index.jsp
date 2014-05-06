<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
        <meta charset="utf-8" />

        <style type="text/css">
            <%@ include file="css/layout.css" %>
        </style>
        
        </head>

<body>
    		<header>
              <table style="width: 98%">
                <tr>
              <td align="right"><span style="color: #F8F8F8; font-size: x-large; ">Screen Junkies</span><br></td>
              <td align="center">
                      <form action="/query" method=post>
                        <p> <span style="font-size: x-small; ">Enter Query Here:</span>
                        <input type="text" name="sql" size="25">
                        <input type="reset" value="Clear">
                        <input type="submit" value="Submit">
                    </form>

              </td>
              <td align="right"><span style="color: #F8F8F8; "> Mohammed Tanvir | Dev Mehta | Andrej Galad</span></td>
            </tr>
            </table>
            </header>
            <nav> 
              <div class="menu">
                    <ul><a href="" style="text-decoration: none">Home</a></ul>
                    <ul><a href="query/one" style="text-decoration: none">Query1</a></ul>
                    <ul><a href="query/two" style="text-decoration: none">Query2</a></ul>
                    <ul><a href="query/three" style="text-decoration: none">Query3</a></ul>
                    <ul><a href="query/four" style="text-decoration: none">Query4</a></ul>
                    <ul><a href="query/five" style="text-decoration: none">Query5</a></ul>
                    <ul><a href="relation/certificates" style="text-decoration: none">Certificates</a></ul>
                    <ul><a href="relation/directors" style="text-decoration: none">Directors</a></ul>
                    <ul><a href="relation/performers" style="text-decoration: none">Performers</a></ul>
                    <ul><a href="relation/seasons" style="text-decoration: none">Seasons</a></ul>
                    <ul><a href="relation/users" style="text-decoration: none">Users</a></ul>
                                        
              </div>
            </nav> <!-- Navigation Bar -->
            <div id="content" style="padding-left:5%; background-image: url(../src/main/resources/movie.jpeg);">
            </div>
</body>
</html>