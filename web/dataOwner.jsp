<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Data Owner Registration</title>
        <link rel="stylesheet" href="styles.css">
        <style>
            /* Basic styling for the registration page */
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                background: #f0f8ff;
                color: #333;
                margin: 0;
                padding: 0;
            }

            .container {
                width: 90%;
                max-width: 600px;
                margin: 2rem auto;
                padding: 2rem;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                margin-bottom: 1rem;
                color: #333;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                margin-bottom: 0.5rem;
                font-weight: bold;
                color: #333;
            }

            input[type="text"], input[type="email"], input[type="password"], input[type="tel"], textarea {
                padding: 0.75rem;
                margin-bottom: 1rem;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 1rem;
                transition: border-color 0.3s;
            }

            input:focus, textarea:focus {
                border-color: #ff9800;
                outline: none;
            }

            textarea {
                resize: vertical;
                min-height: 100px;
            }

            button {
                padding: 0.75rem;
                background-color: rgba(52, 73, 94, 1);
                border: none;
                color: #fff;
                border-radius: 4px;
                cursor: pointer;
                font-size: 1rem;
                transition: background-color 0.3s;
                margin: 0.5rem 0;
            }

            button:hover {
                background: #333;
            }

            .btn-container {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .login-link {
                text-align: center;
                margin-top: 1rem;
            }

            .login-link a {
                color: rgba(52, 73, 94, 1);
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
            <h1>Data Owner Registration</h1>
            <form action="RegisterDataOwner" method="post">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required aria-required="true" autocomplete="off">

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required aria-required="true" autocomplete="off">

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required aria-required="true" autocomplete="off">

                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required pattern="[0-9]{10}" title="Phone number should be 10 digits" aria-required="true">

                <label for="address">Address:</label>
                <textarea id="address" name="address" required aria-required="true"></textarea>

                <button type="submit" value="submit">Register</button>
            </form>

            <!-- Link to login page -->
            <div class="login-link">
                <p>Already have an account? <a href="ownerLogin.jsp">Login here</a></p>
                <p>Back to <a href="index.html">Home</a></p>
            </div>
        </div>
    </body>
</html>
