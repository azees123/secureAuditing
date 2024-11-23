<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>

<%
    // Retrieve parameters from the request
    String fileId = request.getParameter("fileId");
    String fileName = request.getParameter("fileName");
    String uploadedByFullName = request.getParameter("uploadedByFullName");
    String uploadedAt = request.getParameter("uploadedAt");
%>

<html>
    <head>
        <title>File Details</title>
        <style>
            body {
                font-family: 'Helvetica Neue', Arial, sans-serif;
                background-color: #f0f2f5;
                color: #333;
            }
            .container {
                margin: 40px auto;
                padding: 30px;
                width: 90%;
                max-width: 800px;
                background-color: rgba(255, 255, 255, 0.95);
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                padding: 12px;
                border: 1px solid rgba(0, 0, 0, 0.1);
                text-align: left;
                background-color: rgba(255, 255, 255, 0.9);
            }
            th {
                background-color: #28a745;
                color: #fff;
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
            <h1>Downloaded File Details</h1>

            <!-- Table to display the parameters -->
            <table>
                <thead>
                    <tr>
                        <th>Field</th>
                        <th>Value</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>File ID</td>
                        <td><%= fileId%></td>
                    </tr>
                    <tr>
                        <td>File Name</td>
                        <td><%= fileName%></td>
                    </tr>
                    <tr>
                        <td>Uploaded By</td>
                        <td><%= uploadedByFullName%></td>
                    </tr>
                    <tr>
                        <td>Uploaded At</td>
                        <td><%= uploadedAt%></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="register-link">
            <p>Back to <a href="userDashboard.jsp">User Dashboard</a></p>
        </div>
    </body>
</html>
