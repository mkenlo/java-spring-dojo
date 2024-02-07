<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Dojo Detail</title>
        <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>
    <div class="container">
        <h2 class="mt-3 mb-3">${dojo.name} Ninjas</h2>

        <c:if test="${info!=null}">
            <div class="alert alert-success" role="alert">${info}</div>
        </c:if>
        <table class="mt-3 mb-3 table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Age</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ninja" items="${dojo.ninjas}">                
                    <tr>       
                        <td></td>         
                        <td>${ninja.firstName}</td>
                        <td>${ninja.lastName}</td>
                        <td>${ninja.age}</td>
                    </tr>                
                </c:forEach>            
                
            </tbody>
        </table>
       

    <a href="/dojos" class="btn btn-outline-danger" >See other dojos</a> 
    <a href="/ninjas/new" class="btn btn-outline-success" >Add another ninja</a>
    </div>
</body>
</html>