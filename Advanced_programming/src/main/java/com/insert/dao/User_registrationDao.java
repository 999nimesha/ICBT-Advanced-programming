package com.insert.dao;

// 1. Import the packages
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

    public boolean insertUser(UserRegisterBean user_registration) throws Exception {
        
        // 2. Load and register the driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection con = DriverManager.getConnection(URL, USER, PASS)) {

            // First check if username already exists
            String checkSql = "SELECT COUNT(*) FROM user_registration WHERE user_name = ?";
            try (PreparedStatement checkSt = con.prepareStatement(checkSql)) {
                checkSt.setString(1, user_registration.getUser_Name());
                try (ResultSet rs = checkSt.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        // Username already exists
                        return false; // You can throw an exception instead if needed
                    }
                }
            }

            // If username is not found, insert new user
            String sql = "INSERT INTO user_registration(user_name, user_email, user_pass, user_contact) VALUES (?, ?, ?, ?)";
            try (PreparedStatement st = con.prepareStatement(sql)) {
                st.setString(1, user_registration.getUser_Name());
                st.setString(2, user_registration.getUser_Email());
                st.setString(3, user_registration.getUser_Pass());
                st.setString(4, user_registration.getUser_Contact());

                st.executeUpdate();
                return true; // Successfully inserted
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw e; // Rethrow or handle appropriately
        }
    }
}
