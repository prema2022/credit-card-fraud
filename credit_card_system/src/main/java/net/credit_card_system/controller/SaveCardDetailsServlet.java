package net.credit_card_system.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SaveCardDetails")
public class SaveCardDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String cardNumber = (String) request.getSession().getAttribute("cardNumber");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String cvv = request.getParameter("cvv");
        String expiryDateStr = request.getParameter("expiry_date");
        int userId = Integer.parseInt(request.getParameter("user_id"));

        RequestDispatcher dispatcher = null;
        Connection con = null;

        // Debugging: Print the received parameters
        System.out.println("Received cardNumber: " + cardNumber);
        System.out.println("Received name: " + name);
        System.out.println("Received address: " + address);
        System.out.println("Received cvv: " + cvv);
        System.out.println("Received expiryDate: " + expiryDateStr);
        System.out.println("Received userId: " + userId);

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/credit_card_system?useSSL=false", "root", "root");

            // Parse the expiry date
            java.sql.Date expiryDate = parseExpiryDate(expiryDateStr);

            // Insert valid card details
            String sql = "INSERT INTO valid_cards (card_number, cvv, expiry_date, user_id, name, address) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, cardNumber);
            pst.setString(2, cvv);
            pst.setDate(3, expiryDate);
            pst.setInt(4, userId);
            pst.setString(5, name);
            pst.setString(6, address);

            int row = pst.executeUpdate();

            dispatcher = request.getRequestDispatcher("/WEB-INF/views/Success.jsp");
            if (row > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException | ParseException e) {
            e.printStackTrace();
            dispatcher = request.getRequestDispatcher("/WEB-INF/views/Error.jsp");
            request.setAttribute("status", "error");
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

    // Parse the expiry date
    private java.sql.Date parseExpiryDate(String expiryDateStr) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = sdf.parse(expiryDateStr);
        return new java.sql.Date(utilDate.getTime());
    }
}