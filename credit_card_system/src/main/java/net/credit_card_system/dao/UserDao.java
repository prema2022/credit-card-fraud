package net.credit_card_system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import net.credit_card_system.model.UserRegister;

public class UserDao {
    private Connection connection;

    public UserDao(Connection connection) {
        this.connection = connection;
    }

    public List<UserRegister> getAllUsers() throws SQLException {
        List<UserRegister> users = new ArrayList<>();
        String query = "SELECT * FROM userlogin";
        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                UserRegister user = new UserRegister();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("customer_name"));
                user.setPswrd(rs.getString("paskey"));
                user.setPswrd1(rs.getString("paskey1"));
                user.setSuspended(rs.getBoolean("is_suspended")); // Fetch is_suspended column
                users.add(user);
            }
        }
        return users;
    }
}