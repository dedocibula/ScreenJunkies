<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1>Query Three</h1>
<h3>Lists the user who has the most friends.</h3>
<c:if test="${not empty user}">
    <table border="1">
        <c:set var="first" value="${user[0]}" />

        <tr>
        	<th>User ID</th>
        	<th>Number of Friends</th>
    	</tr>

        <c:forEach var="row" items="${user}">
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