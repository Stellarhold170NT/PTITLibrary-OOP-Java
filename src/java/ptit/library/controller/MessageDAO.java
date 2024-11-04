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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ptit.library.model.BookRecord;
import ptit.library.model.Message;
import ptit.library.controller.BookDAO;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;


/**
 *
 * @author Admin
 */


public class MessageDAO {
    private static final String server = "DESKTOP-S2GQGMB\\SQLEXPRESS";
    private static final String user = "sa";
    private static final String password = "1001011010010110";
    private static final String db = "PtitLibrary";
    private static final int port = 1433;
    
    private static final String INSERT_MESSAGE_SQL = "insert into messages(senderid, receiverid, content)\n" +
            "values (?, ?, ?)";
    
    private static final String GET_LASTEST_MESSAGE_SEND_TO_SQL = "EXEC GetLastestMessageSendTo ?";
    private static final String GET_LASTEST_MESSAGE_USER_SEND_SQL = "EXEC GetLastestMessageUserSend ?";
    private static final String GET_LASTEST_MESSAGE_FROM_STRANGER_SQL = "EXEC GetLastestMessageFromStranger ?";
    
    private static final String GET_MESSAGE_BETWEEN_USERS_SQL = "SELECT * FROM messages\n" +
            "WHERE (\n" +
            "	(SenderID = ? AND ReceiverID = ?)\n" +
            "	OR (SenderID = ? and ReceiverID = ?)\n" +
            ")\n" +
            "AND isDeleted = 0";
    
    public static String getLastestMessageUserSend(String username) {
        SQLServerDataSource ds = configDataSource();
        
        Message msg = null;
        
        try (var con = ds.getConnection()) {
            // do something
            PreparedStatement ps = con.prepareStatement(GET_LASTEST_MESSAGE_USER_SEND_SQL);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                msg = new Message(rs.getInt("id"),
                rs.getString("SenderID"),
                rs.getString("ReceiverID"),
                rs.getString("content"),
                rs.getInt("isDeleted"),
                rs.getInt("is_read"),
                new java.util.Date(rs.getDate("Timestamp").getTime()));
            }
            
        } catch (SQLServerException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Gson gson = new Gson();
        
        return gson.toJson(msg);
    }
    
    public static List<Message> getMessageBetweenUsers(String username1, String username2) {
        SQLServerDataSource ds = configDataSource();
        
        List<Message> lst = new ArrayList<>();
        
        try (var con = ds.getConnection()) {
            // do something
            PreparedStatement ps = con.prepareStatement(GET_MESSAGE_BETWEEN_USERS_SQL);
            ps.setString(1, username1);            
            ps.setString(2, username2);
            ps.setString(3, username2);
            ps.setString(4, username1);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                lst.add(new Message(rs.getInt("id"),
                rs.getString("SenderID"),
                rs.getString("ReceiverID"),
                rs.getString("content"),
                rs.getInt("isDeleted"),
                rs.getInt("is_read"),
                new java.util.Date(rs.getDate("Timestamp").getTime())));
            }
            
            Collections.sort(lst);
        
            
        } catch (SQLServerException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Collections.sort(lst);
        return lst;
    }
         
    
    
    public static void insertMessage(String senderId, String receiverId, String content) {
         SQLServerDataSource ds = configDataSource();
        System.out.println(senderId + "insert message " + receiverId + " content = " + content);
        
        try (var con = ds.getConnection()) {
            // do something
            PreparedStatement ps = con.prepareStatement(INSERT_MESSAGE_SQL);
            
            ps.setString(1, senderId);
            ps.setString(2, receiverId);
            ps.setString(3, content);
            
            // cần kiểm tra thêm gửi tin nhắn có đúng không
            ps.execute();
            
            
        } catch (SQLServerException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static List<Message> getLastestMessageInbox(String username) {
        SQLServerDataSource ds = configDataSource();
        
        List<Message> lst = new ArrayList<>();
        
        try (var con = ds.getConnection()) {
            // do something
            PreparedStatement ps = con.prepareStatement(GET_LASTEST_MESSAGE_SEND_TO_SQL);
            ps.setString(1, username);
            
            ResultSet rs = ps.executeQuery();
            List<Message> lst1 = new ArrayList<>();
            
            while (rs.next()) {
                lst1.add(new Message(rs.getInt("id"),
                rs.getString("SenderID"),
                rs.getString("ReceiverID"),
                rs.getString("content"),
                rs.getInt("isDeleted"),
                rs.getInt("is_read"),
                new java.util.Date(rs.getDate("Timestamp").getTime())));
            }
            
            PreparedStatement ps2 = con.prepareStatement(GET_LASTEST_MESSAGE_USER_SEND_SQL);
            ps2.setString(1, username);
            
             ResultSet rs2 = ps2.executeQuery();
            List<Message> lst2 = new ArrayList<>();
            
            while (rs2.next()) {
                Message msg = new Message(rs2.getInt("id"),
                rs2.getString("SenderID"),
                rs2.getString("ReceiverID"),
                rs2.getString("content"),
                rs2.getInt("isDeleted"),
                rs2.getInt("is_read"),
                new java.util.Date(rs2.getDate("Timestamp").getTime()));
                lst2.add(msg);
            }
            
            for (Message msg : lst1) {
                boolean flag = false;
              
                for (Message msg2 : lst2) {
                    if (msg.getReceiverID().equals(msg2.getSenderID()) && msg.getSenderID().equals(msg2.getReceiverID())) {
                        Long a = msg.getTimestamp().getTime();
                        Long b = msg2.getTimestamp().getTime();
                        
                        if (a.compareTo(b) < 0) {
                            flag = true;
                            msg2.setType(2);
                            lst.add(msg2);
                        }
                    }
                }
                
                if (!flag) {
                    msg.setType(1);
                    lst.add(msg);
                }
            }
            
            
            for (Message msg : lst2) {
                boolean flag = false;
              
                for (Message msg2 : lst1) {
                    if (msg.getReceiverID().equals(msg2.getSenderID()) && msg.getSenderID().equals(msg2.getReceiverID())) {
                        flag = true;
                    }
                }
                
                if (!flag) {
                    msg.setType(2);
                    lst.add(msg);
                }
            }
        
            
        } catch (SQLServerException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Collections.sort(lst);
        return lst;
    }
    
    public static List<Message> getLastestMessageUnread(String username) {
        SQLServerDataSource ds = configDataSource();
        
        List<Message> lst = new ArrayList<>();
        
        try (var con = ds.getConnection()) {
            // do something
            PreparedStatement ps = con.prepareStatement(GET_LASTEST_MESSAGE_FROM_STRANGER_SQL);
            ps.setString(1, username);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                lst.add(new Message(rs.getInt("id"),
                rs.getString("SenderID"),
                rs.getString("ReceiverID"),
                rs.getString("content"),
                rs.getInt("isDeleted"),
                rs.getInt("is_read"),
                new java.util.Date(rs.getDate("Timestamp").getTime())));
            }
            
        } catch (SQLServerException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Collections.sort(lst);
        
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
