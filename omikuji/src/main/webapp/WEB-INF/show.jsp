<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Fruit Store Dashboard</title>   
        <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />  
    <link rel="stylesheet" href="/css/style.css"/>    
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>

      <div class="container">
        
            <h1>Here's Your Omikuji</h1>
            <div class="row p-4">
                <c:if test="${words!=null}">
                
                    <div class="alert alert-primary border-2" role="alert">
                        <p>In ${words.year} years, you will live in ${words.city} 
                            with ${words.person} as your roommate, selling ${words.hobby} for a living.
                            The next time you see a ${words.livingThing}, you will have good luck.
                            Also, ${words.niceMessage}
                        </p>

                    </div>
                </c:if>
                <c:if test="${words==null}">
                    <div class="alert alert-danger" role="alert"> <p>Sorry, nothing to show </p></div>
                </c:if> 
            <a href="/omikuji">Go back</a>

        </div>
    </div>
   
</body>
</html>