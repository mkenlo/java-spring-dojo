<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        .errors {
            font-size: .875em;
            margin-top: 0.25em;
            color: #e60553;
        }
    </style>
</head>

<body>
    <div class="container bg-gray p-5">
        <div class="row">
            <h1 class="display-1 text-primary">Welcome </h1>
            <h2 class="text-primary-emphasis">Join our growing community</h2>
        </div>
        
        <div class="row">
            <div class="col-md-4 col-sm-6 p-2">
                <h3>Create an account</h3>
                <form:form action="/register" method="POST" modelAttribute="newUser">
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="username" placeholder="joedalton"
                                name="userName">
                            <label for="username">Username</label>
                        </div>
                        <form:errors path="userName" class="errors" />
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="email" placeholder="name@example.com"
                                name="email">
                            <label for="email">Email address</label>
                        </div>
                        <form:errors path="email" class="errors" />
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="newPassword" placeholder="Password"
                                name="password">
                            <label for="newPassword">Password</label>
                        </div>
                        <form:errors path="password" class="errors" />
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="confirmPassword"
                                placeholder="Confirm Password" name="confirm">
                            <label for="confirmPassword">Confirm Password</label>
                        </div>
                        <form:errors path="confirm" class="errors" />
                    </div>
                    <div>
                        <input type="submit" class="form-control btn btn-outline-primary" value="Register">
                    </div>

                </form:form>
            </div>
            <div class="col-md-3"></div>
            <div class="col-md-4 col-sm-6 p-2">

                    <div class="row p-2">
                        <c:if test="${loginRequired!=null}" >
                            <div class="alert alert-danger" role="alert">
                            <h4 class="alert-heading">Oups!</h4>
                                <p>${loginRequired}</p>            
                        </c:if>        
                    </div>

                <h3>Login</h3>
                <form:form action="/login" method="POST" modelAttribute="newLogin">               
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="loginEmail" placeholder="name@example.com"
                                name="email">
                            <label for="loginEmail">Email address</label>
                        </div>
                        <form:errors path="email" class="errors" />                        
                    </div>                    
                    
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="loginPassword" placeholder="Password"
                                name="password">
                            <label for="loginPassword">Password</label>
                        </div>
                        <form:errors path="password" class="errors"  />
                    </div>
                    <div>
                        <input type="submit" class="form-control btn btn-outline-primary" value="Log in">
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>