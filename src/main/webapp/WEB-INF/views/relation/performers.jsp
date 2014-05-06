<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1>Performers</h1>

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

</body>
</html>