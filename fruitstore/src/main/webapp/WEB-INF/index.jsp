<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta charset="UTF-8" />
    <title>Fruit Store Dashboard</title>   
        <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />  
    <link rel="stylesheet" href="/css/style.css"/>    
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>

    <div class="container">
    <h1> Fruit Store</h1>
        <div class="col-6-auto">
            <table class="table table-hover table-bordered border border-5 border-danger">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="fruit" items="${fruits}" >
                    <tr>
                        <td><c:out value="${fruit.name}" /></td>
                        <td><c:out value="${fruit.price}" /></td>
                    </tr>
                </c:forEach>    
            </tbody>
        </table>
        </div>
    </div>
   
</body>
</html>
