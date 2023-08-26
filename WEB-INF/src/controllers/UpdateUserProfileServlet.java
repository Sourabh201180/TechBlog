package controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

@WebServlet("/update_user_profile.do")
public class UpdateUserProfileServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        
        boolean flag = false;

        if(user != null) {
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String contact = request.getParameter("user_contact");
            String about = request.getParameter("user_about");
            Integer userId = Integer.parseInt(request.getParameter("user_id"));
                
            User user1 = new User(userId, name, contact, email, about);
                
            User user2 = User.getUserInfo(user1.updateUser());
            session.setAttribute("user", user2);
                
            flag = true;
        }

        response.getWriter().print(flag);
    }
}