<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Navbar Menu Bar -->
<div class="row shadow">
  <div class="col py-2">
    <ul class="nav">
        <li class="nav-item">
            <a href="user_dashboard.jsp" class="nav-link active">Dashboard</a>
        </li>
        <li class="nav-item">
            <a href="user_blogs.do" class="nav-link">Blogs</a>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link">Charges</a>
        </li>
        <li class="nav-item">
          <a href="user_reviews.do" class="nav-link">Reviews</a>
        </li>
    </ul>
  </div>   
        <img src="download_image.do?user_id=${user.userId}&count=3" data-toggle="modal" data-target="#profile-modal" style="border-radius: 50%; max-height: 40px;" class="round img-fluid mt-1"></img>
        <h6>
            <a class="nav-link pt-3 pb-2 mr-1" href="#" data-toggle="modal" data-target="#profile-modal">${user.name} </a>
        </h6>
        <h6>
            <a class="nav-link pt-3 pb-2 mr-4" href="signout.do"><span class="fa fa-sign-out"></span> logout </a>
        </h6>
</div>  