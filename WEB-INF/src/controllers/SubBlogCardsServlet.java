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

@WebServlet("/sub_blog_cards.do")
public class SubBlogCardsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {
        HttpSession session = request.getSession();
        
        Integer scId = Integer.parseInt(request.getParameter("scId"));

        ArrayList<Blog> subBlogs = Blog.CollectAllSubsequentBlog(scId);
        session.setAttribute("subBlogs", subBlogs);
        
        request.getRequestDispatcher("sub_blog_cards.jsp").forward(request, response);
    }  
}