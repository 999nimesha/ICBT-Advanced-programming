package com.insert.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.insert.dao.Cus_registrationDao;
import com.insert.model.CusRegisterBean;


/**
 * Servlet implementation class user_register_InsertServlet
 */
@WebServlet("/Customer_register_InsertServlet")
public class Customer_register_InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Customer_register_InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String customername = request.getParameter("customer_name");
		String customernic = request.getParameter("customer_nic");
	    String customeraddress = request.getParameter("customer_address");
	    String customerhometown = request.getParameter("customer_hometown");
	    String customertele = request.getParameter("customer_tele");
	    String customeremail = request.getParameter("customer_email");

	        CusRegisterBean customer_registration = new CusRegisterBean();
	        customer_registration.setCustomer_Name(customername);
	        customer_registration.setCustomer_Nic(customernic);
	        customer_registration.setCustomer_Address(customeraddress);
	        customer_registration.setCustomer_Hometown(customerhometown);
	        customer_registration.setCustomer_Tele(customertele);
	        customer_registration.setCustomer_Email(customeremail);

	        try {
	        	Cus_registrationDao dao = new Cus_registrationDao();
	            dao.insertUser(customer_registration);
	            
	            request.setAttribute("message", "success");
	            RequestDispatcher dispatcher = request.getRequestDispatcher("Views/customer.jsp");
                dispatcher.forward(request, response);
	            //response.getWriter().println("Student inserted successfully!");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
		
		
		
		
	}

	}}

