package com.insert.dao;

//1. import the package
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.insert.model.CusRegisterBean;

public class Cus_registrationDao {

public void insertUser(CusRegisterBean customer_registration) throws Exception{
		
		//2. Load and register the driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//3. Create the connection
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_db?useSSL=false","root","");
	
		String sql="INSERT INTO customer_registration(cus_name,cus_nic,cus_address,cus_hometown,cus_tele,cus_email) VALUES (?,?,?,?,?,?)";
		
		//Create a statement to run sql queries
		PreparedStatement st=con.prepareStatement(sql);
		
		//Process the result
		st.setString(1, customer_registration.getCustomer_Name());
		st.setString(2, customer_registration.getCustomer_Nic());
		st.setString(3, customer_registration.getCustomer_Address());
		st.setString(4, customer_registration.getCustomer_Hometown());
		st.setString(5, customer_registration.getCustomer_Tele());
		st.setString(6, customer_registration.getCustomer_Email());
		
		//Execute the query
		st.executeUpdate();
		
		//Close connection
		con.close();
	}
}



