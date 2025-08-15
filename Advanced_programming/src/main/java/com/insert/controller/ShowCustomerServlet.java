package com.insert.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;

import com.insert.dao.ShowCustomerDao;
import com.insert.model.CusRegisterBean;

@WebServlet("/ShowCustomerServlet")
public class ShowCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	    String searchNIC = request.getParameter("search");
        String deleteNIC = request.getParameter("delete");
        String message = null;

        ShowCustomerDao dao = new ShowCustomerDao();

        if (deleteNIC != null && !deleteNIC.trim().isEmpty()) {
            boolean deleted = dao.deleteUserByNIC(deleteNIC);
            message = deleted ? "Customer deleted successfully." : "Failed to delete customer.";
        }

        List<CusRegisterBean> customerList;
        if (searchNIC != null && !searchNIC.trim().isEmpty()) {
            customerList = dao.searchUsersByNIC(searchNIC);
        } else {
            customerList = dao.getAllCustomers();
        }

        request.setAttribute("customerList", customerList);
        request.setAttribute("message", message);

        RequestDispatcher dispatcher = request.getRequestDispatcher("Views/customer_show.jsp");
        dispatcher.forward(request, response);
	}
}
