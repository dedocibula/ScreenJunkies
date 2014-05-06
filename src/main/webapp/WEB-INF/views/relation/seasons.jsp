<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1>Seasons</h1>

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

</body>
</html>