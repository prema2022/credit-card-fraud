package net.credit_card_system.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
 
/**
 * Servlet implementation class StaffregisterServlet
 */
@WebServlet("/staffregister")
public class AdminRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the registration page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/AdminRegister.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve form parameters
        String user_name = request.getParameter("username");
        String passkey = request.getParameter("pswrd");
        String passkey1 = request.getParameter("pswrd1");

        RequestDispatcher dispatcher = null;
        Connection con = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/credit_card_system?useSSL=false", "root", "root");

            // Prepare the SQL statement
            String sql = "INSERT INTO adminlogin (user_name, passkey, passkey1) VALUES (?, ?, ?)";
            java.sql.PreparedStatement pst = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            pst.setString(1, user_name);
            pst.setString(2, passkey);
            pst.setString(3, passkey1);

            // Execute the insert statement
            int row = pst.executeUpdate();

            // Set the request dispatcher
            dispatcher = request.getRequestDispatcher("/WEB-INF/views/AdminRegister.jsp");

            // Check if the insertion was successful
            if (row > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

            // Forward the request and response to the dispatcher
            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions by setting an error status
            request.setAttribute("status", "error");
            dispatcher = request.getRequestDispatcher("/WEB-INF/views/AdminRegister.jsp");
            dispatcher.forward(request, response);
        } finally {
            // Close the database connection
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}