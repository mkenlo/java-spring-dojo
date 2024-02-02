<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Expenses - Detail</title>
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

        <div class="row pt-4">
            <h2 class="text-danger-subtle mb-4">Expense Details</h2>
                    <div class="row mb-4">
                        <div class="col-3">
                            <label>Expense Name : </label>
                        </div>
                        <div class="col-6">
                            <p>${expense.name}</p>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-3">
                            <label>Description :</label>
                        </div>
                        <div class="col-6">
                            <p>${expense.description}</p>
                        </div>
                    </div>  

                    <div class="row mb-4">
                        <div class="col-3">
                            <label>Vendor : </label>
                        </div>
                        <div class="col-6">
                            <p>${expense.vendor}</p>
                        </div>       
                    </div>

                    <div class="row mb-4">
                        <div class="col-3">
                            <label>Amount : </label>
                        </div>
                        <div class="col-6">
                            <p><fmt:formatNumber value="${expense.amount}" type="currency" /></p>
                        </div>
                    </div>
                            
            </div>
        </div>
        
    
    
    
    
    </div>
</body>
</html>