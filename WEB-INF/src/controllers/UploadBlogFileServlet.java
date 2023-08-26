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
import models.Blog;
import models.BlogImage;

@WebServlet("/upload_blog_file.do")
public class UploadBlogFileServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        Blog blg = (Blog)session.getAttribute("blg");

        String blogId = Integer.toString(blg.getBlogId());

        if(user != null) {
            Integer count = Integer.parseInt(request.getParameter("count"));
            if(count == 1) {
                // single pic ko upload krne ke liye
                String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users/"+user.getEmail()+"/blogs/"+blogId);
                System.out.println(uploadPath);

                String fileName = FileUpload.uploadFile(request, uploadPath);

                String pathToSave = user.getEmail()+"/blogs/"+blogId+"/"+fileName;

                BlogImage.addBlogMainImage(pathToSave, Integer.parseInt(blogId));
                
                System.out.println("Main Pic Uploaded Successfully");
            } else {
                // multiple pics ko upload krne ke liye
                String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users/"+user.getEmail()+"/blogs/"+blogId+"/pics/");
                System.out.println(uploadPath);

                String fileNames = FileUpload.uploadFile(request, uploadPath);

                String pathToSave = user.getEmail()+"/blogs/"+blogId+"/pics";

                BlogImage.addBlogMultipleImages(fileNames, pathToSave, Integer.parseInt(blogId));
                
                System.out.println("Multiple Pic Uploaded Successfully");
            }
        }
    }
}