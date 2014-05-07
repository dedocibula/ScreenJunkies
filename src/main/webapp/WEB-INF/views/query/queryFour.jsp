<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<%@ include file="../header.jsp" %>

<body>

<%@ include file="../layout.jsp" %>

<h1>Query Four</h1>
<h3>Lists the most common rate score</h3>
<c:if test="${not empty rateScore}">
    <table border="1">
        <c:set var="first" value="${rateScore[0]}" />

        <tr>
        	<th>Rate Score</th>
    	</tr>

        <c:forEach var="row" items="${rateScore}">
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