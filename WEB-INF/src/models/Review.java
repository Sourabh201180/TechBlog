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

    public Review(Integer reviewId, String review, User user, Blog blog) {
        this.reviewId = reviewId;
        this.review = review;
        this.user = user;
        this.blog = blog;
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

    public void updateReview(Integer reviewId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "update reviews set review=? where review_id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, review);
            ps.setInt(2, reviewId);

            ps.executeUpdate();
            
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void deleteReview(Integer reviewId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "delete from reviews where review_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, reviewId);

            ps.executeUpdate();

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void deleteBlogReviews(Integer blogId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "delete from reviews where blog_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, blogId);

            ps.executeUpdate();

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Review getReviewInfo(Integer reviewId) {
        Review review = new Review();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "select r.review_id, r.review, u.user_id, u.name, b.blog_id, b.name from reviews as r inner join users as u inner join blogs as b where r.user_id=u.user_id and r.blog_id=b.blog_id and r.review_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, reviewId);

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                review.reviewId = rs.getInt(1);
                review.review = rs.getString(2);
                review.user = new User(rs.getInt(3), rs.getString(4));
                review.blog = new Blog(rs.getInt(5), rs.getString(6));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return review;
    }

    public static ArrayList<Review> collectAllUserReviews(Integer userId) {
        ArrayList<Review> reviews = new ArrayList<Review>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");
            
            String query = "select r.review_id, r.review, u.user_id, u.name, b.blog_id, b.name from reviews as r inner join users as u inner join blogs as b where r.user_id=u.user_id and r.blog_id=b.blog_id and r.user_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                reviews.add(new Review(rs.getInt("review_id"), rs.getString("review"), new User(rs.getInt("user_id"), rs.getString("name")), new Blog(rs.getInt("blog_id"), rs.getString(6))));
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
            
            String query = "select r.review_id, r.review, u.user_id, u.name, b.blog_id, b.name from reviews as r inner join users as u inner join blogs as b where r.user_id=u.user_id and r.blog_id=b.blog_id and b.blog_id=?";
            // String query = "select r.review_id, r.review, u.user_id, u.name, b.blog_id, b.name from reviews as r inner join users as u inner join blogs as b where r.user_id=u.user_id and r.blog_id=b.blog_id and b.blog_id=? limit 5";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, blogId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                reviews.add(new Review(rs.getInt("review_id"), rs.getString("review"), new User(rs.getInt("user_id"), rs.getString("name")), new Blog(rs.getInt("blog_id"), rs.getString("name"))));
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