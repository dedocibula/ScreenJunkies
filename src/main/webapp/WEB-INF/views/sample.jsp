<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
    <h1>Sample Models</h1>

    <c:if test="${not empty samples}">
        <ul>
            <c:forEach var="sample" items="${samples}">
                <li>
                    <div>${sample.firstName}</div>
                    <div>${sample.lastName}</div>
                    <div>${sample.phoneNumber}</div>
                </li>
            </c:forEach>
        </ul>
    </c:if>

</body>
</html>
