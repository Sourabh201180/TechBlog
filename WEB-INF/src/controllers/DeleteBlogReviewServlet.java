package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Blog;
import models.BlogImage;
import models.Review;
import models.User;

@WebServlet("/delete_blog_review.do")
public class DeleteBlogReviewServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        String nextPage = "index.jsp";
        
        if(user != null) {
            Integer count = Integer.parseInt(request.getParameter("count"));

            if(count == 1) {    // blog
                Integer blogId = Integer.parseInt(request.getParameter("blog_id"));
                Review.deleteBlogReviews(blogId);
                BlogImage.deleteBlogImages(blogId);
                Blog.deleteBlog(blogId);
                nextPage = "user_blogs.jsp";
            } else if(count == 2) {     // review
                Integer reviewId = Integer.parseInt(request.getParameter("review_id"));
                Review.deleteReview(reviewId);
                nextPage = "user_reviews.jsp";
            }
        } else {

        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}