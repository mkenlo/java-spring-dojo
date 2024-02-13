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
    <nav class="navbar bg-body-secondary shadow-sm">
        <div class="container">
            <span class="navbar-brand mb-0 h1 text-primary"><a href="/books">The Book Club</a></span>
            <div class="d-flex justify-content-end p-2">
                <span class="material-symbols-outlined">account_circle</span>
                <strong class="text-primary-emphasis">${user.name}</strong>&nbsp;&nbsp;&nbsp;
                <a href="/logout"> Logout</a>
            </div>
        </div>
    </nav>

    <div class="container bg-gray p-3">
        <h1 class="my-3 text-primary-emphasis display-3">Welcome, ${user.name}</h1>
        <div class="d-flex justify-content-between p-3">
            <h4>Books from everyone's shelves</h4>
            <a href="/books/new">+ Add a book to the shelf</a>
        
        </div>
        <div class="row p-2">
            <c:if test="${notAuthorized!=null}" >
                <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Oups!</h4>
                    <p>${notAuthorized}</p>            
            </c:if>        
        </div>
        <div class="row">
       
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Title</th>
                        <th scope="col">Author</th>
                        <th scope="col">Posted By</th>
                    </tr>
                </thead>
                <tbody class="table-hover">
                    <c:forEach var="book" items="${books}" >
                        <tr>
                            <td>${book.id}</td>
                            <td><a href="/books/${book.id}">${book.title} </a>   </td>
                            <td>${book.author}</td>
                            <td>${book.reviewer.name}</td>
                        </tr>
                    </c:forEach >                    
                </tbody>
            </table>     
       
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>