package com.insert.dao;

import java.sql.*;
import java.util.*;
import com.insert.model.ShowItemBean;

public class ShowItemDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/pahana_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static List<ShowItemBean> getAllItems() {
        List<ShowItemBean> list = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT * FROM items_table";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ShowItemBean item = mapItem(rs);
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<ShowItemBean> searchByCodeOrName(String keyword) {
        List<ShowItemBean> list = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT * FROM items_table WHERE item_code LIKE ? OR item_name LIKE ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + keyword + "%");
            stmt.setString(2, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ShowItemBean item = mapItem(rs);
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void deleteItem(String code) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "DELETE FROM items_table WHERE item_code = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, code);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static ShowItemBean mapItem(ResultSet rs) throws SQLException {
        ShowItemBean item = new ShowItemBean();
        item.setItemCode(rs.getString("item_code"));
        item.setItemName(rs.getString("item_name"));
        item.setQuantity(rs.getInt("i_quantity")); // ✅ Must match your DB column
        item.setPrice(rs.getDouble("item_price"));
        item.setSpecialText(rs.getString("item_special_text"));
        item.setUnitPrice(rs.getDouble("unit_price"));
        return item;
    }
}
