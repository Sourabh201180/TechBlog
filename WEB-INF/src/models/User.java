package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.jasypt.util.password.StrongPasswordEncryptor;

public class User {
    private Integer userId;
    private String name;
    private String contact;
    private String email;
    private String password;
    private String pic;
    private String otp;
    private String about;
    private Status status;

    public static final Integer SELLER = 1;
    public static final Integer BUYER = 2;

    private static StrongPasswordEncryptor spe = new StrongPasswordEncryptor();

    public User() {

    }

    public User(String name) {
        this.name = name;
    }

    public User(Integer userId) {
        this.userId = userId;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User(String name, String email, String password, String contact, String otp) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.otp = otp;
    }

    public User(Integer userId, String name, String contact, String email, String about) {
        this.userId = userId;
        this.name = name;
        this.contact = contact;
        this.email = email;
        this.about = about;
    }

    public int updateUser() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "update users set name=?, contact=?, email=?, about=? where user_id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, contact);
            ps.setString(3, email);
            ps.setString(4, about);
            ps.setInt(5, userId);

            ps.executeUpdate();
            
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return userId;
    }

    public boolean saveUser() {
        boolean flag = false;

        System.out.println("success");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "insert into users (name, email, password, contact, pic, about, status_id) value (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, spe.encryptPassword(password));
            ps.setString(4, contact);
            ps.setString(5, pic);
            ps.setString(6, about);
            ps.setInt(7, Status.ACTIVE);

            int val = ps.executeUpdate();
            
            if(val == 1) {
                flag = true;
            }
            
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return flag;
    }

    public static User getUserInfo(Integer userId) {
        User user = new User();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "select user_id, name, email, contact, about from users where user_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                user.userId = rs.getInt(1);
                user.name = rs.getString(2);
                user.email = rs.getString(3);
                user.contact = rs.getString(4);
                user.about = rs.getString(5);
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return user;
    }

    public int login() {
        int flag = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "select * from users where email=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                String encryptedPassword = rs.getString("password"); 
                boolean f1 = spe.checkPassword(password, encryptedPassword);
                boolean f2 = rs.getInt("status_id") == Status.ACTIVE;
                if(f2) {
                    if(f1) {
                        userId = rs.getInt("user_id");
                        name = rs.getString("name");
                        contact = rs.getString("contact");
                        pic = rs.getString("pic");
                        about = rs.getString("about");
                        status = Status.STATUS_ACTIVE;
                        flag = 1;
                    } //flag = 0 if password mismatch
                } else {
                    flag = rs.getInt("status_id");
                    // flag = status_id
                }
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return flag;
    }

    public static String fetchUserProfileImage(Integer userId) {
        String imagePath = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "select pic from users where user_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }
}