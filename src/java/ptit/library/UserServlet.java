/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ptit.library;

import com.google.gson.Gson;
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
import ptit.library.controller.UserValidator;
import ptit.library.model.User;
import ptit.library.model.ValidationResponse;

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
        System.out.println("action = " + action);
       
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
            System.out.println("Xử lý đăng ký");
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String retypePassword = request.getParameter("retypePassword");
            String role = "student";        
            
            ValidationResponse result = UserValidator.validateUser(username, email, password, retypePassword);
            User user = new User(username, password, email, role);

            if (UserDAO.checkAccount(user)) {
                result.setValid(false);
                result.setGlobalMessage("Tài khoản đã tồn tại");
            }

            if (result.isValid()) {
                System.out.println("DONE = " + request.getParameter("done"));

                if (request.getParameter("done") != null 
                        && request.getParameter("done").equals("register") 
                        ) {
                    //RequestDispatcher dispatcher = request.getRequestDispatcher("/Auth.jsp");
                    //dispatcher.forward(request, response);
                    System.out.println("Thực hiện đăng ký");
                    if (UserDAO.insertUser(user) == true) {
                        System.out.println("ĐĂNG KÝ THÀNH CÔNG RỒI MA");
                        response.sendRedirect("./Auth.jsp");
                    } else {
                        result.setGlobalMessage("Mã Sinh Viên và Email không khớp");
                    }
                   
                } 
                Gson gson = new Gson();
                String json = gson.toJson(result);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                out.print(json);
            }
            else {
                Gson gson = new Gson();
                String json = gson.toJson(result);
        
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                
                out.print(json);
            }
            //RequestDispatcher dispatcher = request.getRequestDispatcher("/Auth.jsp");
            //dispatcher.forward(request, response);
        } else if (action.equals("logout")) {
             Cookie[] cookies = request.getCookies();

             // Nếu có cookie
            if (cookies != null) {
                 // Duyệt qua tất cả các cookie và xóa chúng
                for (Cookie cookie : cookies) {
                  cookie.setMaxAge(0);  // Đặt maxAge = 0 để xóa cookie
                    System.out.println(cookie.getName() + " | " + cookie.getValue());
                    cookie.setPath("/");  // Đặt lại path cho cookie (đảm bảo cookie đúng phạm vi)
                    response.addCookie(cookie);  // Thêm cookie đã xóa vào response
                 }
            }
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
