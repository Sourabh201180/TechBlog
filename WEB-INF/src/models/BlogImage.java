package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BlogImage {
    private Integer blogImageId;
    private String image;
    private Blog blog;
    
    public BlogImage() {

    }

    public static void addBlogMainImage(String pathToSave, Integer blogId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "insert into blog_images (image, blog_id) value (?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, pathToSave);
            ps.setInt(2, blogId);

            ps.executeUpdate();

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void addBlogMultipleImages(String fileNames, String uploadPath, Integer blogId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "insert into blog_images (image, blog_id) value (?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            String[] images = fileNames.split(", ");
            System.out.println(images.length);
            ps.setInt(2, blogId);
            
            for(String image : images) {
                ps.setString(1, uploadPath+"/"+image);
                ps.executeUpdate();
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<String> fetchAllBlogImages(Integer blogId) {
        ArrayList<String> blogImages = new ArrayList<String>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");
            
            String query = "select image from blog_images where blog_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, blogId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                blogImages.add(rs.getString(1));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return blogImages;
    }

    public static String fetchMainBlogImage(Integer blogId) {
        String imagePath = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "select image from blog_images where blog_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, blogId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                imagePath = (String)rs.getString(1);
                break;
            }
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return imagePath;
    }

    public static void deleteBlogImages(Integer blogId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "delete from blog_images where blog_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, blogId);

            ps.executeUpdate();

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Integer getBlogImageId() {
        return blogImageId;
    }
    public void setBlogImageId(Integer blogImageId) {
        this.blogImageId = blogImageId;
    }

    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }

    public Blog getBlog() {
        return blog;
    }
    public void setBlog(Blog blog) {
        this.blog = blog;
    }
}