<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1>Query Five</h1>

<c:if test="${not empty oldestUser}">
    <table>
        <c:set var="first" value="${oldestUser[0]}" />

        <c:forEach var="element" items="${first}">
            <th>${element.key}</th>
        </c:forEach>

        <c:forEach var="row" items="${oldestUser}">
            <tr>
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