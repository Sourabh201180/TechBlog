package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

@WebServlet("/signup_step2.do")
public class SignupStepTwoServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        boolean flag = false;
        if(user != null) {
            String about = request.getParameter("about");

            user.setAbout(about);
            
            user.saveUser();

            flag = true;
        } 

        response.getWriter().print(flag);
    }
}