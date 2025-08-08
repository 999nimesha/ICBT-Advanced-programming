package com.insert.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.insert.dao.ShowUserDao;
import com.insert.model.ShowUserBean;

@WebServlet("/ShowUserServlet")
public class ShowUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchName = request.getParameter("search");
        String deleteUser = request.getParameter("delete");
        String message = null;

        ShowUserDao dao = new ShowUserDao();

        // Delete logic
        if (deleteUser != null && !deleteUser.trim().isEmpty()) {
            boolean deleted = dao.deleteUserByName(deleteUser);
            message = deleted ? "User deleted successfully." : "Failed to delete user.";
        }

        List<ShowUserBean> userList;
        if (searchName != null && !searchName.trim().isEmpty()) {
            userList = dao.searchUsersByName(searchName);
        } else {
            userList = dao.getAllUsers();
        }

        request.setAttribute("userList", userList);
        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Views/show_user.jsp");
        dispatcher.forward(request, response);
    }
}
