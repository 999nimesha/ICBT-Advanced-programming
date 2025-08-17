package com.insert.controller;

import com.insert.model.CartItemBean;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/RemoveCartItemServlet")
public class RemoveCartItemServlet extends HttpServlet {

    // Change these to your DB settings
    private static final String DB_URL = "jdbc:mysql://localhost:3306/pahana_db";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");

        HttpSession session = request.getSession();
        List<CartItemBean> cart = (List<CartItemBean>) session.getAttribute("cart");

        if (cart != null && code != null) {
            Iterator<CartItemBean> iterator = cart.iterator();
            while (iterator.hasNext()) {
                CartItemBean item = iterator.next();
                if (item.getItemCode().equals(code)) {
                    // Restore the quantity in DB
                    restoreItemQuantity(item.getItemCode(), item.getQuantity());
                    // Remove from cart
                    iterator.remove();
                    break;
                }
            }
        }

        response.sendRedirect("Views/cart.jsp");
    }

    private void restoreItemQuantity(String itemCode, int quantityToAdd) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String sql = "UPDATE items_table SET i_quantity = i_quantity + ? WHERE item_code = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, quantityToAdd);
            ps.setString(2, itemCode);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}
