<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ninja Gold Games</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>

<body>
    <div class="container">
        <h1>Ninja Gold Game</h1>

        <div class="row mb-5">
            <div class="col-md-3">
                <label class="form-label"><strong>Your Gold: </strong> </label>
                <input type="text" name="currentGold" value="<c:out value='${user.totalGold}'/>" class="btn btn-outline-primary">

            </div>
        </div>

        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header"> Farm </div>
                    <div class="card-body">
                        <form action="/find" method="POST">
                            <input type="hidden" name="name" value="farm">
                            <input type="hidden" name="minGold" value="10">
                            <input type="hidden" name="maxGold" value="20">
                            <label class="form-label">Earns 10-20 gold</label>
                            <input type="submit" class="btn btn-warning" value="Find Gold">

                        </form>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-header">Cave</div>
                    <div class="card-body">
                        <form action="/find" method="POST">
                            <input type="hidden" name="name" value="cave">
                            <input type="hidden" name="minGold" value="5">
                            <input type="hidden" name="maxGold" value="10">
                            <label class="form-label">Earns 5-10 gold</label>
                            <input type="submit" class="btn btn-warning" value="Find Gold">
                        </form>
                    </div>

                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-header">House</div>
                    <div class="card-body">
                        <form action="/find" method="POST">
                            <input type="hidden" name="name" value="house">
                            <input type="hidden" name="minGold" value="2">
                            <input type="hidden" name="maxGold" value="5">
                            <label class="form-label">Earns 2-5 gold</label>
                            <input type="submit" class="btn btn-warning" value="Find Gold">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-header">Quest</div>
                    <div class="card-body">
                        <form action="/find" method="POST">
                            <input type="hidden" name="name" value="quest">
                            <input type="hidden" name="minGold" value="0">
                            <input type="hidden" name="maxGold" value="50">
                            <label class="form-label">Earns/takes 0-50 gold</label>
                            <input type="submit" class="btn btn-warning" value="Find Gold">
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <div class="row mt-5">
            <h2>Activities</h2>
            <div class="border">
                <ul class="list-group list-group-flush list-group-numbered">

                    <c:forEach var="activity" items="${user.activities}">

                        <li class="list-group-item <c:if test='${activity.isCompleted}'> text-success</c:if> <c:if test='${!activity.isCompleted}'> text-danger</c:if>">
                            <c:out value="${activity.summary}" />                        
                        </li>                  
                    
                    </c:forEach>
                    
                </ul>
            </div>
        </div>

    </div>

    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>