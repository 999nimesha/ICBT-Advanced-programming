package com.insert.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.http.HttpSession;

import com.insert.dao.UserDao;
import com.insert.model.UserBean;



@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private UserDao userDAO;

    public void init() {
        userDAO = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("user_nam");
        String password = request.getParameter("user_pass");

        UserBean user = new UserBean(username, password);

        try {
            if (userDAO.validate(user)) {
                HttpSession session = request.getSession();
                session.setAttribute("user_name", username);
                response.sendRedirect("Views/dashboard.jsp"); // redirect to success page
            } else {
                response.sendRedirect("Views/index.jsp?error=true"); // redirect back with error
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

