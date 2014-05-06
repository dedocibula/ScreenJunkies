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
              <td align="right"><font color="#F8F8F8" size="6">Screen Junkies</font><br></td>
              <td align="center">
                      <form action="/query" method=post>
                        <p> <span style="font-size: x-small; ">Enter Query Here:</span>
                        <input type="text" name="sql" size="25">
                        <input type="reset" value="Clear">
                        <input type="submit" value="Submit">
                    </form>

              </td>
              <td align="right"><font color="#F8F8F8"> Mohammed Tanvir | Dev Mehta | Andrej Galad</font></td>
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
              </div>
            </nav> <!-- Navigation Bar -->
            <div id="content" style="padding-left:5%; background-image: url(../src/main/resources/movie.jpeg);">
            </div>
</body>
</html>