<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1>Users</h1>
<h3>Lists the content of the users relation form the database.</h3>
<c:if test="${not empty users}">
    <table border="1">
        <tr>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Location</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr align="center">
                <td>${user.id}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.age}</td>
                <td>${user.gender}</td>
                <td>${user.location}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

</body>
</html>