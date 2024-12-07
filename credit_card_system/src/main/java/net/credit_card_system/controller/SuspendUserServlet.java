package net.credit_card_system.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SuspendUser")
public class SuspendUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/credit_card_system?useSSL=false", "root", "root");

            String sql = "UPDATE userlogin SET is_suspended = TRUE WHERE id = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, userId);

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("Admin?action=viewRegisteredUsers");
            } else {
                response.sendRedirect("Error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Error.jsp");
        } finally {
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