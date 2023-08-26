package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Blog;
import models.Review;

@WebServlet("/blog_info.do")
public class BlogInfoServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        Integer blogId = Integer.parseInt(request.getParameter("blogId"));

        Blog blog = Blog.getBlogInfo(blogId);
        
        String nextPage = "index.jsp";
            
        // product ki info to sbko dikhegi, whether he/she is logged in or not
        session.setAttribute("blog", blog);
        nextPage = "blog_info.jsp";

        ArrayList<Review> allReviews = Review.collectAllBlogReviews(blogId);
        session.setAttribute("allReviews", allReviews);

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}