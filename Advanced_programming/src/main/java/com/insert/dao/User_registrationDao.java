package com.insert.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.insert.model.UserRegisterBean;

public class User_registrationDao {

    private static final String URL = "jdbc:mysql://localhost:3306/pahana_db?useSSL=false";
    private static final String USER = "root";
    private static final String PASS = "";

    // ✅ 1. Check if username already exists
    public boolean isUsernameExists(String username) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection con = DriverManager.getConnection(URL, USER, PASS)) {
            String checkSql = "SELECT COUNT(*) FROM user_registration WHERE user_name = ?";
            try (PreparedStatement checkSt = con.prepareStatement(checkSql)) {
                checkSt.setString(1, username);
                try (ResultSet rs = checkSt.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt(1) > 0;
                    }
                }
            }
        }
        return false;
    }

    // ✅ 2. Insert new user only if not exists
    public boolean insertUser(UserRegisterBean user_registration) throws Exception {
        if (isUsernameExists(user_registration.getUser_Name())) {
            return false; // ❌ username already exists
        }

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection con = DriverManager.getConnection(URL, USER, PASS)) {
            String sql = "INSERT INTO user_registration(user_name, user_email, user_pass, user_contact) VALUES (?, ?, ?, ?)";
            try (PreparedStatement st = con.prepareStatement(sql)) {
                st.setString(1, user_registration.getUser_Name());
                st.setString(2, user_registration.getUser_Email());
                st.setString(3, user_registration.getUser_Pass());
                st.setString(4, user_registration.getUser_Contact());

                st.executeUpdate();
                return true; // ✅ Successfully inserted
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
}
