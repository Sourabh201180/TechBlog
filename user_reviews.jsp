<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.Category, models.User, models.Blog, models.Review" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone-min.js"></script>
    <link href="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone.css" rel="stylesheet" type="text/css" />
<!-- 
    <style>
        .card {
            left: 100px;
        }
    </style> -->
</head>
<body>
    <c:import url="header.jsp" />
    <c:import url="header2.jsp" />

    <div class="container-fluid">
        <c:import url="menu.jsp" />
        <nav class="mt-4">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="user_dashboard.jsp">Dashboard</a>
                </li>
                <li class="breadcrumb-item active" id="showP">Reviews</li>
            </ol>
        </nav>
    </div>
    
    <!-- collect all reviews -->
    <div class="container">
        <div class="card-header">Comments</div>
        <c:forEach var="arv" items="${reviews}">
            <div class="card" style="width: 1000px;">
                <div class="card-body">
                    <div class="col-2"></div>
                    <div class="col-4">
                        <img src="static/images/techblog.png" height="40px">${arv.user.name}
                        <div class="stars ml-5" >
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <blockquote class="blockquote mb-0">
                            <p>${arv.review}</p>
                        </blockquote>
                    </div>
                    <div class="col-4">
                        <blockquote class="blockquote mb-0">
                            <p>${arv.blog.blogId}</p>
                        </blockquote>
                    </div>
                    <div class="col-2"></div>
                </div>
            </div>
        </c:forEach>
    </div>

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    
    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

    <script>

    </script>
</body>
</html>