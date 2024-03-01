<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="static/css/mystyle.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .banner-background {
            clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 96%, 86% 89%, 69% 95%, 31% 91%, 0 100%, 0% 35%, 0 0);       
        }

        #err {
            color: red;
            text-align: center;
            background-color: rgb(244, 234, 234);
            width: 50%;
            margin: 10px auto;
            border: 1px solid red;
            border-radius: 5px;
            font-family: verdana;
            padding-top: 5px; 
            padding-bottom: 5px; 
        }

        small {
            font-size: .7em;
            color: red;
        }

        .carousel .carousel-item {
            max-height:560px;
        }

        .card {
            border-radius: .5rem;
            overflow: hidden;
            box-shadow: 0 1rem 2rem rgba(0,0,0,.1);
        }
    </style>
</head>
<body>
    <c:import url="header.jsp" />
    <c:import url="header2.jsp" />

    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner container-fluid mt-2 banner-background" style="text-align: center; height: 500px;">
            <div class="carousel-item active">
              <img class="d-block w-100" src="static/images/carousel/Importance-of-Blogging-for-Your-Business-scaled.jpeg.jpg" alt="Third slide">
            </div>
          <div class="carousel-item">
            <img  src="static/images/carousel/Promote-a-blogging-site.jpg" alt="First slide" class="d-block w-100 ">
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="static/images/carousel/Depositphotos_199997370_m-2015.webp" alt="Third slide">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
    </div>

    <br>
    <br>

    <!-- cards -->
    <div class="container">
        <div class="row mb-2">
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top" style="height: 170px;" src="static/images/cards/java.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Java Programming</h5>
                      <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.</p>
                      <a href="sub_blog_cards.do?scId=1" class="btn primary-background text-white">Read more...</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top" style="height: 170px;" src="static/images/cards/C++.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">C/C++ Programming</h5>
                      <p class="card-text">A successor to the programming language B, C was developed at Bell Labs by Dennis Ritchie between 1972-1973. It was applied to the kernel of the Unix OS.</p>
                      <a href="#" class="btn primary-background text-white">Read more...</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top" style="height: 170px;" src="static/images/cards/kotlin.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Python Programming</h5>
                      <p class="card-text">Python is dynamically-typed & garbage-collected. It supports structured(particularly procedural), Object-Oreinted and functional programming.</p>
                      <a href="sub_blog_cards.do?scId=11" class="btn primary-background text-white">Read more...</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top" style="height: 170px;" src="static/images/cards/mysql.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Ruby Programming</h5>
                      <p class="card-text">Ruby is an interpreted, high-level, general-purpose programming language. It was designed with an emphasis on programming productivity and simplicity.</p>
                      <a href="#" class="btn primary-background text-white">Read more...</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top" style="height: 170px;" src="static/images/cards/javascript.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">JavaScript Programming</h5>
                      <p class="card-text">JavaScript is a high-level, JIT compiled language that conforms to the ECMAScript standard. It has dynamic typing, prototype-based object-orientation & first-class functions.</p>
                      <a href="sub_blog_cards.do?scId=4" class="btn primary-background text-white">Read more...</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top" style="height: 170px;" src="static/images/cards/html.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">DBMS Programming</h5>
                      <p class="card-text">Database is an organized collection of data stored and accessed electronically. Small databases can be stored on a file system, while large databases are hosted on computer clusters or cloud storage.</p>
                      <a href="#" class="btn primary-background text-white">Read more...</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br>
    
    <c:choose>
        <c:when test="${blogs != null}">
            <div class="mt-4 container-fluid">
                <hr>
                <h4 style="text-align: center;">Blogs</h4>
                <hr>
                <div class="row">
                    <div class="col" id="hv">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <c:forEach var="blog" items="${blogs}">
                            <div class="card md-4 mb-3 d-inline-block" style="max-width: 700px; border: 1px solid black;">
                                <div class="card" style="width: 21rem;">
                                    <img src="download_image.do?blog_id=${blog.blogId}&count=1" onclick="func2('${blog.blogId}')" class="card-img-top" style="height: 200px; border: solid 1px black; margin: 3px3px" >
                                    <div class="card-body" style="height: 230px">
                                        <h5 class="card-title text-center" style="text-decoration:underline;" onclick="func2('${blog.blogId}')">${blog.name}</h5>
                                        <hr>
                                        <h6 class="card-title">${blog.smallDesc}</h6>
                                        <div class="text-left">
                                            <a href="#" onclick="func2('${blog.blogId}')" class="btn primary-background text-white">read more...</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <!-- write now No blogs are available!!! -->
        </c:otherwise>
    </c:choose>

    <br>
    
    <c:import url="footer.jsp" />
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

    <script>
        function func2(blogId) {
            window.location.href = "blog_info.do?blogId="+blogId;
        }

        // function collectAllBlogs() {
        //     window.location.href = "collect_all_blogs.do?type=0";
        // }
    </script>
</body>
</html>