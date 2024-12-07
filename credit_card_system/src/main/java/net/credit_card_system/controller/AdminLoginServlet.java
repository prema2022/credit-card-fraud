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

import jakarta.servlet.RequestDispatcher;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the login.jsp page
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/AdminLogin.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String user_name = request.getParameter("username");
        String passkey = request.getParameter("pswrd");
        HttpSession session = request.getSession();
        jakarta.servlet.RequestDispatcher dispatcher = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/credit_card_system?useSSL=false", "root", "root");
            java.sql.PreparedStatement pst = con.prepareStatement("select * from adminlogin where user_name = ? and passkey = ?");
            pst.setString(1, user_name);
            pst.setString(2, passkey);
            
            java.sql.ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
                session.setAttribute("name", rs.getString("user_name"));
                // Redirect to AdminOrderServlet
                response.sendRedirect(request.getContextPath() + "/Admin");
            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("WEB-INF/views/AdminLogin.jsp");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}