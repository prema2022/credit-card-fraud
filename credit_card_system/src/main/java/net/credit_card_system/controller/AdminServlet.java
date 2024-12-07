package net.credit_card_system.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import net.credit_card_system.dao.ViewCardDao;
import net.credit_card_system.dao.UserDao;
import net.credit_card_system.model.CardDetails;
import net.credit_card_system.model.UserRegister;

@WebServlet("/Admin")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            // Forward the request to admin.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin.jsp");
            dispatcher.forward(request, response);
            return;
        }

        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/credit_card_system?useSSL=false", "root", "root");

            ViewCardDao cardDAO = new ViewCardDao(con);
            UserDao userDAO = new UserDao(con);

            if ("viewValidCards".equals(action)) {
                List<CardDetails> validCards = cardDAO.getValidCards();
                request.setAttribute("validCards", validCards);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/validCards.jsp");
                dispatcher.forward(request, response);
            } else if ("viewInvalidCards".equals(action)) {
                List<CardDetails> invalidCards = cardDAO.getInvalidCards();
                request.setAttribute("invalidCards", invalidCards);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/invalidCards.jsp");
                dispatcher.forward(request, response);
            } else if ("viewRegisteredUsers".equals(action)) {
                List<UserRegister> users = userDAO.getAllUsers();
                request.setAttribute("users", users);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/registeredUsers.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Invalid action");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}