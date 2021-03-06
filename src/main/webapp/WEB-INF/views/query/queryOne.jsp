<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1 style="text-align:center;">Query One</h1>
<h3 style="text-align:center;">Lists the 10 latest videos that the actor “Brad Pitt” participated in.</h3>

<c:if test="${not empty latestVideos}">
<div id="content">
    <table border="1" style="margin:auto;">
        <c:set var="first" value="${latestVideos[0]}" />

        <tr>
            <th>Title</th>
            <th>Release Year</th>
        </tr>

        <c:forEach var="row" items="${latestVideos}">
            <tr>
                <c:forEach var="element" items="${row}">
                    <td align="center">
                        <div>${element.value}</div>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    </c:if>

</body>
</html>