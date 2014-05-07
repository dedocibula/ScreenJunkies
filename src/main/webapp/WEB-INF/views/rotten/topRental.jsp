<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>



<c:if test="${not empty movies}">

    <div id="content">

        <h1 style="text-align:center;">Top Rental DVDs</h1>
        <h3 style="text-align:center;">This page shows the most wanted DVDs.</h3>
        <table border="1" style="margin:auto;">
            <tr>
                <th></th>
                <th>Title</th>
                <th>Release Date</th>
                <th>Critics Consensus</th>
                <th></th>
            </tr>
            <c:forEach var="movie" items="${movies}">
                <tr align="center">
                    <td><img src="${movie.thumbnail}" /></td>
                    <td>${movie.title}</td>
                    <td>${movie.releaseDate}</td>
                    <td>${movie.criticsConsensus}</td>
                    <td>
                        <form id="superForm" action="/rotten" method="post">
                            <input type="hidden" name="title" value="${movie.title}">
                            <input style="height: inherit; cursor: pointer" type="submit" value="Details">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </div>
</c:if>

</body>
</html>