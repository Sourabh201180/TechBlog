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
        
        Integer blogId = Integer.parseInt(request.getParameter("blogId"));
        
        if(user != null) {
            Integer userId = user.getUserId();

            
            String description = request.getParameter("description");

            Review review = new Review();

            // review.setUser(new User(userId));
            // review.setBlog(new Blog(blogId));
            // review.setReview(description);

            review.addReview(user.getUserId(), blogId, description);

            session.setAttribute("review", review);
            session.setAttribute("blog_id", blogId);

            response.sendRedirect("blog_info.do?blogId="+blogId);
        } else {
            response.sendRedirect("blog_info.jsp?blogId="+blogId);
        }
    }
}