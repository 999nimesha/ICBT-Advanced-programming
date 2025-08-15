package com.insert.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.insert.model.ItemBean;

public class ItemDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/pahana_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    // Check if item_code already exists
    public static boolean isItemCodeExists(String code) {
        boolean exists = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT item_code FROM items_table WHERE item_code = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, code);
            ResultSet rs = stmt.executeQuery();
            exists = rs.next();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }

    // Save item
    public static boolean saveItem(ItemBean item) {
        boolean isSaved = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO items_table (item_code, item_name, i_quantity, item_price, item_special_text, unit_price) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, item.getItemCode());
            stmt.setString(2, item.getItemName());
            stmt.setInt(3, item.getQuantity());
            stmt.setDouble(4, item.getPrice());
            stmt.setString(5, item.getSpecialText());
            stmt.setDouble(6, item.getUnitPrice());

            int rows = stmt.executeUpdate();
            isSaved = rows > 0;
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSaved;
    }
}
