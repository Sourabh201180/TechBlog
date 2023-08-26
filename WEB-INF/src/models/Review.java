package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Review {
    private Integer reviewId;
    private String review;
    private Blog blog;
    private User user;

    public Review() {

    }
    
    public Review(Integer reviewId) {
        this.reviewId = reviewId;
    }

    public Review(User user, String review) {
        this.user = user;
        this.review = review;
    }

    public Review(User user, Blog blog, String review) {
        this.user = user;
        this.blog = blog;
        this.review = review;
    }

    public Review(String review, User user, Blog blog) {
        this.review = review;
        this.user = user;
        this.blog = blog;
    }

    public Review(Integer reviewId, User user, Blog blog, String review) {
        this.reviewId = reviewId;
        this.user = user;
        this.blog = blog;
        this.review = review;
    }

    // public static ArrayList<Review> collectAllReviews(Integer blogId) {
    //     ArrayList<Review> reviews = new ArrayList<Review>();

    //     try{
    //         Class.forName("com.mysql.cj.jdbc.Driver");

    //         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

    //         String query = "select u.name, r.review from users as u inner join reviews as r where blog_id =? and u.user_id = r.user_id;";

    //         PreparedStatement ps = con.prepareStatement(query);
    //         ps.setInt(1, blogId);

    //         ResultSet rs = ps.executeQuery();

    //         while(rs.next()) {
    //             reviews.add(new Review(new User(rs.getString(1)), rs.getString(2)));
    //         }

    //         con.close();

    //     }catch(SQLException|ClassNotFoundException e){
    //         e.printStackTrace();
    //     }

    //     return reviews;
    // }

    public void addReview(Integer userId, Integer blogId, String description) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "insert into reviews (user_id, blog_id, review) values(?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, blogId);
            ps.setString(3, description);

            ps.executeUpdate();
            
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Review> collectAllUserReviews(Integer userId) {
        ArrayList<Review> reviews = new ArrayList<Review>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");
            
            String query = "select * from reviews where user_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                reviews.add(new Review(rs.getString("review"), new User(rs.getInt("user_id")), new Blog(rs.getInt("blog_id"))));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return reviews;
    }

    public static ArrayList<Review> collectAllBlogReviews(Integer blogId) {
        ArrayList<Review> reviews = new ArrayList<Review>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");
            
            String query = "select * from reviews where blog_id=? limit 5";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, blogId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                reviews.add(new Review(rs.getString("review"), new User(rs.getInt("user_id")), new Blog(rs.getInt("blog_id"))));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return reviews;
    }

    public void setReviewId(Integer reviewId){
        this.reviewId = reviewId;
    }

    public Integer getReviewId(){
        return reviewId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }
}