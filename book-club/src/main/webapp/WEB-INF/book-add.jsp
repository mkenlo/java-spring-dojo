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
            

            <nav class="nav">
                
            </nav>

            <div class="nav d-flex justify-content-end p-2">
                
                <span class="material-symbols-outlined">account_circle</span>
                <strong class="text-primary-emphasis">${user.name}</strong>&nbsp;&nbsp;&nbsp;
                <a href="/logout"> Logout</a>
            </div>
        </div>
    </nav>

    <div class="container bg-gray p-3">
        
        <div class="d-flex justify-content-between py-2  mb-3">
            <h4 class="text-primary-emphasis">Add a book review</h4>
            <a href="/books">Back to Shelf</a>
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-12">
        
                <form:form action="/books/new" method="POST" modelAttribute="newBook">
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="book-title" name="title">
                            <label for="book-title">Title</label>
                        </div>
                        <form:errors path="title" class="errors" />
                    </div>
                    
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="book-author" name="author">
                            <label for="book-author">Author</label>
                        </div>
                        <form:errors path="author" class="errors" />
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <textarea id="review" name="review" class="form-control" style="height:150px"></textarea>
                            <label for="review" >Your thoughts</label>
                        </div>
                        <form:errors path="review" class="errors" />
                    </div>
                    <div>
                        <input type="hidden" value="${userId}" name="reviewer">
                        <input type="submit" class="form-control btn btn-outline-primary" value="Add">
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