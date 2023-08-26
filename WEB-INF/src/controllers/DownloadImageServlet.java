package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.BlogImage;
import models.User;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@WebServlet("/download_image.do")
public class DownloadImageServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("image/png");

        String imagePath = "";
        Integer count = Integer.parseInt(request.getParameter("count"));
        InputStream is = getServletContext().getResourceAsStream("abc");

        if(count == 1) {    // blog main pic
            Integer blogId = Integer.parseInt(request.getParameter("blog_id"));
            
            imagePath = BlogImage.fetchMainBlogImage(blogId);
            is = getServletContext().getResourceAsStream("/WEB-INF/uploads/users/"+imagePath);
        } else if(count == 2){  // blog multiple pics
            imagePath = request.getParameter("image_path");
            is = getServletContext().getResourceAsStream("/WEB-INF/uploads/users/"+imagePath);
        } else if(count == 3){  // profile pic
            Integer userId = Integer.parseInt(request.getParameter("user_id"));
            
            imagePath = User.fetchUserProfileImage(userId);
            
            is = getServletContext().getResourceAsStream("/WEB-INF/uploads/users/"+imagePath);
        }

        OutputStream os = response.getOutputStream();

        byte[] arr = new byte[1024];
        int count1 = 0;
        while((count1 = is.read(arr)) != -1) {
            os.write(arr);
        }

        os.close();
    }
}