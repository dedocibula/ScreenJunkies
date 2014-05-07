<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1 style="text-align:center;">Directors</h1>
<c:if test="${not empty directors}">

<div id="content">
    <table border="1" style="margin:auto;">
        <tr>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
        </tr>
        <c:forEach var="director" items="${directors}">
            <tr align="center">
                <td>${director.id}</td>
                <td>${director.firstName}</td>
                <td>${director.lastName}</td>
                <td>${director.age}</td>
            </tr>
        </c:forEach>
    </table>
    </c:if>

</body>
</html>