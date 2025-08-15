package com.insert.controller;

import java.io.IOException;
import com.insert.dao.User_registrationDao;
import com.insert.model.UserRegisterBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user_register_InsertServlet")
public class user_register_InsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("user_name");
        String userEmail = request.getParameter("user_email");
        String userPass = request.getParameter("user_pass");
        String userContact = request.getParameter("user_contact");

        UserRegisterBean userBean = new UserRegisterBean();
        userBean.setUser_Name(userName);
        userBean.setUser_Email(userEmail);
        userBean.setUser_Pass(userPass);
        userBean.setUser_Contact(userContact);

        User_registrationDao dao = new User_registrationDao();

        try {
            boolean isInserted = dao.insertUser(userBean);

            if (!isInserted) {
                request.setAttribute("errorMessage", "❌ Username already exists! Please choose another one.");
            } else {
                request.setAttribute("successMessage", "success");
            }
            request.getRequestDispatcher("Views/registration.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "⚠ An error occurred while registering. Please try again.");
            request.getRequestDispatcher("Views/registration.jsp").forward(request, response);
        }
    }
}
