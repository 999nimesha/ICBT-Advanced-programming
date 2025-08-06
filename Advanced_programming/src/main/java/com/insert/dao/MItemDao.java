package com.insert.dao;

import com.insert.model.MItemBean;

import java.sql.*;

public class MItemDao {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/pahana_db";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = ""; // Change if needed

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public MItemBean getItemByCode(String code) {
        String query = "SELECT * FROM items_table WHERE item_code = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                MItemBean item = new MItemBean();
                item.setItemCode(rs.getString("item_code"));
                item.setItemName(rs.getString("item_name"));
                item.setQuantity(rs.getInt("i_quantity"));
                item.setPrice(rs.getDouble("item_price"));
                item.setSpecialText(rs.getString("item_special_text"));
                item.setUnitPrice(rs.getDouble("unit_price"));
                return item;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateItem(MItemBean item) {
        String sql = "UPDATE items_table SET item_name=?, i_quantity=?, item_price=?, item_special_text=?, unit_price=? WHERE item_code=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, item.getItemName());
            ps.setInt(2, item.getQuantity());
            ps.setDouble(3, item.getPrice());
            ps.setString(4, item.getSpecialText());
            ps.setDouble(5, item.getUnitPrice());
            ps.setString(6, item.getItemCode());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteItem(String code) {
        String sql = "DELETE FROM items_table WHERE item_code=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, code);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
