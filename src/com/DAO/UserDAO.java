package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.User.UserDetails;

public class UserDAO {
    private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean addUser(UserDetails userDetails) {
        boolean added = false;
        String query = "INSERT INTO user (name, email, password) VALUES (?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, userDetails.getName());
            ps.setString(2, userDetails.getEmail());
            ps.setString(3, userDetails.getPassword());

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                added = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception as needed
        }

        return added;
    }
    
    public UserDetails loginUser(UserDetails us) {
        UserDetails user = null;
        
        try {
            String query = "SELECT * FROM user WHERE email=? AND password=?";
            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, us.getEmail());
                ps.setString(2, us.getPassword());
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        user = new UserDetails();
                        user.setId(rs.getInt("id"));
                        user.setName(rs.getString("name"));
                        user.setEmail(rs.getString("email"));
                        user.setPassword(rs.getString("password"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return user;
    }

    // Optionally add other CRUD methods here

    // Ensure to close any open resources here if necessary
}
