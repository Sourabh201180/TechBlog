package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import models.Blog;

@WebServlet("/show_user_blogs_cards.do")
public class ShowUserBlogsCardsServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException , ServletException{
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        String nextPage = "index.jsp";

        Integer uId  =  Integer.parseInt(request.getParameter("uId"));

        if(user != null) {
            ArrayList<Blog> blogs = Blog.collectAllUserBlogs(uId);
            
            request.setAttribute("blogs", blogs);

            nextPage = "user_blogs.jsp";

        } else{

        }
        
        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}