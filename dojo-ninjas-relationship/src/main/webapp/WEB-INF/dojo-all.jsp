<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Hello</title>
        <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css"/>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>
    <div class="container">
    
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Num of ninjas</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="dojo" items="${dojos}">                
                    <tr>      
                        <td>${dojo.id}</td>          
                        <td><a href="/dojos/${dojo.id}">${dojo.name}</a></td>
                        <td>${dojo.ninjas.size()}</td>
                    </tr>                
                </c:forEach>            
                
            </tbody>
        </table>
    </div>
</body>
</html>