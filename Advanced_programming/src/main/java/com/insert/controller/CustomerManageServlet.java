package com.insert.controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;

import com.insert.dao.MCustomerDao;
import com.insert.model.MCustomerBean;

@WebServlet("/CustomerManageServlet")
public class CustomerManageServlet extends HttpServlet {
    private MCustomerDao MCustomerDao;

    public void init() {
        MCustomerDao = new MCustomerDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "search":
                searchCustomer(request, response);
                break;
            case "update":
                updateCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nic = request.getParameter("search_nic");
        MCustomerBean customer = MCustomerDao.getCustomerByNIC(nic);
        if (customer != null) {
            request.setAttribute("customer", customer);
        } else {
            request.setAttribute("message", "notfound");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("Views/customer_manage.jsp");
        dispatcher.forward(request, response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String originalNIC = request.getParameter("original_nic");

        MCustomerBean customer = new MCustomerBean();
        customer.setCus_name(request.getParameter("customer_name"));
        customer.setCus_nic(request.getParameter("customer_nic"));  // new NIC
        customer.setCus_address(request.getParameter("customer_address"));
        customer.setCus_hometown(request.getParameter("customer_hometown"));
        customer.setCus_tele(request.getParameter("customer_tele"));
        customer.setCus_email(request.getParameter("customer_email"));

        boolean updated = MCustomerDao.updateCustomer(customer, originalNIC);
        request.setAttribute("message", updated ? "success" : "error");
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("Views/customer_manage.jsp").forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nic = request.getParameter("customer_nic");
        boolean deleted = MCustomerDao.deleteCustomer(nic);
        request.setAttribute("message", deleted ? "success" : "error");
        request.getRequestDispatcher("Views/customer_manage.jsp").forward(request, response);
    }
}
