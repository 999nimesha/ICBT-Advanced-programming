package com.insert.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.insert.model.MUserBean;

public class MUserDao {
    private Connection conn;

    public MUserDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_db", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public MUserBean getUserByName(String name) {
        MUserBean user = null;
        try {
            String sql = "SELECT * FROM user_registration WHERE user_name = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new MUserBean();
                user.setUserName(rs.getString("user_name"));
                user.setUserEmail(rs.getString("user_email"));
                user.setUserPass(rs.getString("user_pass"));
                user.setUserContact(rs.getString("user_contact"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // ✅ Accept originalName to find and update record
    public boolean updateUser(MUserBean user, String originalName) {
        try {
            String sql = "UPDATE user_registration SET user_name=?, user_email=?, user_pass=?, user_contact=? WHERE user_name=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getUserEmail());
            ps.setString(3, user.getUserPass());
            ps.setString(4, user.getUserContact());
            ps.setString(5, originalName);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUserByName(String name) {
        try {
            String sql = "DELETE FROM user_registration WHERE user_name=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
