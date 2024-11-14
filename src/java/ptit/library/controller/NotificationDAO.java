/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library.controller;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ptit.library.model.Message;
import ptit.library.model.Notification;

/**
 *
 * @author Admin
 */
public class NotificationDAO {
    private static final String server = "DESKTOP-S2GQGMB\\SQLEXPRESS";
    private static final String user = "sa";
    private static final String password = "1001011010010110";
    private static final String db = "PtitLibrary";
    private static final int port = 1433;
    
    private static final String GET_NOTIFICATION_SQL = "select n.id, n.NotificationType, n.Message, n.icon, n.NotificationDate from notifications n join BorrowRecords r on n.borrowID = r.id\n" +
            "where r.student_id = ?\n" +
            "order by n.NotificationDate desc\n";
    
    
    public static List<Notification> getNoti(String username) {
        SQLServerDataSource ds = configDataSource();
        List<Notification> lst = new ArrayList<>();
        
        try (var con = ds.getConnection()) {
            // do something
            PreparedStatement ps = con.prepareStatement(GET_NOTIFICATION_SQL);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            
            
            while (rs.next()) {
                lst.add(new Notification(rs.getInt("id"),
                rs.getString("NotificationType"),
                rs.getString("Message"),
                rs.getString("icon"),
                new java.util.Date(rs.getDate("NotificationDate").getTime())));
            }
            
            
        } catch (SQLServerException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lst;
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
