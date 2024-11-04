/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ptit.library;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import ptit.library.controller.BookDAO;
import ptit.library.model.Book;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BookSearchServlet", urlPatterns = {"/search"})
public class BookSearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookSearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookSearchServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    String name = cookie.getName();
                    String value = cookie.getValue();
                    System.out.println("Cookie after create: " + name + " " + value);
                }
                
        String keyword = request.getParameter("keyword");
       
        
        List<Book> books = BookDAO.searchBook(keyword);
        
        String filter1 = request.getParameter("filter1");
        String filter2 = request.getParameter("filter2");
        String filter3 = request.getParameter("filter3");
       
        books.sort((b1, b2) -> {
            if (filter1.equals("newest") && !b1.getPublished_year().equals(b2.getPublished_year())) {
                return -b1.getPublished_year().compareTo(b2.getPublished_year());
            }
            
            if (filter2.equals("quantity") && !b1.getCopies_available().equals(b2.getCopies_available())) {
                return -b1.getCopies_available().compareTo(b2.getCopies_available());
            }
            
            
            if (filter3.equals("mostBorrowed")) {
                Integer borrowNum1 = b1.getTotal_copies() - b1.getCopies_available();
                Integer borrowNum2 = b2.getTotal_copies() - b2.getCopies_available();
                if (!borrowNum1.equals(borrowNum2)) {
                    return -borrowNum1.compareTo(borrowNum2);
                }
            }
            
            return b1.getAuthor().compareTo(b2.getAuthor());

            });
        
        PrintWriter out = response.getWriter();
        
        StringBuilder jsonResponse = new StringBuilder("[");
        for (int i = 0; i < books.size(); i++) {
            jsonResponse.append(books.get(i).toString());
            if (i < books.size() - 1) {
                jsonResponse.append(", ");
            }
        }
        jsonResponse.append("]");
        
        response.setContentType("application/json");
        //response.setContentType("text/html;charset=UTF-8");
        out.println(jsonResponse.toString());
        //out.println("Hello PTITLibrary!");
    }   
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
