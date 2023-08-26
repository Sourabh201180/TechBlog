package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.Blog;
import models.User;

@WebServlet("/edit_blog.do")
public class EditBlogServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        if(user != null) {
            Integer blogId = Integer.parseInt(request.getParameter("bid"));
            Blog uBlog = Blog.getBlogInfo(blogId);

            Gson gson = new Gson();

            String resp = gson.toJson(uBlog);

            response.getWriter().write(resp);
        } else{
            response.getWriter().print("[\"expired\"]");
        }
    }
}