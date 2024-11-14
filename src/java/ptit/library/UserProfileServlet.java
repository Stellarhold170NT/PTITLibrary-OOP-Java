/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ptit.library;

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
import java.net.URLEncoder;
import ptit.library.controller.UserDAO;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "UserProfileServlet", urlPatterns = {"/EditProfile"})
public class UserProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet UserProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfileServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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

        if (action.equals("change_avatar")) {
            System.out.println("TRY TO CREATE");
            Part filePart = request.getPart("avatar");
            String fileName = filePart.getSubmittedFileName();

            // String uploadPath = "C:\\Users\\Admin\\Documents\\NetBeansProjects\\PTITLibrary\\web\\images\\" + fileName;
//        String relativePath = "images" + "\\" + request.getSession().getAttribute("username")
//                + "\\" + "avatar";
//        String uploadPath = getServletContext().getRealPath("").replace("\\", "\\\\")  + relativePath;
//        
//        System.out.println("REAL PATH = " + getServletContext().getRealPath("") );
            String uploadPath = "C:\\Users\\Admin\\Documents\\NetBeansProjects\\PTITLibrary\\web\\images\\"
                    + request.getSession().getAttribute("username") + "\\avatar";
            System.out.println("DIRrequest.getSession().getAttribute(\"username\")ECTORY: " + uploadPath);
            File foldFile = new File(uploadPath);
            if (!foldFile.exists()) {
                System.out.println("Folder này chưa tồn tại");
                foldFile.mkdirs();
            } else {
                File[] files = foldFile.listFiles();

                for (File f : files) {
                    f.delete();
                }
            }

            try {
                FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + fileName);
                InputStream is = filePart.getInputStream();

                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();

                UserDAO.updateAvatar(request.getSession().getAttribute("username").toString(), "./images/"
                    + request.getSession().getAttribute("username") + "/avatar/" + fileName);
                System.out.println("GHI XONG");

            } catch (IOException e) {
                System.out.println("FILE LOI");
                // ignore
            }

            request.getSession().setAttribute("avatar", "./images/"
                    + request.getSession().getAttribute("username") + "/avatar/" + fileName);

            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                //ignore
            }

            response.sendRedirect("./user.jsp");
        }
        else if (action.equals("reset_avatar")) {
            
            String username = request.getSession().getAttribute("username").toString();
            String gender = request.getSession().getAttribute("gender").toString();
            
            if (gender.equals("Nam")) {
                UserDAO.updateAvatar(username, "./assets/img/avatar.jpg");
                request.getSession().setAttribute("avatar", "./assets/img/avatar.jpg");
            }
            else {
                UserDAO.updateAvatar(username, "./assets/img/avatar_girl.jpg");
                request.getSession().setAttribute("avatar", "./assets/img/avatar_girl.jpg");
            }
            
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                //ignore
            }
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
