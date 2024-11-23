<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Requested File</title>
        <style>
            /* Add your styles here */
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
            button {
                margin-top: 20px;
                padding: 10px 15px;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .accept {
                background-color: #28a745;
                color: #fff;
            }
            .reject {
                background-color: #dc3545;
                color: #fff;
            }
            .download {
                background-color: #007bff; /* Blue color for download button */
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
            <h1>Requested File Details</h1>

            <!-- Retrieve the parameters from the previous page -->
            <%
                String fileId = request.getParameter("fileId");
                String fileName = request.getParameter("fileName");
                String uploadedByFullName = request.getParameter("full_name"); // Corrected name for clarity
                String uploadedAt = request.getParameter("uploaded_at");
                String id = request.getParameter("id");
                String userFullName = request.getParameter("full_names"); // Assuming this is the logged-in user's full name
            %>

            <!-- Table to display requested file details -->
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
                        <td><%= uploadedByFullName%></td> <!-- Displays the uploader's full name -->
                    </tr>
                    <tr>
                        <td>Uploaded At</td>
                        <td><%= uploadedAt%></td>
                    </tr>
                    <tr>
                        <td>User ID</td>
                        <td><%= id%></td>
                    </tr>
                    <tr>
                        <td>User Full Name</td>
                        <td><%= userFullName%></td> <!-- Displays the logged-in user's full name -->
                    </tr>
                </tbody>
            </table>

            <!-- Form to process the request -->
            <form action="processRequest.jsp" method="post">
                <input type="hidden" name="fileId" value="<%= fileId%>">
                <input type="hidden" name="fileName" value="<%= fileName%>">
                <input type="hidden" name="uploadedByFullName" value="<%= uploadedByFullName%>">
                <input type="hidden" name="uploadedAt" value="<%= uploadedAt%>">
                <input type="hidden" name="id" value="<%= id%>">
                <input type="hidden" name="full_names" value="<%= userFullName%>"> <!-- Changed name -->

                <!-- Accept and Reject buttons -->
                <button type="submit" name="action" value="accept" class="accept">Accept</button>
                <button type="submit" name="action" value="reject" class="reject">Reject</button>
            </form>

            <!-- Form to process the request for download -->
            <form action="viewDownload.jsp" method="post">
                <input type="hidden" name="fileId" value="<%= fileId%>">
                <input type="hidden" name="fileName" value="<%= fileName%>">
                <input type="hidden" name="full_names" value="<%= userFullName%>">
                <input type="hidden" name="uploadedAt" value="<%= uploadedAt%>">

                <!-- Download button -->
                <button type="submit" class="download">Owner Download File</button>
            </form>

            <!-- Form to process the request for download -->
            <form action="downloadUserFiles.jsp" method="post">
                <input type="hidden" name="fileId" value="<%= fileId%>">
                <input type="hidden" name="fileName" value="<%= fileName%>">
                <input type="hidden" name="uploadedByFullName" value="<%= uploadedByFullName%>">
                <input type="hidden" name="uploadedAt" value="<%= uploadedAt%>">

                <!-- Download button -->
                <button type="submit" class="download">User Download File</button>
            </form>
        </div>

        <div class="register-link">
            <p>Back to <a href="ownerDashboard.jsp">Owner Dashboard</a></p>
        </div>
    </body>
</html>
