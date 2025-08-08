package com.insert.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.insert.model.ShowUserBean;

public class ShowUserDao {

    private String jdbcURL = "jdbc:mysql://localhost:3306/pahana_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = ""; // update if needed

    private static final String SELECT_ALL_USERS = "SELECT * FROM user_registration";

    public List<ShowUserBean> getAllUsers() {
        List<ShowUserBean> users = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_USERS);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ShowUserBean user = new ShowUserBean();
                user.setUser_name(rs.getString("user_name"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_pass(rs.getString("user_pass"));
                user.setUser_contact(rs.getString("user_contact"));
                users.add(user);
            }

            rs.close();
            ps.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public List<ShowUserBean> searchUsersByName(String name) {
        List<ShowUserBean> users = new ArrayList<>();
        String SEARCH_QUERY = "SELECT * FROM user_registration WHERE user_name LIKE ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement ps = connection.prepareStatement(SEARCH_QUERY);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ShowUserBean user = new ShowUserBean();
                user.setUser_name(rs.getString("user_name"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_pass(rs.getString("user_pass"));
                user.setUser_contact(rs.getString("user_contact"));
                users.add(user);
            }

            rs.close();
            ps.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public boolean deleteUserByName(String userName) {
        String DELETE_QUERY = "DELETE FROM user_registration WHERE user_name = ?";
        boolean deleted = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement ps = conn.prepareStatement(DELETE_QUERY);
            ps.setString(1, userName);

            int rows = ps.executeUpdate();
            deleted = rows > 0;

            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return deleted;
    }
}
