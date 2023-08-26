package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import utils.FileUpload;

@WebServlet("/user_pic_upload.do")
public class UserPicUploadServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        
        if(user != null) {
            String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users/"+user.getEmail());

            String fileName = FileUpload.uploadFile(request, uploadPath);
            String pathToSave = user.getEmail()+"/"+fileName;

            user.setPic(pathToSave);

            System.out.println("Profile Pic Uploaded Successfully");
        }
    }
}