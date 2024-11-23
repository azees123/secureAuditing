<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.Statement" %>
<%@ page import="java.util.Random" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Data</title>
        <style>
            /* Styling */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                margin: 20px auto;
                padding: 20px;
                width: 90%;
                max-width: 1200px;
                background-color: rgba(255, 255, 255, 0.9);
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            h1 {
                color: #333;
                text-align: center;
                margin-bottom: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid rgba(0, 0, 0, 0.1);
            }
            th, td {
                padding: 12px;
                text-align: left;
                background-color: rgba(255, 255, 255, 0.8);
            }
            th {
                background-color: rgba(0, 128, 0, 0.1);
                color: #333;
            }
            tr:nth-child(even) td {
                background-color: rgba(0, 128, 0, 0.05);
            }
            tr:hover td {
                background-color: rgba(0, 128, 0, 0.1);
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
            <h1>User Data</h1>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String DB_URL = "jdbc:mysql://localhost:3306/secure";
                        String DB_USER = "root";
                        String DB_PASSWORD = "";

                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                            String sql = "SELECT id, full_name, email FROM data_user";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            if (!rs.isBeforeFirst()) {
                                // No records found
                                out.println("<tr><td colspan='4' style='text-align:center;'>No users found.</td></tr>");
                            } else {
                                Random random = new Random();
                                while (rs.next()) {
                                    int id = rs.getInt("id");
                                    String fullName = rs.getString("full_name");
                                    String email = rs.getString("email");
                                    // Generate a 6-character alphanumeric search key
                                    String searchKey = String.format("%06x", random.nextInt(0x1000000));
                    %>
                    <tr>
                        <td><%= id%></td>
                        <td><%= fullName%></td>
                        <td><%= email%></td>
                        <td>
                            <form action="searchFile.jsp" method="get" style="display:inline;">
                                <input type="hidden" name="searchKey" value="<%= searchKey%>">
                                <input type="hidden" name="id" value="<%= id%>"> <!-- Send the id -->
                                <input type="hidden" name="full_names" value="<%= fullName%>"> <!-- Send the full name -->
                                <input type="hidden" name="email" value="<%= email%>"> <!-- Send the email -->
                                <button type="submit">Set Search Key</button>
                            </form>
                        </td>
                    </tr>
                    <%
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<tr><td colspan='4' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
                        } finally {
                            try {
                                if (rs != null) {
                                    rs.close();
                                }
                                if (stmt != null) {
                                    stmt.close();
                                }
                                if (conn != null) {
                                    conn.close();
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
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
