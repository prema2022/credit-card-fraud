package net.credit_card_system.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;

@WebServlet("/userlogin")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the login.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/UserLogin.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String customer_name = request.getParameter("username");
        String paskey = request.getParameter("pswrd");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/credit_card_system?useSSL=false", "root", "root");
            PreparedStatement pst = con.prepareStatement("SELECT * FROM userlogin WHERE customer_name = ? AND paskey = ?");
            pst.setString(1, customer_name);
            pst.setString(2, paskey);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                boolean isSuspended = rs.getBoolean("is_suspended");
                if (isSuspended) {
                    request.setAttribute("status", "suspended");
                    dispatcher = request.getRequestDispatcher("/WEB-INF/views/UserLogin.jsp");
                } else {
                    session.setAttribute("name", rs.getString("customer_name"));
                    // Redirect to CardValidationServlet
                    response.sendRedirect(request.getContextPath() + "/CardValidation");
                }
            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("/WEB-INF/views/UserLogin.jsp");
            }
            if (dispatcher != null) {
                dispatcher.forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
            dispatcher = request.getRequestDispatcher("/WEB-INF/views/UserLogin.jsp");
            dispatcher.forward(request, response);
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