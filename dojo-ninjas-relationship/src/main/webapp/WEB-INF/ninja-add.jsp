<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Add a ninja</title>
        <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>
    <div class="container">
        <h2>Add a ninja</h2>
        <div class="col-6">
        

        <form:form action="/ninjas/new" method="POST" modelAttribute="ninja">

             <div class="mb-3">
                <label for="select-dojo" class="form-label">Dojo</label>
                <select class="form-select" aria-label="select-dojo" name="dojo" id="select-dojo">
                    <c:forEach var="dojo" items="${dojos}">
                        <option value="${dojo.id}">${dojo.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="input1" class="form-label">First Name</label>
                <input type="text" name="firstName" class="form-control" id="input1" placeholder="Joe">
                <form:errors path="firstName" cssClass="text-danger fw-lighter fst-italic"/>
            </div>
             <div class="mb-3">
                <label for="input2" class="form-label">Last Name</label>
                <input type="text" name="lastName" class="form-control" id="input2" placeholder="John">
                <form:errors path="lastName" cssClass="text-danger fw-lighter fst-italic"/>
            </div>
            <div class="mb-3">
                <label for="input3" class="form-label">Age</label>
                <input type="number" name="age" class="form-control" id="input3" placeholder="20">
                <form:errors path="age" cssClass="text-danger fw-lighter fst-italic"/>
            </div>        
            <div class="mb-3">                
                <input type="submit" class="btn btn-primary" value="Add"/>
            </div>
        </form:form>
    
       
        
        
        </div>

    
    </div>
</body>
</html>