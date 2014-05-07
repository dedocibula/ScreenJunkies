<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1>Query Five</h1>
<h3>Lists the age of the oldest user.</h3>
<c:if test="${not empty oldestUser}">
    <table border="1">
        <c:set var="first" value="${oldestUser[0]}" />

        <tr>
        	<th>Oldest User's Age</th>
    	</tr>

        <c:forEach var="row" items="${oldestUser}">
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