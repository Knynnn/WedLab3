package com.example.hongjsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {

    public boolean registerUser(User user) {
        String sqlCheck = "SELECT id FROM tb_user WHERE id = ?";
        String sqlInsert = "INSERT INTO tb_user (id, name, password, age, role) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmtCheck = conn.prepareStatement(sqlCheck);
             PreparedStatement stmtInsert = conn.prepareStatement(sqlInsert)) {

            stmtCheck.setString(1, user.getId());
            try (ResultSet rs = stmtCheck.executeQuery()) {
                if (rs.next()) {
                    return false; // User ID already exists
                }
            }

            stmtInsert.setString(1, user.getId());
            stmtInsert.setString(2, user.getName());
            stmtInsert.setString(3, user.getPassword());
            stmtInsert.setInt(4, user.getAge());
            stmtInsert.setString(5, user.getRole());
            stmtInsert.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User loginUser(String id, String password) {
        String sql = "SELECT * FROM tb_user WHERE id = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, id);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getString("id"));
                    user.setName(rs.getString("name"));
                    user.setPassword(rs.getString("password"));
                    user.setAge(rs.getInt("age"));
                    user.setRole(rs.getString("role"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE tb_user SET name = ?, age = ?, role = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getName());
            stmt.setInt(2, user.getAge());
            stmt.setString(3, user.getRole());
            stmt.setString(4, user.getId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean changePassword(String userId, String newPassword) {
        String sql = "UPDATE tb_user SET password = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, newPassword);
            stmt.setString(2, userId);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getUserById(String userId) {
        String sql = "SELECT * FROM tb_user WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getString("id"));
                    user.setName(rs.getString("name"));
                    user.setPassword(rs.getString("password"));
                    user.setAge(rs.getInt("age"));
                    user.setRole(rs.getString("role"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
