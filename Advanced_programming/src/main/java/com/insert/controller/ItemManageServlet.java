package com.insert.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.insert.dao.MItemDao;
import com.insert.model.MItemBean;

import java.io.IOException;

@WebServlet("/ItemManageServlet")
public class ItemManageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String code = request.getParameter("search_code");

        if (code == null || code.trim().isEmpty()) {
            request.setAttribute("message", "Please enter a valid item code.");
        } else {
            code = code.trim();
            MItemDao dao = new MItemDao();
            MItemBean item = dao.getItemByCode(code);

            if (item != null) {
                request.setAttribute("item", item);
                request.setAttribute("message", "Item found");
            } else {
                request.setAttribute("message", "Item not found");
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher("Views/item_manage.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String code = request.getParameter("item_code");
        MItemDao dao = new MItemDao();

        if ("delete".equals(action)) {
            boolean deleted = dao.deleteItem(code);
            request.setAttribute("message", deleted ? "Item deleted successfully" : "Failed to delete item");

        } else if ("update".equals(action)) {
            MItemBean item = new MItemBean();
            item.setItemCode(code);
            item.setItemName(request.getParameter("item_name"));
            item.setQuantity(Integer.parseInt(request.getParameter("i_quantity")));
            item.setPrice(Double.parseDouble(request.getParameter("item_price")));
            item.setSpecialText(request.getParameter("item_special_text"));
            item.setUnitPrice(Double.parseDouble(request.getParameter("unit_price")));

            boolean updated = dao.updateItem(item);
            request.setAttribute("message", updated ? "Item updated successfully" : "Update failed");
            request.setAttribute("item", item);
        }

        RequestDispatcher rd = request.getRequestDispatcher("Views/item_manage.jsp");
        rd.forward(request, response);
    }
}
