package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import utils.SMSSender;
import utils.SMSTemplates;
import utils.Utility;

import java.io.*;

import models.User;

@WebServlet("/signup_step1.do") 
public class SignupStepOneServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        System.out.println(1);
        String gResponse = request.getParameter("g-recaptcha-response");
        System.out.println(2);
        
        if(Utility.isHuman(gResponse)) {
            System.out.println(3);
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contact = request.getParameter("contact");

            // generating the otp, which will be send through phone number
            String otp = Utility.generateOTP();
            System.out.println(otp);

            User user = new User(name, email, password, contact, otp);

            session.setAttribute("user", user);
            
            // creating folder with email
            String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users");  
            String fName = "blogs";
            
            // creating folder with their email
            File file = new File(uploadPath, email);
            file.mkdir(); 

            // creating folder blogs
            File file1 = new File(uploadPath, email+"/"+fName);
            file1.mkdir();
            
            // getting otp on phone number
            String smsMessage = SMSTemplates.getSignupMobileVerificationMessage(name, otp);
            // SMSSender.sendSMS(contact, smsMessage);
        }
        
        response.sendRedirect("signup_step2.jsp");
    }
}