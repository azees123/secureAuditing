<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String fileId = request.getParameter("fileId");
    String action = request.getParameter("action");
    String newStatus;

    // Determine the new status based on the action
    if ("accept".equals(action)) {
        newStatus = "accepted"; // Set your desired accepted status
    } else {
        newStatus = "rejected"; // Set your desired rejected status
    }

    // Database connection
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure you have the correct driver
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/secure", "root", "");

        // Update the file upload status
        String sql = "UPDATE fileupload SET status = ? WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, newStatus);
        pstmt.setString(2, fileId);
        pstmt.executeUpdate();

        // Redirect or show a success message
        response.sendRedirect("success.jsp"); // Redirect to a success page or back to file details
    } catch (Exception e) {
        e.printStackTrace();
        // Handle exceptions, maybe redirect to an error page
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>