/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library.controller;


import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import ptit.library.model.Book;
import ptit.library.model.BookRecord;

/**
 *
 * @author Admin
 */
public class BookDAO {
    private static final String server = "DESKTOP-S2GQGMB\\SQLEXPRESS";
    private static final String user = "sa";
    private static final String password = "1001011010010110";
    private static final String db = "PtitLibrary";
    private static final int port = 1433;
    
    private static final int SORT_BY_PUBLISH_YEAR = 1;
    private static final int SORT_BY_NUMBER = 2;
    private static final int SORT_BY_MOST_BORROWED = 3;
    
    private static final String SEARCH_BOOK_BY_TITLE ="SELECT * FROM Books WHERE LOWER(title) LIKE LOWER(?)";
    private static final String SEARCH_BOOK_BY_AUTHOR = "SELECT * FROM Books WHERE LOWER(author) LIKE LOWER(%?%)";
    private static final String SEARCH_BOOK_BY_KEYWORD = 
            "SELECT * FROM Books "
            + "WHERE LOWER(title) LIKE LOWER(?) "
            + "OR LOWER(author) LIKE LOWER(?)";
    // borrow here
    private static final String BORROW_BOOK_SQL = "";
    
    // unborrow here
    private static final String RETURN_BOOK_SQL = "";
    
    private static final String UPDATE_BOOK_SQL = "update books\n" +
                        "set copies_available -= 1\n" +
                        "where id = ?";
        
    private static final String INSERT_BORROW_RECORDS_SQL = "insert into BorrowRecords(student_id, book_id, borrow_date, status)\n" +
                "values (?, ?, ?, N'Đang chờ')";
   
    
    private static final String GET_BORROW_RECORDS_SQL = "select\n" +
        "	r.student_id, r.id as record_id, b.id as book_id, b.title, b.author, b.published_year, r.borrow_date, r.status\n" +
        "from books b join BorrowRecords r\n" +
        "	on b.id = r.book_id\n" +
        "where r.student_id = ?";
    
    public static List<Book> searchBook(String keyword){
        List<Book> books = new ArrayList<>();
        
        SQLServerDataSource ds = configDataSource();
        
        try (var con = ds.getConnection()) {
            PreparedStatement ps = con.prepareStatement(SEARCH_BOOK_BY_KEYWORD);
            ps.setString(1, "%" + keyword + "%");            
            ps.setString(2, "%" + keyword + "%");

            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String book_code = rs.getString("book_code");
                String title = rs.getString("title");
                String author = rs.getString("author");
                int published_year = rs.getInt("published_year");
                int total_copies = rs.getInt("total_copies");
                int copies_available = rs.getInt("copies_available");
                String publisher = rs.getString("publisher");
                Book book = new Book(id, book_code, title, author, published_year, 
                        total_copies, copies_available, publisher);
                books.add(book);
            }
            
        } catch (SQLServerException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Collections.sort(books);
        return books;
    }
     
    // borrow code here
    public static void borrowBook(String username, int[] bookIds) {
        SQLServerDataSource ds = configDataSource();
        
        LocalDate today = LocalDate.now();
        DateTimeFormatter formater = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String todayString = today.format(formater);
        
        List<Integer> bookFailed = new ArrayList<>();
        
        try (var con = ds.getConnection()) {
            con.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
            con.setAutoCommit(false);

            for (int i = 0; i < bookIds.length; i++) {
                
                PreparedStatement ps = con.prepareStatement(UPDATE_BOOK_SQL);
                PreparedStatement ps2 = con.prepareStatement(INSERT_BORROW_RECORDS_SQL);
                ps.setInt(1, bookIds[i]);
                
                ps2.setString(1, username);
                ps2.setInt(2, bookIds[i]);
                ps2.setString(3, todayString);
                
                if (ps.executeUpdate() > 0) {
                    ps2.execute();
                }
                else {
                    bookFailed.add(bookIds[i]);
                }
                
                con.commit();
                
            }
            
        } catch (SQLServerException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // return book here
    public static void ReturnBook(Book book) {
//        synchronized
            
    }
    
    public static List<BookRecord> getRecord(String userId) {
        SQLServerDataSource ds = configDataSource();
        
        List<BookRecord> lst = new ArrayList<>();
        
        try (var con = ds.getConnection()) {
            // do something
            PreparedStatement ps = con.prepareStatement(GET_BORROW_RECORDS_SQL);
            ps.setString(1, userId);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                BookRecord b = new BookRecord(rs.getString("student_id")
                        , rs.getInt("record_id")
                        , rs.getInt("book_id")
                        , rs.getString("title")
                        , rs.getString("author")
                        , rs.getInt("published_year")
                        
                        , new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date(rs.getDate("borrow_date").getTime()))
                        , rs.getString("status"));
                lst.add(b);
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
