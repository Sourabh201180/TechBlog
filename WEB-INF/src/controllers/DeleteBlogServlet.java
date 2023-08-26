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
import models.User;

@WebServlet("/delete_blog.do")
public class DeleteBlogServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        Integer blogId = Integer.parseInt(request.getParameter("blog_id"));

        User user = (User)session.getAttribute("user");
        
        String nextPage = "index.jsp";

        if(user != null) {
            BlogImage.deleteBlogImages(blogId);
            Blog.deleteBlog(blogId);

            nextPage = "user_blogs.jsp";
        } else {

        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}