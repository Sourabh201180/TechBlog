package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SubCategory {
    private Integer subCategoryId;
    private String name;
    private String desc;
    private String pic;
    private Category category;

    public SubCategory() {
        super();
    }

    public SubCategory(Integer subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public SubCategory(Integer subCategoryId, String name) {
        this.subCategoryId = subCategoryId;
        this.name = name;
    }

    public SubCategory(Integer subCategoryId, String name, Category category) {
        this.subCategoryId = subCategoryId;
        this.name = name;
        this.category = category;
    }

    public SubCategory(Integer subCategoryId, String name, String desc, String pic, Category category) {
        this.subCategoryId = subCategoryId;
        this.name = name;
        this.desc = desc;
        this.pic = pic;
        this.category = category;
    }

    public static SubCategory getSubCategoryInfo(Integer subCategoryId) {
        SubCategory subCategory = new SubCategory();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "select sub_category_id, name, short_desc, pic, category_id from sub_categories where sub_category_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, subCategoryId);

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                subCategory.subCategoryId = rs.getInt(1);
                subCategory.name = rs.getString(2);
                subCategory.desc = rs.getString(3);
                subCategory.pic = rs.getString(4);
                subCategory.category = new Category(rs.getInt(5));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return subCategory;
    }

    public static ArrayList<SubCategory> collectAllSubCategories() {
        ArrayList<SubCategory> subCategories = new ArrayList<SubCategory>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "select sub_category_id, s.name, s.short_desc, s.pic, s.category_id, c.name from sub_categories as s inner join categories as c where s.category_id=c.category_id";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                subCategories.add(new SubCategory(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), new Category(rs.getInt(5), rs.getString(6))));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return subCategories;
    }

    public static ArrayList<SubCategory> CollectAllSubsequentSubCategories(Integer categoryId) {
        ArrayList<SubCategory> subCategories = new ArrayList<SubCategory>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblogdb?user=root&password=1523");

            String query = "select sub_category_id, s.name, s.short_desc, s.pic, s.category_id, c.name from sub_categories as s inner join categories as c where s.category_id=c.category_id and s.category_id=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                subCategories.add(new SubCategory(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), new Category(rs.getInt(5), rs.getString(6))));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return subCategories;
    }

    public Integer getSubCategoryId() {
        return subCategoryId;
    }
    public void setSubCategoryId(Integer subCategoryId) {
        this.subCategoryId = subCategoryId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Category getCategory() {
        return category;
    }
    public void setCategory(Category category) {
        this.category = category;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }    
}