<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta charset="UTF-8" />
    <title>Time Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
    <div class="main">
        <h1><c:out value="${todayTime}" /></h1>
    </div>
    <script src="js/script.js"></script>
</body>
</html>
