package net.credit_card_system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import net.credit_card_system.model.CardDetails;

public class CardDAO {
    private Connection connection;

    public CardDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean isValidCard(String cardNumber) {
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

    public void saveValidCard(CardDetails card) throws SQLException, ParseException {
        String query = "INSERT INTO valid_cards (card_number, cvv, expiry_date, bank_name, branch, username, cardholder_name) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, card.getCardNumber());
        ps.setString(2, card.getCvv());
        ps.setDate(3, parseExpiryDate(card.getExpiryDate()));
        ps.setString(4, card.getBankName());
        ps.setString(5, card.getBranch());
        ps.setString(6, card.getUsername());
        ps.setString(7, card.getCardholderName());
        ps.executeUpdate();
    }

    public void saveInvalidCard(CardDetails card, String reason) throws SQLException, ParseException {
        String query = "INSERT INTO invalid_cards (card_number, cvv, expiry_date, bank_name, branch, username, cardholder_name, reason) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, card.getCardNumber());
        ps.setString(2, card.getCvv());
        ps.setDate(3, parseExpiryDate(card.getExpiryDate()));
        ps.setString(4, card.getBankName());
        ps.setString(5, card.getBranch());
        ps.setString(6, card.getUsername());
        ps.setString(7, card.getCardholderName());
        ps.setString(8, reason);
        ps.executeUpdate();
    }

    private java.sql.Date parseExpiryDate(String expiryDateStr) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = sdf.parse(expiryDateStr);
        return new java.sql.Date(utilDate.getTime());
    }
}