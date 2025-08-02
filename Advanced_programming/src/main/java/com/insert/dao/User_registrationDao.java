package com.insert.dao;

//1. import the package
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.insert.model.UserRegisterBean;

public class User_registrationDao {

public void insertUser(UserRegisterBean user_registration) throws Exception{
		
		//2. Load and register the driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//3. Create the connection
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_db?useSSL=false","root","");
	
		String sql="INSERT INTO user_registration(user_name,user_email,user_pass,user_contact) VALUES (?,?,?,?)";
		
		//Create a statement to run sql queries
		PreparedStatement st=con.prepareStatement(sql);
		
		//Process the result
		st.setString(1, user_registration.getUser_Name());
		st.setString(2, user_registration.getUser_Email());
		st.setString(3, user_registration.getUser_Pass());
		st.setString(4, user_registration.getUser_Contact());
		
		//Execute the query
		st.executeUpdate();
		
		//Close connection
		con.close();
	}
}


