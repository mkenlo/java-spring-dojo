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
        <h1>Send an Omikuji</h1>
        <div class="col-sm-6 border border-secondary border-2 center p-4">
            <form action="/omikuji/submit" method="POST" class="row">

                <div class="mb-3">
                    <label for="input1" class="form-label">Pick any number from 5 to 25</label>
                    <select name="year" class="form-select">
                        <c:forEach var="i" begin="5" end="25">
                            <option value="<c:out value='${i}'/>"><c:out value="${i}"/></option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="input2" class="form-label">Enter the name of any city</label>
                    <input type="text" class="form-control" id="input2" name="city">
                </div>
                <div class="mb-3">
                    <label for="input3" class="form-label">Enter the name of any real person</label>
                    <input type="text" class="form-control" id="input3" name="person">
                </div>
                <div class="mb-3">
                    <label for="input4" class="form-label">Enter professional endeavor or hobby</label>
                    <input type="text" class="form-control" id="input4" name="hobby">
                </div>
                <div class="mb-3">
                    <label for="input5" class="form-label">Enter any type of living thing</label>
                    <input type="text" class="form-control" id="input5" name="livingThing">
                </div>
                <div class="mb-3">
                    <label for="input6" class="form-label">Say something nice to someone</label>
                    <textarea class="form-control" id="input6" rows="3" name="niceMessage"></textarea>
                </div>


                <div class="mb-3 text-end">
                    <label for="submit" class="form-label"><em>Send and show a friend</em></label>
                    <input type="submit" class="btn btn-primary" name="Send" id="submit">
                </div>

            </form>

        </div>
    </div>
   
</body>
</html>