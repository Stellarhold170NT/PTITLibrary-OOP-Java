/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library.model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class BookRecord {
    private String student_id;
    private String student_name;
    private String student_avatar;
    private Integer record_id;
    private String borrow_code;
    private Integer book_id;
    private String title;
    private String author;
    private Integer published_year;
    private String borrow_date;
    private String due_date;
    private String status;

    public BookRecord(String student_id, Integer record_id, Integer book_id, String title, String author, Integer published_year, String borrow_date, String status) {
        this.student_id = student_id;
        this.record_id = record_id;
        this.book_id = book_id;
        this.title = title;
        this.author = author;
        this.published_year = published_year;
        this.borrow_date = borrow_date;
        this.status = status;
    }

    public BookRecord(String student_id, String student_name, String student_avatar, Integer record_id, String borrow_code, Integer book_id, String title, String author, Integer published_year, String borrow_date, String due_date, String status) {
        this.student_id = student_id;
        this.student_name = student_name;
        this.student_avatar = student_avatar;
        this.record_id = record_id;
        this.borrow_code = borrow_code;
        this.book_id = book_id;
        this.title = title;
        this.author = author;
        this.published_year = published_year;
        this.borrow_date = borrow_date;
        this.due_date = due_date;
        this.status = status;
    }

    
    
    
    
    

    
}
