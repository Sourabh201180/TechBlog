<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Document</title>

    <!-- 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
    -->

    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/css/mystyle.css" type="text/css"/>

    <style>
      /* 
      .stars{
        color: orange;
      }
        #h{
            border: 2px solid black;
            margin-left: 20px;
            margin-right: auto;
            display: block;
            width: 45%;
        }
        #gt{
          font-size: 5rem;
        }
        p{
          font-family: 'Open Sans', sans-serif;
          margin-left: 20px;
        }

        .carousel .carousel-item {
          max-height:560px;
        }

        body {
          color: #000;
          overflow-x: hidden;
          height: 100%;
          background-image: linear-gradient(180deg, #fff);
          background-repeat: no-repeat;
        }

        .card {
            box-shadow: 0px 4px 8px 0px #BDBDBD;
        }

        .profile-pic {
            width: 100px !important;
            height: 100px;
            box-shadow: 0px 4px 8px 0px #BDBDBD;
        }

        .owl-carousel .owl-nav button.owl-next, .owl-carousel .owl-nav button.owl-prev {
            background: 0 0;
            color: #1E88E5 !important;
            border: none;
            padding: 5px 20px !important;
            font: inherit;
            font-size: 50px !important;
        }

        .owl-carousel .owl-nav button.owl-next:hover, .owl-carousel .owl-nav button.owl-prev:hover {
            color: #0D47A1 !important;
            background-color: transparent !important;
        }

        .owl-dots {
            display: none; 
        }

        button:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            outline-width: 0;
        }

        .item {
            display: none;
        }

        .next {
            display: block !important;
            position: relative;
            transform: scale(0.8);
            transition-duration: 0.3s;
            opacity: 0.6;
        }

        .prev {
            display: block !important;
            position: relative;
            transform: scale(0.8);
            transition-duration: 0.3s;
            opacity: 0.6;
        }

        .item.show {
            display: block;
            transition-duration: 0.4s;
        }

        @media screen and (max-width: 999px) {
            .next, .prev {
                transform: scale(1);
                opacity: 1;
            }

            .item {
                display: block !important;
            }
        } 
        */
  
        #golu {
            font-size: 2.5rem;
            font-weight: revert;
            line-height: 1.2;
        }

        .banner-background{
            clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 96%, 86% 89%, 69% 95%, 31% 91%, 0 100%, 0% 35%, 0 0);       
        }
    </style>
</head>
<body>
    <c:import url="header.jsp" />

    <c:choose>
        <c:when test="${user eq null}">
            <c:import url="header2.jsp" />
            <nav class="mt-2">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="index.jsp">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="collect_all_blogs.do?type=0">blogs</a>
                    </li>
                    <li class="breadcrumb-item active">${blog.name}</li>
                </ol>
            </nav>
        </c:when>
        <c:otherwise>                                     
            <div class="container-fluid">     <!-- if buyer = 2  ye value nhi aarhi, issiliye otherwise wali condition chl rhi h hr baar-->  
                <c:import url="menu.jsp" />                
                <nav class="mt-4">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="user_dashboard.jsp">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="user_blogs.do">blogs</a>
                        </li>
                        <li class="breadcrumb-item active" id="showP">${blog.name}</li>
                    </ol>
                </nav>
            </div>
        </c:otherwise>
    </c:choose>

    <input type="hidden" id="blog_id_" value="${blog.blogId}">

    <div class="container-fluid pt-0 px-1">
        <div class="primary-background2 text-black banner-background">
            <div class="container">
                <h5 class="display-3 text-center" id="golu">${blog.name}</h5>
                <br>
                <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner container" id="bholu">
                        <c:forEach var="blogImage" items="${blogImages}" varStatus="a">
                            <c:choose>
                                <c:when test="${a.count==1}">
                                    <div class="carousel-item active">
                                        <img src="download_image.do?image_path=${blogImage}&count=2" class="d-block w-100 ml-5" style="height: 500px;" alt="blogPhotu">
                                    </div>
                                    <div class="carousel-caption d-none d-md-block">
                                      <h5>First slide label</h5>
                                      <p>Some representative placeholder content for the first slide.</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="carousel-item">
                                        <img src="download_image.do?image_path=${blogImage}&count=2" class="d-block w-100 ml-5" style="height: 500px;" alt="blogPhotu">
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </button>
                    </div>
                </div>
                <br>
                <br>
                <div style="font-style:oblique; font-size: x-large; font-weight: 1000;">
                    <p class="text-center container">${blog.smallDesc}</p>
                </div>
                <div style="font-size: larger; font-weight: 500;">
                    <p class="text-center">${blog.longDesc}</p>
                </div>
                <br> 
                <div class="card-columns" id="all_images_box"></div>
                <br>
                <br>
                <br>
                <br>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- collect all reviews -->
        <div>
            <form action="review.do?blogId=${blog.blogId}" method="post">
                <div class="bg-light p-2">
                    <input type="hidden" id="blogId" name="blogId" value="8">
                    <div class="d-flex flex-row align-items-start"><img class="rounded-circle" src="static/images/review.jpg" width="40">
                        <textarea class="form-control ml-1 shadow-none textarea" cols="10" rows="5" id="description" name="description" placeholder="Add a comment.."></textarea>
                    </div>
                    <div class="mt-2 text-right">
                        <button class="btn btn-primary btn-sm shadow-none" type="submit" id="post_btn">Post comment</button>
                    </div>
                </div>
            </form>
        </div>
        <!--  -->
        
        <!-- review section starts -->
        <div class="card-header">Comments</div>
        <c:forEach var="arv" items="${allReviews}">
            <div class="card-header"></div>
            <div class="card">
                <div class="card-body">
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
            </div>
        </c:forEach>
        <!--review section ends-->
    </div>

    <br>
    <br>
    
    <%@ include file="footer.jsp" %>

    <script>
        const blog_id_ = document.querySelector('#blog_id_');
        const all_images_box = document.querySelector('#all_images_box');
        
        const fetchBlogpics = async () => {
            let resp = await fetch('fetch_blog_all_images.do?blogId='+blog_id_.value);
            let result = await resp.json();
            
            return result;
        }
        
        const allImageReq = async () => {
            fetchBlogpics().then((data)=> {
                all_images_box.innerHTML = null;
                for(let pic_path of data) {
                    let div = document.createElement('div');
                    div.classList.add('card');
                    all_images_box.append(div);

                    let img = document.createElement('img');
                    img.style='border: 1px solid black'; 
                    img.src = 'download_image.do?image_path='+pic_path+'&count=2';
                    img.classList.add('img-fluid');
                    img.classList.add('card-img-top');
                    div.append(img);
                }
            }).catch((err)=>{
                console.log(err);
            });
        }

        allImageReq();


        const fetchBlogReviews = async () => {
            let resp = await fetch('blog_reviews.do?blogId='+blog_id_.value);
            let result = await resp.json();
            
            return result;
        }
        
        const allBlogReviewReq = async () => {
            fetchBlogReviews().then((data)=> {
                console.log('review collected');
            }).catch((err)=>{
                console.log(err);
            });
        }

        allBlogReviewReq();
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>