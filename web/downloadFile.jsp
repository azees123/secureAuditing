<%@ page import="java.io.File,java.io.FileInputStream,java.io.OutputStream,java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<%@ page contentType="application/octet-stream" language="java" %>
<%
    String fileId = request.getParameter("fileId");
    String fileName = "";
    String filePath = "";

    // Code to fetch file name and file path from the database based on fileId
    String DB_URL = "jdbc:mysql://localhost:3306/secure";
    String DB_USER = "root";
    String DB_PASSWORD = "";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        String sql = "SELECT file_name, file_path FROM fileupload WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(fileId));
        rs = pstmt.executeQuery();

        if (rs.next()) {
            fileName = rs.getString("file_name");
            filePath = rs.getString("file_path");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) {
            rs.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    File file = new File(filePath);
    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
    response.setContentLength((int) file.length());

    FileInputStream inStream = new FileInputStream(file);
    OutputStream outStream = response.getOutputStream();

    byte[] buffer = new byte[4096];
    int bytesRead = -1;
    while ((bytesRead = inStream.read(buffer)) != -1) {
        outStream.write(buffer, 0, bytesRead);
    }
    inStream.close();
    outStream.flush();
%>
