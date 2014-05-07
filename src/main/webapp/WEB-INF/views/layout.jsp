<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <table style="width: 98%">
        <tr>
            <td align="right"><a href="/" style="text-decoration: none"><span style="color: #F8F8F8; font-size: x-large; ">Screen Junkies</span></a></td>
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

        <ul><a href="/relation/users" style="text-decoration: none">Users</a></ul>
        <ul><a href="/relation/directors" style="text-decoration: none">Directors</a></ul>
        <ul><a href="/relation/performers" style="text-decoration: none">Performers</a></ul>
        <ul><a href="/relation/seasons" style="text-decoration: none">Seasons</a></ul>
        <ul><a href="/relation/certificates" style="text-decoration: none">Certificates</a></ul>

        <!-- Dummy values for nav2 bar -->
        <ul><a href="/query/one" style="text-decoration: none">Query1</a></ul>
        <ul><a href="/query/two" style="text-decoration: none">Query2</a></ul>
        <ul><a href="/query/three" style="text-decoration: none">Query3</a></ul>
        <ul><a href="/query/four" style="text-decoration: none">Query4</a></ul>
        <ul><a href="/query/five" style="text-decoration: none">Query5</a></ul>

    </div>
</nav> <!-- Navigation Bar -->


<div id="nav"> <!-- New HTML5 tag, uses 'nav' styles in css file -->
    <div class="menu">

        <ul><a href="/rotten/boxOffice" style="text-decoration: none">Blockbusters</a></ul>
        <ul><a href="/rotten/inTheaters" style="text-decoration: none">In Theaters</a></ul>
        <ul><a href="/rotten/upcomingMovies" style="text-decoration: none">Upcoming Movies</a></ul>
        <ul><a href="/rotten/topRentals" style="text-decoration: none">Top Rentals</a></ul>
        <ul><a href="/rotten/currentReleases" style="text-decoration: none">Current Release DVDs</a></ul>
        <ul><a href="/rotten/upcomingDvds" style="text-decoration: none">Upcoming DVDs</a></ul>

    </div>
</div> <!-- Navigation Bar -->
