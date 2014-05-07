<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1 style="text-align:center;">Performers</h1>
<c:if test="${not empty performers}">

<div id="content">
    <table border="1" style="margin:auto;">
        <tr>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
            <th>Gender</th>
        </tr>
        <c:forEach var="performer" items="${performers}">
            <tr align="center">
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