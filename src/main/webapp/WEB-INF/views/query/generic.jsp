<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1 style="text-align:center;">Generic SQL Query</h1>

<c:if test="${not empty result}">
<div id="content">
    <table border="1" style="margin:auto;">
        <c:set var="first" value="${result[0]}" />

        <c:forEach var="element" items="${first}">
            <th>${element.key}</th>
        </c:forEach>

        <c:forEach var="row" items="${result}">
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
</div>
</body>
</html>