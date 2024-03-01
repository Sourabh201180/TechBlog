package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.ArrayList;
import javax.servlet.annotation.*;

import models.User;
import models.Blog;
import models.Review;

@WebServlet("/review.do")
public class ReviewServlet extends HttpServlet {
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        String nextPage = "index.jsp";
        
        if(user != null) {
            Integer count = Integer.parseInt(request.getParameter("count"));
            String description = request.getParameter("description");
            
            Integer blogId = Integer.parseInt(request.getParameter("blogId"));
            
            Review review = new Review();
            
            if(count == 1) {    // save
                review.addReview(user.getUserId(), blogId, description);
                nextPage = "blog_info.do?blogId="+blogId;
            } else if(count == 2) {   // update
                Integer reviewId = Integer.parseInt(request.getParameter("review_id"));
                review.setReview(description);
                review.updateReview(reviewId);
                nextPage = "user_reviews.do";
            }
            
            // session.setAttribute("review", review);
            // session.setAttribute("blog_id", blogId);

        } else {

        }

        response.sendRedirect(nextPage);
    }
}