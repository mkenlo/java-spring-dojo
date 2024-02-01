<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Burger Tracker</title>
        <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>

    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
      <h5 class="my-0 mr-md-auto font-weight-normal"><a href="/">Burger Tracker</a></h5>
      
    </div>

    <div class="container">
        <div class="row py-3">

            <table class="table table-light table-hover">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Burger Name</th>
                        <th scope="col">Restaurant Name</th>
                        <th scope="col">Rating (out of 5)</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody class="table-striped table-group-divider">
                    <c:forEach var="burger" items="${burgers}" > 
                        <tr>
                            <td><c:out value="${burger.name}" /></td>
                            <td><c:out value="${burger.restaurantName}" /></td>
                            <td><c:out value="${burger.rating}" /></td>
                            <td><a href="/edit/<c:out value='${burger.id}'/>" >Edit</a></td>
                        </tr>
                    </c:forEach > 
                        
                    
                </tbody>
            </table>        
        </div>

        <div class="row py-3">

            <h2>Add a review</h2>

           <div class="col-4">
           
                <form:form modelAttribute="burger" action="/add" method="POST">
                    <div class="mb-3">
                        <label for="burgerName" class="form-label">Burger Name</label>
                        <input type="text" class="form-control" id="burgerName" name="name">
                        <form:errors path="name" cssClass="text-danger"/>
                    </div>
                    <div class="mb-3">
                        <label for="restaurantName" class="form-label">Restaurant Name</label>
                        <input type="text" class="form-control" id="restaurantName" name="restaurantName">
                        <form:errors path="restaurantName" cssClass="text-danger"/>
                    </div>

                    <div class="mb-3">
                        <select class="form-select" aria-label="rating dropdown" name="rating">
                            <option selected value="0">What's your rating?</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>  
                         <form:errors path="rating" cssClass="text-danger"/>
                    </div>
                    <div class="mb-3">
                        <label for="notes" class="form-label">Addititional notes</label>
                        <textarea class="form-control" id="notes" rows="3" name="notes"></textarea> 
                         <form:errors path="notes" cssClass="text-danger"/>                  
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form:form>
           
           
           </div>
        
        
        </div>

    </div>

</body>
</html>