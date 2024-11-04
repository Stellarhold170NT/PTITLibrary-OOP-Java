/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ptit.library;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ptit.library.controller.UserDAO;
import ptit.library.model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/user"})
public class UserServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet UserServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
                  //

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
        
        System.out.println("User servlet called");
        
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();
        
       
        if (action.equals("login")) {
            
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            
             

            User user = new User(username, password);
            
         
            
            if (UserDAO.checkUser(user)) {
                HttpSession session = request.getSession();
                
                UserDAO.setUpSession(session, username);
               
                System.out.println("New session: " + session.getAttribute("username"));
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    String name = cookie.getName();
                    String value = cookie.getValue();
                    System.out.println("Cookie first create: " + name + " " + value);
                }
                     
                
                //RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                //dispatcher.forward(request, response);
                response.sendRedirect("./home.jsp");
                
            } else {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet UserServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet UserServlet FAILED at " + request.getContextPath() + "</h1>");
                out.println("</body>");
                out.println("</html>");
               
            }
                 
            
        }
        else if (action.equals("register")) {
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String role = "student";
            User user = new User(username, password, email, role);
            
            if (UserDAO.insertUser(user) == true) {
                //RequestDispatcher dispatcher = request.getRequestDispatcher("/Auth.jsp");
                //dispatcher.forward(request, response);
                System.out.println("ĐĂNG KÝ THÀNH CÔNG RỒI MA");
                response.sendRedirect("./Auth.jsp");
            }
            else {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet UserServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
            //RequestDispatcher dispatcher = request.getRequestDispatcher("/Auth.jsp");
            //dispatcher.forward(request, response);
        } else if (action.equals("logout")) {
            request.getSession().invalidate();
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
