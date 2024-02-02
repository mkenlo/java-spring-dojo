<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Edit an expense</title>
        <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>
    <fmt:setLocale value = "en_US"/>
    <div class="d-flex align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
        <h5 class="my-0 mr-md-auto font-weight-normal"><a href="/expenses">Save Travels</a></h5>
    </div>

    <div class="container">

        <div class="row">
            <h2 class="text-danger-subtle p-3">Edit an expense</h2>
             <div class="col-9">
           
                <form:form modelAttribute="expense" action="/expenses/edit/${expense.id}" method="PUT">
                    <div class="row mb-4">

                        <div class="col-3">
                            <label for="expenseName" class="form-label ml-3">Expense Name <span class="text-danger">*</span>: </label>
                        </div>
                        <div class="col-6">
                            <input type="text" class="form-control" id="expenseName" name="name" value="${expense.name}">
                            <form:errors path="name" cssClass="text-danger fw-lighter fst-italic"/>
                        </div>                    
                        
                    </div>
                    <div class="row mb-4">
                        <div class="col-3">
                            <label for="vendor" class="form-label">Vendor <span class="text-danger">*</span>: </label>
                        </div>
                        <div class="col-6">
                            <input type="text" class="form-control" id="vendor" name="vendor" value="${expense.vendor}">
                            <form:errors path="vendor" cssClass="text-danger fw-lighter fst-italic"/>
                        </div>       
                    </div>

                    <div class="row mb-4">
                        <div class="col-3">
                            <label for="amount" class="form-label">Amount <span class="text-danger">*</span>: </label>
                        </div>
                        <div class="col-6">
                            <input type="number" class="form-control" id="amount" name="amount" value="${expense.amount}">
                            <form:errors path="amount" cssClass="text-danger fw-lighter fst-italic"/>
                        </div>
                        
                        
                    </div>
                    <div class="row mb-4">
                        <div class="col-3">
                            <label for="desc" class="form-label">Description <span class="text-danger">*</span>:</label>
                        </div>
                        <div class="col-6">
                            <textarea class="form-control" id="desc" rows="6" name="description" placeholder="Describe the expense">${expense.description}</textarea> 
                            <form:errors path="description" cssClass="text-danger fw-lighter fst-italic"/>                        
                        </div>
                      </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form:form>
           
           
           </div>
        
        </div>
    
    
    
    </div>
</body>
</html>