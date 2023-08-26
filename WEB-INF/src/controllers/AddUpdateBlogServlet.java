package controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Blog;
import models.SubCategory;
import models.User;

@WebServlet("/add_update_blog.do")
public class AddUpdateBlogServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("hey");
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        
        boolean flag = false;

        if(user != null) {
            Integer add_update = Integer.parseInt(request.getParameter("add_update"));
            // add_update = 1 => add
            // add_update = 2 => update

            System.out.println(1);
            
            String name = request.getParameter("blog_name");
            System.out.println(name+"~");
            String smallDesc = request.getParameter("blog_short_content");
            System.out.println(smallDesc+"~");
            String longDesc = request.getParameter("blog_long_content");
            System.out.println(longDesc+"~");
            Integer blogCategoryId = Integer.parseInt(request.getParameter("blog_category1"));      // this we will not gone use
            System.out.println(blogCategoryId+"~");
            Integer subCategoryId = Integer.parseInt(request.getParameter("blog_sub_category1"));
            System.out.println(subCategoryId+"~");
            
            SubCategory subCategory = new SubCategory(subCategoryId);
            System.out.println(2);
            
            Blog blog = new Blog(name, smallDesc, longDesc, user, subCategory);
            System.out.println(3);
            
            Integer blgId = 0;
            if(add_update == 1) {
                blgId = blog.addBlog();
            } else {
                Integer blog_id = Integer.parseInt(request.getParameter("blog_id"));
                blog.setBlogId(blog_id);
                
                blgId = blog.updateBlog();
            }
            
            String blogId = Integer.toString(blgId);
            if(blogId.length() > 0) {        
                System.out.println(1234);        
                String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users/"+user.getEmail()+"/blogs");
                File file = new File(uploadPath, blogId);
                file.mkdir();

                String uploadPath2 = getServletContext().getRealPath("/WEB-INF/uploads/users/"+user.getEmail()+"/blogs/"+blogId);
                File file2 = new File(uploadPath2, "pics");
                file2.mkdir();

                flag = true;
            }

            Blog blg = new Blog(blgId);
            session.setAttribute("blg", blg);
        }
        System.out.println(4);

        response.getWriter().print(flag);
    }
}