/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library.controller;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import com.sun.jdi.connect.spi.Connection;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import ptit.library.model.User;

/**
 *
 * @author Admin
 */
public class UserDAO {
    private static final String server = "DESKTOP-S2GQGMB\\SQLEXPRESS";
    private static final String user = "sa";
    private static final String password = "1001011010010110";
    private static final String db = "PtitLibrary";
    private static final int port = 1433;
    
    private static final String INSERT_USER_SQL = 
            "insert into users(username, password, email, role)\n" +
            "values(?,?,?,?)";
    private static final String CHECK_USER_SQL =
            "select *\n" +
            "from users\n" +
            "where username = ? and password = ?";
    
    private static final String SELECT_USER_SQL = "select * from users join students on username = student_code\n" +
                "where username = ?";
    
    private static final String UPDATE_AVATAR_SQL = "update users set avatar=? where username=?";
    
    private static final String GET_USER_SQL = "select * from users join students on username = student_code\n" +
            "where username = ?";
    
    public static User getUser(String username) {
        SQLServerDataSource ds = configDataSource();
        
        User user = new User(username);
        
        try (var connnection = ds.getConnection()) {
            PreparedStatement ps = connnection.prepareStatement(GET_USER_SQL);
            ps.setString(1, username);
            
           ResultSet rs = ps.executeQuery();
           if (rs.next()) {
               user.setUsername(rs.getString("username"));
               user.setName(rs.getString("full_name"));
               user.setAvatar(rs.getString("avatar"));
           }
           
            
        } catch(SQLServerException e) {
            e.printStackTrace();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        System.out.println(user.getUsername() + " | " + user.getName());
        return user;
    }
    
    public static boolean insertUser(User user) {
        SQLServerDataSource ds = configDataSource();
        
        try (var connnection = ds.getConnection()) {
            PreparedStatement ps = connnection.prepareStatement(INSERT_USER_SQL);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getRole());
            
           
            
            if ( ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
            
            
        } catch(SQLServerException e) {
            e.printStackTrace();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean checkUser(User user) {
        SQLServerDataSource ds = configDataSource();
        
        try (var connnection = ds.getConnection()) {
            PreparedStatement ps = connnection.prepareStatement(CHECK_USER_SQL);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println("YES");
                return true;
            } else {
                // login failed
                System.out.println("NO");
                       
                return false;
            }
            
            
        } catch(SQLServerException e) {
            e.printStackTrace();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void setUpSession(HttpSession session, String username) {
        SQLServerDataSource ds = configDataSource();
        
        try (var connnection = ds.getConnection()) {
            PreparedStatement ps = connnection.prepareStatement(SELECT_USER_SQL);
            ps.setString(1, username);
            
            ResultSet rs = ps.executeQuery();
           
            if (rs.next()) {
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("full_name", rs.getString("full_name"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("gender", rs.getString("gender"));
                session.setAttribute("avatar", rs.getString("avatar"));
                
                System.out.println("SQL SERVER AVATAR: " + session.getAttribute("avatar"));
            }
            
        } catch(SQLServerException e) {
            e.printStackTrace();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void updateAvatar(String username, String path) {
        SQLServerDataSource ds = configDataSource();
        
        try (var connnection = ds.getConnection()) {
            PreparedStatement ps = connnection.prepareStatement(UPDATE_AVATAR_SQL);
            ps.setString(1, path);
            ps.setString(2, username);
            
            ps.executeUpdate();
            
        } catch(SQLServerException e) {
            e.printStackTrace();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }
    
    private static SQLServerDataSource configDataSource() {
        SQLServerDataSource ds = new SQLServerDataSource();
        ds.setUser(user);
        ds.setPassword(password);
        ds.setServerName(server);
        ds.setEncrypt(false);
        ds.setTrustServerCertificate(true);
        ds.setDatabaseName(db);
        ds.setPortNumber(port);
        return ds;
    }
}
