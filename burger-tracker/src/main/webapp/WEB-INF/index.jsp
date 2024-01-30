<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Burger TRacker</title>
        <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css"/>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>

    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
      <h5 class="my-0 mr-md-auto font-weight-normal">Burger Tracker</h5>
      
    </div>

    <div class="container">
        <div class="row py-3">

            <table class="table table-light table-hover">
                <thead class="table-dark">
                    <tr>
                    <th scope="col">Burger Name</th>
                    <th scope="col">Restaurant Name</th>
                    <th scope="col">Rating (out of 5)</th>
                    </tr>
                </thead>
                <tbody class="table-striped table-group-divider">
                    <!-- <c:forEach var="burger" items="${burgers}" > 
                        <tr>
                            <td><c:out value="${burger.name}" /></td>
                            <td><c:out value="${burger.restaurantName}" /></td>
                            <td><c:out value="${burger.rating}" /></td>
                        </tr>
                    </c:forEach > -->
                        <tr>
                            <td>Krabby Patty</td>
                            <td>Krusty Krab</td>
                            <td>4</td>
                        </tr>
                    
                </tbody>
            </table>        
        </div>

        <div class="row">
        
        
        </div>

    </div>

</body>
</html>