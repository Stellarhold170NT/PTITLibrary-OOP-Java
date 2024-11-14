/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library.controller;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ptit.library.model.BookRecord;

/**
 *
 * @author Admin
 */
public class BorrowRecordDAO {
    private static final String server = "DESKTOP-S2GQGMB\\SQLEXPRESS";
    private static final String user = "sa";
    private static final String password = "1001011010010110";
    private static final String db = "PtitLibrary";
    private static final int port = 1433;
    
    private static String GET_RECORD_USER_SQL = "select\n" +
        "	st.full_name, r.student_id, u.avatar, r.id as record_id, b.id as book_id, b.title, b.author, b.published_year, r.borrow_date, r.status, r.borrow_code, r.due_date\n" +
        "from books b join BorrowRecords r\n" +
        "	on b.id = r.book_id\n" +
            "join Students st on st.student_code = r.student_id\n"+
            "join Users u on u.username = r.student_id\n" +
        "where r.student_id = ?\n" +
        "order by borrow_date desc";
    
    private static String LEND_BOOK_SQL = "Update BorrowRecords set status = N'Đang mượn' WHERE borrow_code = ? ";
    private static String RETURN_BOOK_SQL = "Update BorrowRecords set status = N'Đã trả' WHERE borrow_code = ? ";
    
    private static final String UPDATE_BOOK_SQL = "update books\n" +
                        "set copies_available += 1\n" +
                        "where id = ?";
    
    private static final String GENERATE_NOTIFICATION_SQL = "EXEC GenerateNotification @borrowID = ?, @NotificationType = ?";
    
    public static List<BookRecord> getRecord(String username){
        List<BookRecord> lst = new ArrayList<>();
        SQLServerDataSource ds = configDataSource();
        
        try (var con = ds.getConnection()) {
            PreparedStatement ps = con.prepareStatement(GET_RECORD_USER_SQL);
            ps.setString(1, username);

            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                    lst.add(new BookRecord(rs.getString("student_id")
                        , rs.getString("full_name")
                        , rs.getString("avatar")
                        , rs.getInt("record_id")
                        , rs.getString("borrow_code")
                        , rs.getInt("book_id")
                        , rs.getString("title")
                        , rs.getString("author")
                        , rs.getInt("published_year")
                     
                        , new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date(rs.getDate("borrow_date").getTime()))
                        , new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date(rs.getDate("due_date").getTime()))
                        , rs.getString("status")));
                
                
            }
            
        } catch (SQLServerException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lst;
    }
    
    public static void lendBook(String borrow_code, int record_id) {
        SQLServerDataSource ds = configDataSource();
        
        try (var con = ds.getConnection()) {
            con.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
            con.setAutoCommit(false);
            
            PreparedStatement ps = con.prepareStatement(LEND_BOOK_SQL);
            ps.setString(1, borrow_code);

            ps.executeUpdate();
            
            PreparedStatement ps2 = con.prepareStatement(GENERATE_NOTIFICATION_SQL);
            ps2.setInt(1, record_id);
            ps2.setString(2, "Mượn tài liệu thành công");
            
            ps2.execute();
            
            con.commit();
            
        } catch (SQLServerException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void returnBook(String borrow_code, int book_id, int record_id) {
        SQLServerDataSource ds = configDataSource();
        
        try (var con = ds.getConnection()) {
            con.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
            con.setAutoCommit(false);
            
            PreparedStatement ps = con.prepareStatement(RETURN_BOOK_SQL);
            ps.setString(1, borrow_code);
            ps.executeUpdate();
            
            PreparedStatement ps2 = con.prepareStatement(UPDATE_BOOK_SQL);
            ps2.setInt(1, book_id);
            ps2.executeUpdate();
            
            
            PreparedStatement ps3 = con.prepareStatement(GENERATE_NOTIFICATION_SQL);
            ps3.setInt(1, record_id);
            ps3.setString(2, "Trả sách thành công");
            
            ps3.execute();
            
            con.commit();

            ps.executeUpdate();
            
        } catch (SQLServerException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
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
