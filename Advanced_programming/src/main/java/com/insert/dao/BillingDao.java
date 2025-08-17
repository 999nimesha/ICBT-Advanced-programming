package com.insert.dao;
import java.sql.*;
public class BillingDao {
	private String dbURL = "jdbc:mysql://localhost:3306/pahana_db";
    private String dbUser = "root";
    private String dbPass = "";

    public String getCustomerNIC(String name) throws Exception {
        String nic = "";
        String sql = "SELECT cus_nic FROM customer_registration WHERE cus_name = ?";
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                nic = rs.getString("cus_nic");
            }
        }
        return nic;
    }

    public ResultSet getAllCustomers() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        Statement stmt = conn.createStatement();
        return stmt.executeQuery("SELECT cus_name, cus_nic FROM customer_registration");
    }

    public ResultSet getAllItems() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        Statement stmt = conn.createStatement();
        return stmt.executeQuery("SELECT item_code, item_name, unit_price, i_quantity FROM items_table");
    }

    public void reduceItemStock(String code, int quantity) throws Exception {
        String sql = "UPDATE items_table SET i_quantity = i_quantity - ? WHERE item_code = ?";
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, quantity);
            ps.setString(2, code);
            ps.executeUpdate();
        }
    }

}
