package net.credit_card_system.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;

import net.credit_card_system.model.UserRegister;


public class UserRegisterDao {

    public static int newuser(UserRegister userregister) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO userlogin (customer_name, paskey, paskey1) VALUES (?, ?, ?)";
        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/credit_card_system?useSSL=false", "root", "root");
             PreparedStatement ps = connection.prepareStatement(INSERT_USERS_SQL)) {

            ps.setString(1, userregister.getUsername());
            ps.setString(2, userregister.getPswrd());
            ps.setString(3, userregister.getPswrd1());

            // Debugging: Print the SQL statement and parameters
            System.out.println("SQL: " + INSERT_USERS_SQL);
            System.out.println("Parameters: " + userregister.getUsername() + ", " + userregister.getPswrd() + ", " + userregister.getPswrd1());

            result = ps.executeUpdate();

            // Debugging: Print the result of the executeUpdate method
            System.out.println("Rows affected: " + result);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}