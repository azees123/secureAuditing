<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement, java.sql.Timestamp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Search Results</title>
        <style>
            /* Base styles */
            body {
                font-family: 'Helvetica Neue', Arial, sans-serif;
                background-color: #f0f2f5;
                margin: 0;
                padding: 0;
                color: #333; /* Default text color */
            }
            .container {
                margin: 40px auto;
                padding: 30px;
                width: 90%;
                max-width: 1200px;
                background-color: rgba(255, 255, 255, 0.95);
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s; /* Smooth hover effect */
            }
            .container:hover {
                transform: scale(1.01); /* Slight scale effect on hover */
            }
            h1 {
                color: #2c3e50;
                text-align: center;
                margin-bottom: 20px;
                font-size: 2.5em; /* Increased font size */
                text-transform: uppercase; /* Uppercase for emphasis */
            }
            h2 {
                color: #34495e;
                margin-top: 20px;
                font-size: 1.8em; /* Increased font size */
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px; /* Spacing above the table */
            }
            table, th, td {
                border: 1px solid rgba(0, 0, 0, 0.1);
            }
            th, td {
                padding: 15px;
                text-align: left;
                background-color: rgba(255, 255, 255, 0.9);
            }
            th {
                background-color: #28a745; /* Header background color */
                color: #fff; /* Changed text color for contrast */
                font-weight: bold; /* Bold headers */
            }
            tr:nth-child(even) td {
                background-color: rgba(0, 128, 0, 0.05);
            }
            tr:hover td {
                background-color: rgba(0, 128, 0, 0.1);
                cursor: pointer; /* Change cursor on hover */
            }
            form {
                display: inline; /* Align button next to input */
            }
            input[type="text"] {
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 5px;
                width: calc(60% - 24px); /* Responsive width */
                margin-right: 10px; /* Space between input and button */
                transition: border-color 0.3s; /* Smooth border transition */
            }
            input[type="text"]:focus {
                border-color: #28a745; /* Border color on focus */
                outline: none; /* Remove default outline */
            }
            button {
                background-color: #28a745; /* Button color */
                color: white;
                border: none;
                padding: 12px 20px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s, transform 0.2s; /* Smooth color transition */
            }
            button:hover {
                background-color: #218838; /* Darker shade on hover */
                transform: translateY(-2px); /* Lift effect on hover */
            }
            @media (max-width: 768px) {
                .container {
                    padding: 20px; /* Adjust padding for smaller screens */
                }
                h1 {
                    font-size: 2em; /* Smaller heading on mobile */
                }
                h2 {
                    font-size: 1.5em; /* Smaller subheading on mobile */
                }
                input[type="text"] {
                    width: 100%; /* Full width on mobile */
                    margin-bottom: 10px; /* Spacing below the input */
                }
                button {
                    width: 100%; /* Full width button on mobile */
                }
            }

            .register-link {
                text-align: center;
                margin-top: 1rem;
            }

            .register-link a {
                color: rgba(52, 73, 94, 1);
                text-decoration: none;
                font-weight: bold;
            }

            .register-link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Search Files</h1>

            <!-- Retrieve the variables -->
            <%
                String searchKey = request.getParameter("searchKey") != null ? (String) request.getParameter("searchKey") : "";
                String id = request.getParameter("id") != null ? (String) request.getParameter("id") : "";
                String fullName = request.getParameter("full_names") != null ? (String) request.getParameter("full_names") : "";
                String email = request.getParameter("email") != null ? (String) request.getParameter("email") : "";
            %>

            <!-- Form to search for files -->
            <form action="searchFile.jsp" method="get">
                <label for="fileKeyword">File Keyword:</label>
                <input type="text" id="fileKeyword" name="fileKeyword" required>
                <input type="hidden" name="searchKey" value="<%= searchKey%>">
                <input type="hidden" name="id" value="<%= id%>"> <!-- Send the id -->
                <input type="hidden" name="full_names" value="<%= fullName%>"> <!-- Send the full name -->
                <input type="hidden" name="email" value="<%= email%>"> <!-- Send the email -->
                <button type="submit">Search</button>
            </form>

            <h2>Results</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>File Name</th>
                        <th>Uploaded By</th>
                        <th>Uploaded At</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String DB_URL = "jdbc:mysql://localhost:3306/secure";
                        String DB_USER = "root";
                        String DB_PASSWORD = "";

                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                            // Query to search for files based on a keyword
                            String fileKeyword = request.getParameter("fileKeyword");
                            String sql = "SELECT id, file_name, full_name, uploaded_at FROM fileupload WHERE file_name LIKE ?";
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, "%" + fileKeyword + "%");
                            rs = pstmt.executeQuery();

                            if (!rs.isBeforeFirst()) {
                                out.println("<tr><td colspan='5' style='text-align:center;'>No files found.</td></tr>");
                            } else {
                                while (rs.next()) {
                                    int fileId = rs.getInt("id");
                                    String fileName = rs.getString("file_name");
                                    String uploaderFullName = rs.getString("full_name");
                                    Timestamp uploadedAt = rs.getTimestamp("uploaded_at");
                    %>
                    <tr>
                        <td><%= fileId%></td>
                        <td><%= fileName%></td>
                        <td><%= uploaderFullName%></td>
                        <td><%= uploadedAt%></td>
                        <td>
                            <!-- Send file upload info to requestedFile.jsp -->
                            <form action="requestedFile.jsp" method="post">
                                <input type="hidden" name="fileId" value="<%= fileId%>">
                                <input type="hidden" name="fileName" value="<%= fileName%>">
                                <input type="hidden" name="full_name" value="<%= uploaderFullName%>">
                                <input type="hidden" name="uploaded_at" value="<%= uploadedAt%>">
                                <input type="hidden" name="fileKeyword" value="<%= request.getParameter("fileKeyword")%>"> <!-- Include fileKeyword -->
                                <input type="hidden" name="id" value="<%= id%>"> <!-- Include id -->
                                <input type="hidden" name="full_names" value="<%= fullName%>"> <!-- Include full_name -->
                                <button type="submit">Request</button>
                            </form>
                        </td>
                    </tr>
                    <%
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<tr><td colspan='5' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
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
                    %>
                </tbody>
            </table>
        </div>

        <div class="register-link">
            <p>Back to <a href="userDashboard.jsp">User Dashboard</a></p>
        </div>
    </body>
</html>
