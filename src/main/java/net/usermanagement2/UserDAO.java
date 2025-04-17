package net.usermanagement2;

import java.sql.*;
import java.util.*;

public class UserDAO {
  
    private String jdbcURL = "jdbc:mysql://localhost:3306/userdb?useSSL=false&serverTimezone=UTC";

    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?)";
    private static final String SELECT_USER_BY_ID = "SELECT id, name, email, country FROM users WHERE id = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id = ?";
    private static final String UPDATE_USERS_SQL = "UPDATE users SET name = ?, email = ?, country = ? WHERE id = ?";

    protected Connection getConnection() throws SQLException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
		
			e.printStackTrace();
		}
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    //insert a user in the db
    public void insertUser(User user) throws SQLException {
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT_USERS_SQL)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getCountry());
            stmt.executeUpdate();
        }
    }
    

    public User selectUser(int id) throws SQLException {
        User user = null;
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(SELECT_USER_BY_ID)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("country"));
            }
        }
        return user;
    }

    public List<User> selectAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("country")));
            }
        }
        return users;
    }

    public boolean deleteUser(int id) throws SQLException {
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE_USERS_SQL)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean updateUser(User user) throws SQLException {
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE_USERS_SQL)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getCountry());
            stmt.setInt(4, user.getId());
            return stmt.executeUpdate() > 0;
        }
    }
}
