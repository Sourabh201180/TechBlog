<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.User" %>

<link rel="stylesheet" href="static/css/mystyle.css" type="text/css"/>
    
<style>
  #search_list {
    position: absolute;
    /* top: 68px; */
    left: 0px;
    z-index: 8;
    border: 2px solid #999;
    background-color: white; 
  }

  #search_box {
    position: relative;
  }

  .search_rec {
    font-size: 18px;
    font-weight: bold;
    font-family: verdana;
    padding: 6px 12px;
    cursor: pointer; 
    width: 600px;
  }

  .search_rec:hover {
    background-color: #eee;
  }
</style>

<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<!-- Signin Modal -->
<div class="modal fade" id="modal_signin">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title"><span class="fa fa-user-plus fa-1x"></span> Sign-In</h3>
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

<!-- SignUp1 Modal -->
<div class="modal fade mb-5" id="modal_signup">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title"><span class="fa fa-1x fa-user-circle"></span> Sign-up </h3>
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                  <form action="signup_step1.do" method="post">
                    <div class="form-group">
                      <label for="na">User Name <span class="text-danger">*</span></label>
                      <input type="text" name="name" id="na" class="form-control" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <label for="em">Email <span class="text-danger">*</span></label>
                        <input type="email" class="form-control" id="em" name="email" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="pa">Password <span class="text-danger">*</span></label>
                        <input type="password" class="form-control" id="pa" name="password" placeholder="Enter password">
                    </div>
                    <div class="form-group">
                        <label for="co">Contact <span class="text-danger">*</span></label>
                        <input type="text" maxlength="10" class="form-control" id="co" name="contact" placeholder="Enter mobile no.">
                    </div>
                    
                    <div class="g-recaptcha" data-sitekey="6LfMz3siAAAAAH1SBljQCFek_XiWiW0_DXDo8INU"></div>

                    <br>

                    <div class="form-group text-center d-block" id="svUser">
                      <button type="submit" class="btn btn-info btn-sm mr-2">Save & Next</button>
                    </div>
                  </form>
                  <button class="btn btn-info btn-sm" id="signin_btn">Sign-In</button>
            </div>
        </div>
    </div>
</div>

<!-- Profile Update Modal -->
<div class="modal fade mb-5" id="profile_update_modal">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
              <h3 class="modal-title"><span class="fa fa-1x fa-user-circle"></span> Update Profile</h3>
              <button class="close" data-dismiss="modal">
                  <span>&times;</span>
              </button>
          </div>
          <div class="modal-body">
              <!-- Buyer/Seller user name -->
              <div class="form-group">
                  <label for="na">User Name <span class="text-danger">*</span></label>
                  <input type="text" name="name" id="u_na" class="form-control" placeholder="Enter name">
              </div>
              <!-- email -->
              <div class="form-group">
                  <label for="u_em">Email <span class="text-danger">*</span></label>
                  <input type="email" class="form-control" id="u_em" name="email" placeholder="Enter email">
              </div>
              <!-- contact -->
              <div class="form-group">
                <label for="u_co">Contact <span class="text-danger">*</span></label>
                <input type="text" maxlength="10" class="form-control" id="u_co" name="contact" placeholder="Enter mobile no.">
              </div>
              <!-- about -->
              <div class="form-group">
                  <label for="u_abo">About <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="u_abo" name="about" placeholder="Enter About Yourself">
              </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn-sm btn-secondary" data-dismiss="modal">Close</button>&nbsp;
            <button class="btn btn-primary" id="update_profile_btn">Update</button>
          </div>
      </div>
  </div>
</div>

