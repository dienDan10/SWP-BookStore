
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Success</title>
    <link rel="icon" type="image/x-icon" href="image/favicon.png">
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv = "refresh" content = "3; url = http://localhost:8080/login" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<c:if test="${not empty resetSuccess}">
    <div class="alert alert-success mx-auto mt-5" style="max-width: 500px" role="alert">
        ${resetSuccess}
    </div>
</c:if>
</body>
</html>
