package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.BlogImage;

@WebServlet("/fetch_blog_all_images.do")
public class FetchBlogAllImagesServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {
        HttpSession session = request.getSession();
        
        Integer blogId = Integer.parseInt(request.getParameter("blogId"));

        ArrayList<String> blogImages = BlogImage.fetchAllBlogImages(blogId);
        session.setAttribute("blogImages", blogImages);

        Gson gson = new Gson();

        String resp = gson.toJson(blogImages);

        response.getWriter().write(resp);
    }  
}