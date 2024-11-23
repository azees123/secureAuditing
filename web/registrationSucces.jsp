<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #333;
        }

        h1 {
            color: #4CAF50; /* Green */
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin: 10px 0;
        }

        a {
            color: #2196F3; /* Blue */
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
            color: rgba(33, 150, 243, 0.8);
        }

        /* Optional: Add a subtle box shadow around the body */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            z-index: -1;
        }
    </style>
</head>
<body>
    <h1>Registration Successful</h1>
    <p>Your registration was successful. You can now <a href="ownerLogin.jsp">login here</a>.</p>
    <p>Back to <a href="index.html">Home</a></p>
</body>
</html>