<!-- starting of profile modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel"> Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="contatiner text-center">
          <!-- <img src="static/images/default.png" class="img-fluid" style="border-radius: 50%; max-width: 150px;"></img> -->
          <img src="download_image.do?user_id=${user.userId}&count=3" class="img-fluid" style="border-radius: 50%; max-width: 150px;"></img>
          <br>
          <h5 class="modal-title mt-3" id="exampleModalLabel"> ${user.name} </h5>

          <!-- details -->
          <table class="table">
            <tbody>
              <tr>
                <th scope="row">Contact: </th>
                <td> ${user.contact} </td>
              </tr>
              <tr>
                <th scope="row">Email: </th>
                <td> ${user.email} </td>
              </tr>
              <tr>
                <th scope="row">About: </th>
                <td> ${user.about}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn-sm btn-secondary" data-dismiss="modal">Close</button>&nbsp;
        <button type="button" class="btn-sm btn-primary" onclick="funcUpdateUserProfile('${user.userId}')">Edit</button>
      </div>
    </div>
  </div>
</div>
<!-- ending of profile modal -->

<!-- header -->
<nav class="container-fluid navbar navbar-expand-lg navbar-dark primary-background">
    <a href="index.jsp" class="navbar-brand" style="font-weight: bolder; font-style: oblique; font-size: x-large;">
        <img src="static/images/techblog.png" height="35" width="70px" alt="logo" class="mr-1">
        TechBlog
    </a>

    <button class="navbar-toggler" data-toggle="collapse" data-target="#header_options">
        <span class="navbar-toggler-icon"></span>                                           <!-- This is for showing more options in a mobile view -->
    </button>

    <div class="collapse navbar-collapse" id="header_options">
      <ul class="navbar-nav">
          <li class="nav-item active ml-5">
            <div id="search_box">
              <input type="search" class="form-control text-center" id="search" style="width: 600px;" placeholder="Search for Blog" aria-label="Search">
              <div id="search_list" class="d-none"></div>
            </div>
          </li>
          <li class="nav-item active ml-3">
            <button type="submit" class="btn btn-outline-light" style="position: absolute;" id="search_btn">Search</button>
          </li>
      </ul>
    </div>
    <div class="mr-2">
      <c:choose>
        <c:when test="${user == null}">
          <button class="btn btn-outline-light mr-2" data-toggle="modal" data-target="#modal_signin"><span class="fa fa-user-circle"></span> SignIn</button>
        </c:when>
        <c:otherwise>
          <button onclick="funcUserBlog()" class="btn btn-outline-light">My Blogs</button>
        </c:otherwise>
      </c:choose>
    </div>
</nav>

<script>
    function funcUserBlog() {
      window.location.href = 'user_blogs.do';
    }

    const u_name = document.querySelector('#u_na');
    const u_email = document.querySelector('#u_em');
    const u_contact = document.querySelector('#u_co');
    const u_about = document.querySelector('#u_abo');

    var user_id = null;

    const getUserInfo = async (userId) => {
      let response = await fetch('fetch_user_info.do?uid='+userId);
      let result = await response.json();

      return result;
    };

    function funcUpdateUserProfile(userId) {
      user_id = userId;
      getUserInfo(userId).then((data) => {
        console.log(data);
        $('#profile-modal').modal('hide');
        $('#profile_update_modal').modal('show');

        u_name.setAttribute("value", data.name);
        u_email.setAttribute("value", data.email);
        u_contact.setAttribute("value", data.contact);
        u_about.setAttribute("value", data.about);
      });
    };

    const updateUserProfile = async () => {
      const url = 'update_user_profile.do?user_name='+u_name.value+'&user_email='+u_email.value+'&user_contact='+u_contact.value+'&user_about='+u_about.value+'&user_id='+user_id;
      console.log(url);
      
      let result = await fetch(url);
      let resp = await result.text();
      
      return resp;
    };
    
    var update_profile_btn = document.querySelector('#update_profile_btn');
    update_profile_btn.addEventListener('click', () => {
      updateUserProfile().then((data) => {
        $('#profile_update_modal').modal('hide');
        window.location.reload();
      }).catch((err) => {
          console.log(err);
      });
    });

    const signin_btn = document.querySelector('#signin_btn');
    const signup_btn = document.querySelector('#signup_btn');
      
    signin_btn.addEventListener('click', () => {
      $('#modal_signup').modal('hide');
      $('#modal_signin').modal('show');
    });
      
    signup_btn.addEventListener('click', () => {
      $('#modal_signin').modal('hide');
      $('#modal_signup').modal('show');
    });
</script>