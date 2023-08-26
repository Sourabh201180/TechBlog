<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="mystyle.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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

    <div class="modal fade" id="verify_su_otp_modal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title col-sm-11 text-info " id="ModalLabel">First Step Of User Registration Is Completed.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col justify-content-center ">
                            <div class="alert alert-success w-95 " id="mobile_otp_block">
                                <h3 class="mb-5">
                                    An OTP is send to your register mobile number....
                                </h3>
                                <div>
                                    <span class="font-weight-bold mr-2 ">Enter Your OTP:</span>
                                    <input type="text" class="form-control mt-2" id="otp" placeholder="Enter your OTP here">
                                    <br>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" id="otp_btn" class="btn btn-success m-auto "value="Verify your Mobile">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="verify_su_email_modal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        Please Check Your Email Inbox ....
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col justify-content-center ">
                            <div class="alert alert-success w-95 " id="email_otp_block">
                                <h3 class="mb-5">An Verification Mail Is Send To Your Register Email Address</h3>
                                <h4><a class="btn btn-primary" href="http://www.gmail.com">Gmail</a></h4>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                            </div>
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
        const verify_su_otp_modal = document.querySelector('#verify_su_otp_modal');
        const otp_btn = document.querySelector('#otp_btn');
        const otp = document.querySelector('#otp');
        const email_otp_block = document.querySelector('#email_otp_block');

        const checkOTP = async () => {
            let result = await fetch('verify_otp.do?otp='+otp.value);
            return result.text();
        };

        otp_btn.addEventListener('click', () => {
            checkOTP().then((data) => {
                if(data == 'true') {
                    mobile_otp_block.classList.add('d-none');
                    email_otp_block.classList.replace('d-none', 'd-block');
                }
            }).catch((err) => {
                console.log(err);
            });
        });

        otp_btn.addEventListener('click' , ()=>{
            $('#verify_su_otp_modal').modal('hide')
            $('#verify_su_email_modal').modal('show')
        });

        $(window).on('load', function () {
            $('#verify_su_otp_modal').modal('show');
        });
    </script>
</body>
</html>