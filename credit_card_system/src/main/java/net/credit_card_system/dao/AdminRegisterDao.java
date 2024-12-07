package net.credit_card_system.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import net.credit_card_system.model.AdminRegister;


public class AdminRegisterDao {

	public static int newstaff(AdminRegister staffnewregister) throws ClassNotFoundException {
	      String INSERT_USERS_SQL = "INSERT INTO adminlogin ( user_name, passkey, passkey1) VALUES (?, ?, ?)";
	      int result = 0;
	      
	      Class.forName("com.mysql.cj.jdbc.Driver");


      try {
          Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/credit_card_system?useSSL=false", "root", "root");
          PreparedStatement ps = connection.prepareStatement(INSERT_USERS_SQL);
          
          ps.setString(1, staffnewregister.getUsername());
          ps.setString(2, staffnewregister.getPswrd());
          ps.setString(3, staffnewregister.getPswrd1());
          System.out.println(ps);
           result= ps.executeUpdate();
      } catch (SQLException e) {
          e.printStackTrace();
      }
      
			return result;
  }

}
