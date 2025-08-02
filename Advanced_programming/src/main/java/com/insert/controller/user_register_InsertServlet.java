package com.insert.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.insert.dao.User_registrationDao;
import com.insert.model.UserRegisterBean;


/**
 * Servlet implementation class user_register_InsertServlet
 */
@WebServlet("/user_register_InsertServlet")
public class user_register_InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_register_InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("user_name");
	    String useremail = request.getParameter("user_email");
	    String userpass = request.getParameter("user_pass");
	    String usercontact = request.getParameter("user_contact");

	        UserRegisterBean user_registration = new UserRegisterBean();
	        user_registration.setUser_Name(username);
	        user_registration.setUser_Email(useremail);
	        user_registration.setUser_Pass(userpass);
	        user_registration.setUser_Contact(usercontact);
	        

	        try {
	        	User_registrationDao dao = new User_registrationDao();
	            dao.insertUser(user_registration);
	            
	            request.setAttribute("message", "success");
	            RequestDispatcher dispatcher = request.getRequestDispatcher("Views/registration.jsp");
                dispatcher.forward(request, response);
	            //response.getWriter().println("Student inserted successfully!");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
		
		
		
		
	}

	}}

