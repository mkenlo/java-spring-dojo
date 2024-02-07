<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Add a dojo</title>
        <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>
    <div class="container">
        <h2 class="mt-3 mb-3">New Dojo</h2>

        <div class="col-6">
            <form:form action="/dojos/new" method="POST" modelAttribute="dojo">
            
                <div class="input-group mb-3">
                    
                    <input type="text" name="name" class="form-control" placeholder="Dojo's name" aria-label="Dojo's name" aria-describedby="button-addon2">
                    <button class="btn btn-outline-primary" type="submit" id="button-addon2">Create</button>
                    <form:errors path="name" cssClass="text-danger fw-lighter fst-italic"/>
                </div>
                
            </form:form>        
        </div>    
    </div>
</body>
</html>