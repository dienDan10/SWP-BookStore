
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home Page</title>
</head>
<body>
<a href="/login">Login</a>

<br/>
<c:if test="${not empty user}">
    <a href="/logout">Logout</a>
</c:if>
<br/>

<c:if test="${not empty user}">
<p>${user}</p>
</c:if>


</body>
</html>
