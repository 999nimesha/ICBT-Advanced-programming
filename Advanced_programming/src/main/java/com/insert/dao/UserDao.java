package com.insert.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.insert.model.UserBean;

public class UserDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/pahana_db";
    private String jdbcUsername = "root";  // change if different
    private String jdbcPassword = "";      // change if different

    private static final String LOGIN_SQL = 
        "SELECT * FROM user_registration WHERE user_name = ? AND user_pass = ?";

    public boolean validate(UserBean user) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(LOGIN_SQL)) {

            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());

            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next(); // true if match found

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}