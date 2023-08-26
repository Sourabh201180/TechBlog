package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

@WebServlet("/signin.do")
public class SigninServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(email, password);

        String nextPage = "index.jsp";

        int result = user.login();

        switch(result) {
            case 1:
                nextPage = "user_dashboard.jsp";
                session.setAttribute("user", user);
                break;
            case 2: 
                nextPage = "index.jsp";
                session.invalidate();
                break;
            default:
        }
            
        // request.getRequestDispatcher("collect_all_blogs.do").forward(request, response);
        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}