/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LuckyCharm
 */
@MultipartConfig
public class FileUpload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     private static final Logger LOGGER = Logger.getLogger(FileUpload.class.getName());
    private static final String DB_URL = "jdbc:mysql://localhost:3306/secure";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = (String) request.getSession().getAttribute("fullName");
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        InputStream fileContent = filePart.getInputStream();
        String decryptKey = request.getParameter("decryptKey");
        String query = request.getParameter("query");

        // Validate inputs (you can add more validation as necessary)
        if (fileName == null || fileName.isEmpty()) {
            response.sendRedirect("fileUpload.jsp?error=FileNameEmpty");
            return;
        }

        // Check file size limit (e.g., 5MB)
        if (filePart.getSize() > 5 * 1024 * 1024) { // 5MB limit
            response.sendRedirect("fileUpload.jsp?error=FileSizeExceeded");
            return;
        }

        boolean isUploaded = false;

        // Store file in the database along with full_name
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement("INSERT INTO fileupload (file_name, file_data, full_name, decrypt_key, query) VALUES (?, ?, ?, ?, ?)")) {

            ps.setString(1, fileName);
            ps.setBlob(2, fileContent);
            ps.setString(3, fullName);
            ps.setString(4, decryptKey);
            ps.setString(5, query);
            ps.executeUpdate();
            isUploaded = true; // Set flag to true if upload succeeds
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "File upload failed: ", e);
            isUploaded = false; // Set flag to false if upload fails
        }

        // Redirect based on the upload result
        if (isUploaded) {
            response.sendRedirect("ownerDashboard.jsp?uploadSuccess=true");
        } else {
            response.sendRedirect("fileUpload.jsp?error=FileUploadFailed");
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
