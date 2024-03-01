package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Blog {
    private Integer blogId;
    private String name;
    private String smallDesc;
    private String longDesc;
    private User user;
    private SubCategory subCategory;
    private Status status;
    
    public Blog() {
        super();
    }

    public Blog(Integer blogId) {
        this.blogId = blogId;
    }

    public Blog(String name) {
        this.name = name;
    }

    public Blog(Integer blogId, String name) {
        this.blogId = blogId;
        this.name = name;
    }

    public Blog(String name, String smallDesc, String longDesc, User user, SubCategory subCategory, Status status) {
        this.name = name;
        this.smallDesc = smallDesc;
        this.longDesc = longDesc;
        this.user = user;
        this.subCategory = subCategory;
        this.status = status;
    }
    
    public Blog(Integer blogId, String name, String smallDesc, String longDesc, SubCategory subCategory, Status status) {
        this.blogId = blogId;
        this.name = name;
        this.smallDesc = smallDesc;
        this.longDesc = longDesc;
        this.subCategory = subCategory;
        this.status = status;
    }

    public Blog(String name, String smallDesc, String longDesc, User user, SubCategory subCategory) {
        this.name = name;
        this.smallDesc = smallDesc;
        this.longDesc = longDesc;
        this.user = user;
        this.subCategory = subCategory;
    }

    public Blog(Integer blogId, String name, String smallDesc, String longDesc, User user, SubCategory subCategory, Status status) {
        this.blogId = blogId;
        this.name = name;
        this.smallDesc = smallDesc;
        this.longDesc = longDesc;
        this.user = user;
        this.subCategory = subCategory;
        this.status = status;
    }

    public int addBlog() {
        int blogId = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "insert into blogs (name, small_desc, long_desc, user_id, sub_category_id, status_id) value (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, name);
            ps.setString(2, smallDesc);
            ps.setString(3, longDesc);
            ps.setInt(4, user.getUserId());
            ps.setInt(5, subCategory.getSubCategoryId());
            ps.setInt(6, Status.ACTIVE);

            int val = ps.executeUpdate();
            
            if(val == 1) {
                ResultSet rs = ps.getGeneratedKeys();
                if(rs.next()) {
                    blogId = rs.getInt(1);
                }
            }
            
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return blogId;
    }

    public int updateBlog() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "update blogs set name=?, small_desc=?, long_desc=?, sub_category_id=? where blog_id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, smallDesc);
            ps.setString(3, longDesc);
            ps.setInt(4, subCategory.getSubCategoryId());
            ps.setInt(5, blogId);

            ps.executeUpdate();
            
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return blogId;
    }
    
    public static ArrayList<Blog> collectAllUserBlogs(Integer userId) {
        ArrayList<Blog> blogs = new ArrayList<Blog>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");
            
            String query = "select * from blogs where user_id=? limit 5";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                blogs.add(new Blog(rs.getInt("blog_id"), rs.getString("name"), rs.getString("small_desc"), rs.getString("long_desc"), new User(rs.getInt("user_id")), new SubCategory(rs.getInt("sub_category_id")), new Status(rs.getInt("status_id"))));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return blogs;
    }

    public static ArrayList<Blog> collectAllBlogs() {
        ArrayList<Blog> blogs = new ArrayList<Blog>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");
            
            String query = "select * from blogs";

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                blogs.add(new Blog(rs.getInt("blog_id"), rs.getString("name"), rs.getString("small_desc"), rs.getString("long_desc"), new User(rs.getInt("user_id")), new SubCategory(rs.getInt("sub_category_id")), new Status(rs.getInt("status_id"))));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return blogs;
    }

    public static ArrayList<Blog> CollectAllSubsequentBlog(Integer subCategoryId) {
        ArrayList<Blog> blogs = new ArrayList<Blog>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");
            
            String query = "select * from blogs where sub_category_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, subCategoryId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                blogs.add(new Blog(rs.getInt("blog_id"), rs.getString("name"), rs.getString("small_desc"), rs.getString("long_desc"), new User(rs.getInt("user_id")), new SubCategory(rs.getInt("sub_category_id")), new Status(rs.getInt("status_id"))));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return blogs;
    }

    public static void deleteBlog(Integer blogId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "delete from blogs where blog_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, blogId);

            ps.executeUpdate();

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Blog getBlogInfo(Integer blogId) {
        Blog blog = new Blog();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "select blog_id, name, small_desc, long_desc, sub_category_id from blogs where blog_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, blogId);

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                blog.blogId = rs.getInt(1);
                blog.name = rs.getString(2);
                blog.smallDesc = rs.getString(3);
                blog.longDesc = rs.getString(4);
                blog.subCategory = new SubCategory(rs.getInt(5));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return blog;
    }

    public static ArrayList<Blog> getAllSubsequentBlogs(Integer subCategoryId) {
        ArrayList<Blog> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "select blog_id, name, small_desc, long_desc from blogs where sub_category_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, subCategoryId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Blog blog = new Blog();

                blog.blogId = rs.getInt(1);
                blog.name = rs.getString(2);
                blog.smallDesc = rs.getString(3);
                blog.longDesc = rs.getString(4);
                // product.subCategory = new SubCategory(rs.getInt(5));

                list.add(blog);
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return list;
    }

    public Integer getBlogId() {
        return blogId;
    }
    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getSmallDesc() {
        return smallDesc;
    }
    public void setSmallDesc(String smallDesc) {
        this.smallDesc = smallDesc;
    }

    public String getLongDesc() {
        return longDesc;
    }
    public void setLongDesc(String longDesc) {
        this.longDesc = longDesc;
    }

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

    public SubCategory getSubCategory() {
        return subCategory;
    }
    public void setSubCategory(SubCategory subCategory) {
        this.subCategory = subCategory;
    }

    public Status getStatus() {
        return status;
    }
    public void setStatus(Status status) {
        this.status = status;
    }
}