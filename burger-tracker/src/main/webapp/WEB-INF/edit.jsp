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

            <h2 class="text-primary">Edit a review</h2>

           <div class="col-6">
           
                <form:form modelAttribute="burger" action="/edit/${burger.id}" method="PUT">
                    <div class="mb-3">
                        <label for="burgerName" class="form-label">Burger Name</label>
                        <input type="text" class="form-control" id="burgerName" name="name" value="<c:out value='${burger.name}' />">
                        <form:errors path="name" cssClass="text-danger"/>
                    </div>
                    <div class="mb-3">
                        <label for="restaurantName" class="form-label">Restaurant Name</label>
                        <input type="text" class="form-control" id="restaurantName" name="restaurantName" value="<c:out value='${burger.restaurantName}' />">
                        <form:errors path="restaurantName" cssClass="text-danger"/>
                    </div>

                    <div class="mb-3">
                        <c:set var="ratingOptions" value="${[1,2,3,4,5]}" scope="page"/>
                        <label for="ratingDropdown" class="form-label">What's your rating?</label>
                        <select class="form-select" aria-label="rating dropdown" name="rating" id="ratingDropdown">
                            <c:forEach var="option" items="${ratingOptions}" >
                                <option value="${option}" <c:if test="${burger.rating == option}" >   selected   </c:if>>               
                                    <c:out value="${option}"/>
                                </option>
                            
                            </c:forEach>
                            
                        </select>  
                         <form:errors path="rating" cssClass="text-danger"/>
                    </div>
                    <div class="mb-3">
                        <label for="notes" class="form-label">Addititional notes</label>
                        <textarea class="form-control" id="notes" rows="3" name="notes"><c:out value="${burger.notes}" /></textarea> 
                         <form:errors path="notes" cssClass="text-danger"/>                  
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form:form>
           
           
           </div>
        
        
        </div>

    </div>

</body>
</html>