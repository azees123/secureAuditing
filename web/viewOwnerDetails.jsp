<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.Statement" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Uploaded Files</title>
    <style>
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
        .login-link {
            text-align: center;
            margin-top: 1rem;
        }
        .login-link a {
            color: green;
            text-decoration: none;
            font-weight: bold;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Uploaded Files</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Phone No</th>
                    <th>Address</th>
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
                        String sql = "SELECT id, full_name, email , password, phone, address FROM data_owner";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        if (!rs.isBeforeFirst()) {
                            // No records found
                            out.println("<tr><td colspan='5' style='text-align:center;'>No files uploaded.</td></tr>");
                        } else {
                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String fullName = rs.getString("full_name");
                                String email = rs.getString("email");
                                String password = rs.getString("password");
                                int phone = rs.getInt("phone");
                                String address = rs.getString("address");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= fullName %></td>
                    <td><%= email %></td>
                    <td><%= password %></td>
                    <td><%= phone %></td>
                    <td><%= address %></td>
                </tr>
                <%
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<tr><td colspan='5' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="login-link">
        <p>Back <a href="cloudDashboard.jsp">cloud Dashboard</a></p>
    </div>
</body>
</html>
