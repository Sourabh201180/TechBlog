<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.User, models.Blog" %>

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
        .banner-background{
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

        .card{
            border-radius: .5rem;
            overflow: hidden;
            box-shadow: 0 1rem 2rem rgba(0,0,0,.1);
        }
    </style>
</head>
<body>
    <c:import url="header.jsp" />
    <c:import url="header2.jsp" />

    
    <div class="container-fluid">
        <c:import url="menu.jsp" />
        <!-- banner -->
        <div class="container-fluid px-1">
            <div class="jumbotron primary-background2 text-black banner-background">
                <div class="container">
                    <h3 class="display-3 text-center" style="font-style: italic;"><b> Thankyou for working with us!</b></h3>
                    <div style="font-size: large;">
                        <p>A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output.[citation needed] Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.</p>
                        <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-5 container-fluid">
            <div class="row ">
                <div class="col" id="hv">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <c:forEach var="blog" items="${blogs}">
                        <div class="card md-4 mb-3 text-center d-inline-block" style="max-width: 600px;">
                            <div class="card" style="width: 20rem;">
                                <img src="download_image.do?blog_id=${blog.blogId}&count=1" class="card-img-top" style="height: 200px;">
                                <div class="card-body" style="height: 250px">
                                    <h5 class="card-title" style="text-decoration:underline;" onclick="func3('${blog.blogId}')">${blog.name}</h5>
                                    <hr>

                                    <hr>
                                    <div class="text-center pb-2 mb-2">
                                        <a href="#" class="btn btn-primary btn-sm">Like</a>
                                        &nbsp;
                                        <a href="#"class="btn btn-primary btn-sm">Comment</a>&nbsp;&nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:forEach>
                </div>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
            
           
    </div>
    
    <%@ include file="footer.jsp" %>

    <script>
        function func3(blogId) {
            window.location.href = "blog_info.do?blogId="+blogId;
        }
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>