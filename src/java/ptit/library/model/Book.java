/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library.model;

/**
 *
 * @author Admin
 */
public class Book implements Comparable<Book>{
    private int id;
    private String book_code;
    private String title;
    private String author;
    private Integer published_year;
    private Integer total_copies;
    private Integer copies_available;
    private String publisher;
    
    public Book() {
        
    }

    public Book(int id, String book_code, String title, String author, Integer published_year, Integer total_copies, Integer copies_available, String publisher) {
        this.id = id;
        this.book_code = book_code;
        this.title = title;
        this.author = author;
        this.published_year = published_year;
        this.total_copies = total_copies;
        this.copies_available = copies_available;
        this.publisher = publisher;
    }

    public void setCopies_available(Integer copies_available) {
        this.copies_available = copies_available;
    }

    public Integer getTotal_copies() {
        return total_copies;
    }

    public Integer getCopies_available() {
        return copies_available;
    }

    public Integer getPublished_year() {
        return published_year;
    }

    public String getAuthor() {
        return author;
    }
    
    
    
    

    @Override
    public String toString() {
        return "{\"id\": " + id + ", "
                + "\"book_code\": \"" + book_code + "\", "
                + "\"title\": \"" + title + "\", "
                + "\"author\": \"" + author + "\", "
                + "\"published_year\": " + published_year + ", "
                + "\"total_copies\": " + total_copies + ", "
                + "\"copies_available\": " + copies_available + ", "
                + "\"publisher\": \"" + publisher + "\""
                + "}";
    }

    @Override
    public int compareTo(Book o) {
        return author.compareTo(o.author);
    }
   
    
}
