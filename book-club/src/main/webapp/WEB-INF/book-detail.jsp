<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="/css/style.css"/>
</head>

<body>

    <c:set var="userName" value="You" scope="page" />
    <c:set var="userPronoun" value="your" scope="page"/>
    <c:if test="${userId!=book.reviewer.id}">
        <c:set var="userName" value="${book.reviewer.name}"/>
        <c:set var="userPronoun" value="${book.reviewer.name}"/>
    </c:if>
    <nav class="navbar bg-body-secondary shadow-sm">
        <div class="container">
            <span class="navbar-brand mb-0 h1 text-primary"><a href="/books">The Book Club</a></span>
            <div class="nav d-flex justify-content-end p-2">
                
                <span class="material-symbols-outlined">account_circle</span>
                <strong class="text-primary-emphasis text-capitalize">${user.name}</strong>&nbsp;&nbsp;&nbsp;
                <a href="/logout"> Logout</a>
            </div>
        </div>
    </nav>

    <div class="container bg-gray p-3">
        
        <div class="d-flex justify-content-between py-2  mb-3">
            <h4 class="text-primary-emphasis">${book.title}</h4>
            <a href="/books">Back to Shelf</a>
        </div>
        <div class="row">       
            <em><span class="text-primary text-capitalize">${userName}</span> read <strong class="text-primary-emphasis">${book.title}</strong> by <span class="text-info-emphasis"><u>${book.author}</u></span></em>
            <p>Here are <span>${userPronoun}</span>'s thoughts</p> 
            <div class="border-primary blue border-start border-4 mb-3">                
                <blockquote class="blockquote p-3">
                    <p>${book.review}</p>
                </blockquote>                
            </div>

            <c:if test="${userId==book.reviewer.id}">
                <div class="col-sm-4">
                    <a href="/books/${book.id}/edit" class="btn btn-outline-primary">Edit</a>
                    <a href="/books/${book.id}/delete" class="btn btn-outline-danger">Delete</a>
                </div>
            </c:if>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>