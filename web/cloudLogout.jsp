<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the current session
    if (session != null) {
        session.invalidate();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
        }
        .logout-message {
            font-size: 20px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="logout-message">
        You have successfully logged out. Redirecting to login page...
    </div>
    
    <script>
        // Redirect to login page after a few seconds
        setTimeout(function() {
            window.location.href = 'cloudLogin.jsp'; // Change this to your login page
        }, 2000); // 2 seconds delay
    </script>
</body>
</html>
