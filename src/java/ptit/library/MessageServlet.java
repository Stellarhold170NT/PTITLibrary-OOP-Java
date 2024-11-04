/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ptit.library;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import ptit.library.controller.MessageDAO;
import ptit.library.controller.UserDAO;
import ptit.library.model.Message;
import ptit.library.model.User;

/**
 *
 * @author Admin
 * 
 */
@MultipartConfig
@WebServlet(name = "MessageServlet", urlPatterns = {"/message"})
public class MessageServlet extends HttpServlet {

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
            out.println("<title>Servlet MessageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MessageServlet at " + request.getContextPath() + "</h1>");
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
        
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        
        PrintWriter out = response.getWriter();
        
        if (action.equals("inbox")) {
            List<Message> lst = MessageDAO.getLastestMessageInbox(username);
            Gson gson = new Gson();
            
            String jsonResponse = gson.toJson(lst);
            
            response.setContentType("application/json");
            out.println(jsonResponse.toString());
        }
        else if (action.equals("unread")) {
            List<Message> lst = MessageDAO.getLastestMessageUnread(username);
            Gson gson = new Gson();
            
            String jsonResponse = gson.toJson(lst);
            
            response.setContentType("application/json");
            out.println(jsonResponse.toString());
        }
        else if (action.equals("get_user")) {
            User user = UserDAO.getUser(username);
             Gson gson = new Gson();

            String jsonResponse = gson.toJson(user);
            
            System.out.println("RESPONSE = " + jsonResponse);
            response.setContentType("application/json");
            out.println(jsonResponse.toString());

        }
        else if (action.equals("load_message")) {
            String username1 = request.getParameter("username1");
            String username2 = request.getParameter("username2");
            System.out.println(username1 + " -> " + username2);
            
            List<Message> lst = MessageDAO.getMessageBetweenUsers(username1, username2);
            
            Gson gson = new Gson();

            String jsonResponse = gson.toJson(lst);
            response.setContentType("application/json");
            System.out.println(jsonResponse);
            out.println(jsonResponse.toString());
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
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();

        if (action.equals("upload_img_message")) {
            System.out.println("upload_img_message");
            String savePath = "C:\\Users\\Admin\\Documents\\NetBeansProjects\\PTITLibrary\\web\\images\\"
                    + request.getSession().getAttribute("username") + "\\message";
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
              fileSaveDir.mkdir();  // Tạo thư mục nếu chưa tồn tại
            }

            List<String> imagePaths = new ArrayList<>();
            
            for (Part part : request.getParts()) {
                if (part.getName().equals("images")) {
                    String fileName = part.getSubmittedFileName();
                    fileName = fileName.replaceAll("\\s+", "");
                    FileOutputStream fos = new FileOutputStream(savePath + "\\" + fileName);
                    InputStream is = part.getInputStream();

                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                    fos.close();
                    
                    imagePaths.add("./images/"
                    + request.getSession().getAttribute("username") + "/message/" + fileName);
                }
            }
            Gson gson = new Gson();

            String jsonResponse = gson.toJson(imagePaths);
            response.setContentType("application/json");
            System.out.println("image path = " + jsonResponse);
            
            out.println(jsonResponse.toString());
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
