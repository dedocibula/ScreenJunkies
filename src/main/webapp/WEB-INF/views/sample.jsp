<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
    <h1>Sample Models</h1>

    <c:if test="${not empty samples}">
        <table>
            <c:set var="first" value="${samples[0]}" />

            <c:forEach var="element" items="${first}">
                <th>${element.key}</th>
            </c:forEach>

            <c:forEach var="row" items="${samples}">
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
