package com.insert.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.insert.dao.MUserDao;
import com.insert.model.MUserBean;

import java.io.IOException;

@WebServlet("/UserManageServlet")
public class UserManageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MUserDao dao;

    public void init() {
        dao = new MUserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("search".equals(action)) {
            String name = request.getParameter("search_name");
            MUserBean user = dao.getUserByName(name);
            if (user != null) {
                request.setAttribute("user", user);
                request.setAttribute("originalName", name); // Pass original name
            } else {
                request.setAttribute("message", "notfound");
            }

        } else if ("update".equals(action)) {
            String originalName = request.getParameter("original_name");

            MUserBean user = new MUserBean();
            user.setUserName(request.getParameter("user_name"));
            user.setUserEmail(request.getParameter("user_email"));
            user.setUserPass(request.getParameter("user_pass"));
            user.setUserContact(request.getParameter("user_contact"));

            boolean updated = dao.updateUser(user, originalName);
            request.setAttribute("user", user);
            request.setAttribute("message", updated ? "updated" : "notfound");
            request.setAttribute("originalName", user.getUserName());

        } else if ("delete".equals(action)) {
            String name = request.getParameter("user_name");
            boolean deleted = dao.deleteUserByName(name);
            request.setAttribute("message", deleted ? "deleted" : "notfound");
        }

        request.getRequestDispatcher("Views/user_manage.jsp").forward(request, response);
    }
}
