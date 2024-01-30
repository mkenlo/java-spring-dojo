<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Book Detail</title>
        <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css"/>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>
    <div class="container">
       <div class="row">

       <h1>List of Books</h1>
       
        <table class="table table-success table-hover">
            <thead>
                <tr>
                <th scope="col">#</th>
                <th scope="col">Title</th>
                <th scope="col">Language</th>
                <th scope="col"># Pages</th>
                </tr>
            </thead>
            <tbody class="table-striped">
                <c:forEach var="book" items="${books}" >
                    <tr>
                        <td><c:out value="${book.id}" /></td>
                        <td>
                            <a href="/books/<c:out value='${book.id}'/>">
                                <c:out value="${book.title}" />
                            </a>
                        </td>
                        <td><c:out value="${book.language}" /></td>
                        <td><c:out value="${book.numberOfPages}" /></td>
                    </tr>
                </c:forEach >
                
            </tbody>
        </table>
       
       
       </div>
    
    
    </div>
</body>
</html>