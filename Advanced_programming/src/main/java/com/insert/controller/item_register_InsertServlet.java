package com.insert.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.insert.model.ItemBean;
import com.insert.dao.ItemDao;
import java.io.IOException;

@WebServlet("/item_register_InsertServlet")
public class item_register_InsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String code = request.getParameter("item_code");
            String name = request.getParameter("item_name");
            int quantity = Integer.parseInt(request.getParameter("i_quantity"));
            double price = Double.parseDouble(request.getParameter("item_price"));
            String specialText = request.getParameter("item_special_text");
            double unitPrice = Double.parseDouble(request.getParameter("unit_price"));

            ItemBean item = new ItemBean();
            item.setItemCode(code);
            item.setItemName(name);
            item.setQuantity(quantity);
            item.setPrice(price);
            item.setSpecialText(specialText);
            item.setUnitPrice(unitPrice);

            // Check duplicate item_code
            if (ItemDao.isItemCodeExists(code)) {
                response.sendRedirect("Views/item.jsp?message=duplicate");
            } else {
                boolean isSaved = ItemDao.saveItem(item);
                if (isSaved) {
                    response.sendRedirect("Views/item.jsp?message=success");
                } else {
                    response.sendRedirect("Views/item.jsp?message=fail");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Views/item.jsp?message=fail");
        }
    }
}
