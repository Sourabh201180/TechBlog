<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <script src="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone-min.js"></script>
    <link href="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone.css" rel="stylesheet" type="text/css" />

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

    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner container-fluid mt-2 banner-background" style="text-align: center; height: 500px;">
            <div class="carousel-item active">
              <img class="d-block w-100" src="static/images/carousel/Importance-of-Blogging-for-Your-Business-scaled.jpeg.jpg" alt="Third slide">
              <div class="container">
                <h3 class="display-3">Welcome to TechBlog</h3>
                <p>A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output.[citation needed] Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.</p>
                <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos.</p>
                
                <a href="register.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start! its free</a>
                <a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle"></span> Login</a>
            </div>
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

    <!-- Signin Modal -->
    <div class="modal fade" id="modal_signin">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Sign-In</h3>
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="signin.do" method="POST">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password">
                        </div>

                        <button type="submit" class="btn btn-primary">SignIn</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="#" class="mr-auto">Forgot Password?</a>
                    <button class="btn btn-info btn-sm" id="signup_btn">Create Account</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Signup Step 2 Modal -->
    <div class="modal fade" id="save_user_profile_modal">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Enter User Details</h3>
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- first modal -->
                    <div class="d-block">
                        <div class="form-group">
                            <label for="about">About</label> 
                            <textarea name="about" id="about" class="form-control" cols="30" rows="5" placeholder="Write something about yourself"></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label for="xyz">Upload Your Pic:<span class="text-danger">*</span></label>
                            <div class="dropzone" id="user_pic_upload"></div>
                            <br>
                            <div class="text-center">
                                <input type="button" value="Upload" id="profile_pic_btn" class="mb-2 btn btn-info btn-sm">
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <button class="btn btn-primary" id="save_btn">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

    <script>
        const about = document.querySelector('#about');
        
        let userPicUpload = new Dropzone('#user_pic_upload', {
            url: 'user_pic_upload.do',
            uploadMultiple: false,
            maxFilesize: .5,
            acceptedFiles: 'image/jpg,image/jpeg,image/png',
            autoProcessQueue: false,
            addRemoveLinks: true
        });
        
        const profile_pic_btn = document.querySelector('#profile_pic_btn');
        profile_pic_btn.addEventListener('click', () => {
            userPicUpload.processQueue();
            console.log('User Profile Pic Uploaded Successfully');
        });
        
        const saveProfile = async () => {
            const url = 'signup_step2.do?about='+about.value;
            console.log(url);
            
            let result = await fetch(url);
            let resp = await result.text();
            
            return resp;
        };
        
        const save_btn = document.querySelector('#save_btn');
        save_btn.addEventListener('click', () => {
            saveProfile().then((data) => {
                $('#save_user_profile_modal').modal('hide');
                $('#modal_signin').modal('show');
            }).catch((err) => {
                console.log(err);
            });
        });

        $(window).on('load', function () {
            $('#save_user_profile_modal').modal('show');
        });
    </script>
</body>
</html>