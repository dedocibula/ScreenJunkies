<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<div id="content">
<c:choose>
    <c:when test="${not empty movie}">
        <h2 style="text-align: center">${movie.title} (${movie.year})</h2>
        <div>
        <div style="float: left;">
            <img src="${movie.image}" />
        </div>
        <div style="float: right; width: 65%">
            <table>
                <tr>
                    <td colspan="2" style="padding-bottom: 15px;"><i>${movie.criticsConsensus}</i></td>
                </tr>
                <tr>
                    <th>Release Date:</th>
                    <td>${movie.releaseDate}</td>
                </tr>
                <tr>
                    <th>MPAA Rating:</th>
                    <td>${movie.releaseDate}</td>
                </tr>
                <tr>
                    <th>Release Date:</th>
                    <td>${movie.mpaaRating}</td>
                </tr>
                <tr>
                    <th>Audience Rating:</th>
                    <td>${movie.ratings.audienceRating}</td>
                </tr>
                <tr>
                    <th>Audience Score:</th>
                    <td>${movie.ratings.audienceScore}</td>
                </tr>
                <tr>
                    <th>Critics Rating:</th>
                    <td>${movie.ratings.criticsRating}</td>
                </tr>
                <tr>
                    <th>Critics Rating:</th>
                    <td>${movie.ratings.criticsScore}</td>
                </tr>
            </table>
        </div>
        <div style="clear: both"></div>
        </div>
        <h4>Synopsis</h4>
        <div>
        ${movie.synopsis}
        </div>
    </c:when>
    <c:otherwise>
        <h2>Ups, ops</h2>
        <div>Your movie was not found :(</div>
    </c:otherwise>
</c:choose>
</div>

</body>
</html>
