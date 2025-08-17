package com.insert.controller;

import com.insert.model.CartItemBean;
import com.insert.dao.BillingDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get customer details from form
        String customerName = request.getParameter("cus_name");
        String customerNic = request.getParameter("cus_nic");

        // Get item details from form
        String itemCode = request.getParameter("item_code");
        String itemName = request.getParameter("item_name");
        double unitPrice = Double.parseDouble(request.getParameter("unit_price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double total = unitPrice * quantity;

        // Create cart item
        CartItemBean item = new CartItemBean();
        item.setItemCode(itemCode);
        item.setItemName(itemName);
        item.setUnitPrice(unitPrice);
        item.setQuantity(quantity);
        item.setTotal(total);

        // Manage session and cart
        HttpSession session = request.getSession();
        List<CartItemBean> cart = (List<CartItemBean>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        cart.add(item);

        // Set cart and customer info in session
        session.setAttribute("cart", cart);
        session.setAttribute("customerName", customerName);
        session.setAttribute("customerNic", customerNic);

        // Update stock
        try {
            new BillingDao().reduceItemStock(itemCode, quantity);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to billing page
        response.sendRedirect("Views/bill.jsp");
    }
}
