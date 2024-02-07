<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Hello</title>
        <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>
    <div class="container">
    
        <div class="mt-3 card text-center">
            <div class="card-header"> Welcome</div>
            <div class="card-body">
                <p class="card-text">Dojos and Ninjas</p>
                <a href="/dojos" class="btn btn-primary">See all Dojos</a>
            </div>
        </div>
      
    </div>
</body>
</html>