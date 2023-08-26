<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.Category,models.SubCategory,models.User,models.Blog" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/css/mystyle.css" type="text/css"/>
    
    <script src="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone-min.js"></script>
    <link href="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <c:import url="header.jsp" />
    <c:import url="header2.jsp" />
    
    <div class=" mt-4 container-fluid">
        <div class="row">
            <div class="col" id="hv">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach var="blog" items="${subBlogs}">
                    <div class="card md-4 mb-3 d-inline-block" style="max-width: 700px; border: 1px solid black;">
                        <div class="card" style="width: 21rem;">
                            <img src="download_image.do?blog_id=${blog.blogId}&count=1" class="card-img-top" style="height: 200px; border: solid 1px black; margin: 3px3px" >
                            <div class="card-body" style="height: 230px">
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
    <br>
    
    <c:import url="footer.jsp" />

    <script>
        function func2(blogId) {
            window.location.href = "blog_info.do?blogId="+blogId;
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>