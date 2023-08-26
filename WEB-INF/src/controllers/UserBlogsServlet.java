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
import models.User;

@WebServlet("/user_blogs.do")
public class UserBlogsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        String nextPage = "index.jsp";

        if(user != null) {
            ArrayList<Blog> blogs = Blog.collectAllUserBlogs(user.getUserId());

            request.setAttribute("blogs", blogs);

            nextPage = "user_blogs.jsp";
        } else {

        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}