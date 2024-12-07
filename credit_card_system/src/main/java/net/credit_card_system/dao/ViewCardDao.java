package net.credit_card_system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.credit_card_system.model.CardDetails;

public class ViewCardDao {
    private Connection connection;

    public ViewCardDao(Connection connection) {
        this.connection = connection;
    }

    public List<CardDetails> getValidCards() throws SQLException {
        List<CardDetails> cards = new ArrayList<>();
        String query = "SELECT * FROM valid_cards";
        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                CardDetails card = new CardDetails();
                card.setCardNumber(rs.getString("card_number"));
                card.setCvv(rs.getString("cvv"));
                card.setExpiryDate(rs.getString("expiry_date"));
                card.setBankName(rs.getString("bank_name"));
                card.setBranch(rs.getString("branch"));
                card.setUsername(rs.getString("username"));
                card.setCardholderName(rs.getString("cardholder_name"));
                cards.add(card);
            }
        }
        return cards;
    }

    public List<CardDetails> getInvalidCards() throws SQLException {
        List<CardDetails> cards = new ArrayList<>();
        String query = "SELECT * FROM invalid_cards";
        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                CardDetails card = new CardDetails();
                card.setCardNumber(rs.getString("card_number"));
                card.setCvv(rs.getString("cvv"));
                card.setExpiryDate(rs.getString("expiry_date"));
                card.setBankName(rs.getString("bank_name"));
                card.setBranch(rs.getString("branch"));
                card.setUsername(rs.getString("username"));
                card.setCardholderName(rs.getString("cardholder_name"));
                cards.add(card);
            }
        }
        return cards;
    }
}