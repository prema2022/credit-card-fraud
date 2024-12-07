package net.credit_card_system.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import net.credit_card_system.dao.CardDAO;
import net.credit_card_system.model.CardDetails;

@WebServlet("/CardValidation")
public class CardValidationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/cardform.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String cardNumber = request.getParameter("card_number");
        String cvv = request.getParameter("cvv");
        String expiryDateStr = request.getParameter("expiry_date");
        String bankName = request.getParameter("bank_name");
        String branch = request.getParameter("branch");
        String username = request.getParameter("username");
        String cardholderName = request.getParameter("cardholder_name");

        RequestDispatcher dispatcher = null;
        Connection con = null;

        try {
            boolean isValid = isValidCard(cardNumber);

            request.getSession().setAttribute("cardNumber", cardNumber);
            request.getSession().setAttribute("cvv", cvv);
            request.getSession().setAttribute("expiryDate", expiryDateStr);
            request.getSession().setAttribute("bankName", bankName);
            request.getSession().setAttribute("branch", branch);
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("cardholderName", cardholderName);
            request.getSession().setAttribute("isValid", isValid);

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/credit_card_system?useSSL=false", "root", "root");

            CardDetails card = new CardDetails();
            card.setCardNumber(cardNumber);
            card.setCvv(cvv);
            card.setExpiryDate(expiryDateStr);
            card.setBankName(bankName);
            card.setBranch(branch);
            card.setUsername(username);
            card.setCardholderName(cardholderName);

            CardDAO cardDAO = new CardDAO(con);

            if (isValid) {
                cardDAO.saveValidCard(card);
                dispatcher = request.getRequestDispatcher("/WEB-INF/views/cardetails.jsp");
            } else {
                cardDAO.saveInvalidCard(card, "Invalid card number (Luhn algorithm failed)");
                dispatcher = request.getRequestDispatcher("/WEB-INF/views/invalidcardresult.jsp");
                request.setAttribute("status", "invalid");
            }

            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException | ParseException e) {
            e.printStackTrace();
            System.err.println("Error occurred: " + e.getMessage());
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
                System.err.println("Error closing connection: " + e.getMessage());
            }
        }
    }

    private boolean isValidCard(String cardNumber) {
        int nDigits = cardNumber.length();
        int sum = 0;
        boolean isSecond = false;

        for (int i = nDigits - 1; i >= 0; i--) {
            int d = cardNumber.charAt(i) - '0';

            if (isSecond)
                d = d * 2;

            sum += d / 10;
            sum += d % 10;

            isSecond = !isSecond;
        }
        return (sum % 10 == 0);
    }
}