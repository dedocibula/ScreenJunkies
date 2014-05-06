<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1>Certificates</h1>

<c:if test="${not empty certificates}">
    <table>
        <tr>
            <th>Name</th>
            <th>Content</th>
        </tr>
        <c:forEach var="certificate" items="${certificates}">
            <tr>
                <td>${certificate.name}</td>
                <td>${certificate.content}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

</body>
</html>