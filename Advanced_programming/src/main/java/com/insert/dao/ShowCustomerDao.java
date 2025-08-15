package com.insert.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.insert.model.CusRegisterBean;

public class ShowCustomerDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/pahana_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String SELECT_ALL_CUSTOMERS = "SELECT * FROM customer_registration";

    public List<CusRegisterBean> getAllCustomers() {
        List<CusRegisterBean> customers = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CUSTOMERS);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CusRegisterBean customer = new CusRegisterBean();
                customer.setCustomer_Name(rs.getString("cus_name"));
                customer.setCustomer_Nic(rs.getString("cus_nic"));
                customer.setCustomer_Address(rs.getString("cus_address"));
                customer.setCustomer_Hometown(rs.getString("cus_hometown"));
                customer.setCustomer_Tele(rs.getString("cus_tele"));
                customer.setCustomer_Email(rs.getString("cus_email"));
                customers.add(customer);
            }

            rs.close();
            ps.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return customers;
    }

    public List<CusRegisterBean> searchUsersByNIC(String NIC) {
        List<CusRegisterBean> customers = new ArrayList<>();
        String SEARCH_QUERY = "SELECT * FROM customer_registration WHERE cus_nic LIKE ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement ps = connection.prepareStatement(SEARCH_QUERY);
            ps.setString(1, "%" + NIC + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CusRegisterBean customer = new CusRegisterBean();
                customer.setCustomer_Name(rs.getString("cus_name"));
                customer.setCustomer_Nic(rs.getString("cus_nic"));
                customer.setCustomer_Address(rs.getString("cus_address"));
                customer.setCustomer_Hometown(rs.getString("cus_hometown"));
                customer.setCustomer_Tele(rs.getString("cus_tele"));
                customer.setCustomer_Email(rs.getString("cus_email"));
                customers.add(customer);
            }

            rs.close();
            ps.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return customers;
    }

    public boolean deleteUserByNIC(String NIC) {
        String DELETE_QUERY = "DELETE FROM customer_registration WHERE cus_nic = ?";
        boolean deleted = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement ps = conn.prepareStatement(DELETE_QUERY);
            ps.setString(1, NIC);

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
