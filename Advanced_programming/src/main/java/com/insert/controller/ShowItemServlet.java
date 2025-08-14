package com.insert.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import com.insert.model.ShowItemBean;
import com.insert.dao.ShowItemDao;

@WebServlet("/ShowItemServlet")
public class ShowItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String code = request.getParameter("code");

        if ("delete".equals(action) && code != null) {
            ShowItemDao.deleteItem(code);
            request.setAttribute("message", "Item deleted successfully.");
        }

        String search = request.getParameter("search");
        List<ShowItemBean> itemList;

        if (search != null && !search.trim().isEmpty()) {
            itemList = ShowItemDao.searchByCodeOrName(search.trim());
        } else {
            itemList = ShowItemDao.getAllItems();
        }

        request.setAttribute("itemList", itemList);
        request.getRequestDispatcher("Views/item_show.jsp").forward(request, response);
    }
}
