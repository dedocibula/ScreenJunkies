<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1 style="text-align:center;">Query Two</h1>
<h3 style="text-align:center;">List the names of directors who have directed at least one movie in each genre.</h3>
<c:if test="${not empty directors}">
<div id="content">
    <table border="1" style="margin:auto;">
        <c:set var="first" value="${directors[0]}" />

        <tr>
            <th>Director ID</th>
            <th>First Name</th>
            <th>Last Name</th>
        </tr>

        <c:forEach var="row" items="${directors}">
            <tr align="center">
                <c:forEach var="element" items="${row}">
                    <td>
                        <div>${element.value}</div>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    </c:if>

</body>
</html>