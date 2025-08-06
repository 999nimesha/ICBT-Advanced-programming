package com.insert.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.insert.model.MCustomerBean;

public class MCustomerDao {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/pahana_db";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public MCustomerBean getCustomerByNIC(String nic) {
        String sql = "SELECT * FROM customer_registration WHERE cus_nic = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, nic);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                MCustomerBean customer = new MCustomerBean();
                customer.setCus_name(rs.getString("cus_name"));
                customer.setCus_nic(rs.getString("cus_nic"));
                customer.setCus_address(rs.getString("cus_address"));
                customer.setCus_hometown(rs.getString("cus_hometown"));
                customer.setCus_tele(rs.getString("cus_tele"));
                customer.setCus_email(rs.getString("cus_email"));
                return customer;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateCustomer(MCustomerBean customer, String originalNIC) {
        String sql = "UPDATE customer_registration SET cus_name=?, cus_nic=?, cus_address=?, cus_hometown=?, cus_tele=?, cus_email=? WHERE cus_nic=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, customer.getCus_name());
            stmt.setString(2, customer.getCus_nic());
            stmt.setString(3, customer.getCus_address());
            stmt.setString(4, customer.getCus_hometown());
            stmt.setString(5, customer.getCus_tele());
            stmt.setString(6, customer.getCus_email());
            stmt.setString(7, originalNIC);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteCustomer(String nic) {
        String sql = "DELETE FROM customer_registration WHERE cus_nic=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nic);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}