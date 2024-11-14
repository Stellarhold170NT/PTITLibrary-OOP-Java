/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ptit.library;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import ptit.library.controller.BookDAO;
import ptit.library.controller.BorrowRecordDAO;
import ptit.library.controller.UserDAO;
import ptit.library.model.BookRecord;
import ptit.library.model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BookRecordServlet", urlPatterns = {"/record"})
public class BookRecordServlet extends HttpServlet {

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
            out.println("<title>Servlet BookRecordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookRecordServlet at " + request.getContextPath() + "</h1>");
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
        String userId = (String)request.getParameter("username");
        List<BookRecord> lst = BorrowRecordDAO.getRecord(userId);
        
        if (lst.isEmpty()) {
            User user = UserDAO.getUser(userId);
            List<User> lstUser = new ArrayList<>();
            lstUser.add(user);
            Gson gson = new Gson();
            String json = gson.toJson(lstUser);
        
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
        
            PrintWriter out = response.getWriter();
            out.print(json);
        } else {
            Gson gson = new Gson();
            String json = gson.toJson(lst);
        
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
        
            PrintWriter out = response.getWriter();
            out.print(json);
        }
         
        
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
        String action = (String)request.getParameter("action");
        PrintWriter out = response.getWriter();
        
        if (action.equals("lend")) {
            String borrow_id = request.getParameter("borrow_id");
            int borrow_id_num = Integer.parseInt(request.getParameter("borrow_id_num"));
            
            System.out.println("LEND BOOK " + borrow_id + " | " + borrow_id_num);
            BorrowRecordDAO.lendBook(borrow_id, borrow_id_num);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print("{\"status\": \"DONE\"}");  // Trả về phản hồi JSON hợp lệ

        }
        else if (action.equals("return")) {
            String borrow_id = request.getParameter("borrow_id");           
            Integer book_id = Integer.parseInt(request.getParameter("book_id"));
            int borrow_id_num = Integer.parseInt(request.getParameter("borrow_id_num"));

            BorrowRecordDAO.returnBook(borrow_id, book_id, borrow_id_num);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print("{\"status\": \"DONE\"}");  // Trả về phản hồi JSON hợp lệ

        }
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
