<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="layout.css" /> 
    </head>

<body>
    		<header>
              <table style="width: 98%">
                <tr>
              <td align="right"><font size="6">Screen Junkies</font><br></td>
              <td align="center">
                    <form action="j_security_check" method=post>
                        <p> <font size="2">Enter Query Here:</font>
                        <input type="text" name="j_username" size="25">
                        <input type="reset" value="Clear">
                        <input type="submit" value="Submit">
                    </form>
              </td>
              <td align="right"><font> Mohammed Tanvir | Dev Mehta | Andrej Galad</font></td>
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