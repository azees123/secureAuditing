<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>File Upload</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
        <style>
            body {
                background-color: rgba(240, 240, 240, 0.9); /* Light gray with transparency */
                font-family: Arial, sans-serif;
            }

            .ui.container {
                margin-top: 50px;
                padding: 20px;
                background-color: rgba(255, 255, 255, 0.95); /* White with transparency */
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            h2.ui.header {
                color: rgba(76, 175, 80, 1); /* Green color */
                margin-bottom: 20px;
            }

            .ui.segment {
                background-color: rgba(230, 230, 230, 0.8); /* Light gray for preview */
                border: 1px solid rgba(0, 0, 0, 0.1);
                padding: 10px;
                border-radius: 5px;
                max-height: 200px; /* Limit height for large files */
                overflow-y: auto; /* Enable scrolling for large content */
            }

            .ui.button {
                background-color: rgba(76, 175, 80, 1); /* Green for the upload button */
                color: white;
            }

            .ui.button:hover {
                background-color: rgba(76, 175, 80, 0.8); /* Darker green on hover */
            }

            .field label {
                color: rgba(0, 0, 0, 0.7); /* Darker gray for labels */
            }

            input[type="text"], input[type="file"] {
                border: 1px solid rgba(0, 0, 0, 0.2);
                border-radius: 4px;
                padding: 8px;
                margin-top: 5px;
            }

            input[type="text"]:focus {
                border-color: rgba(76, 175, 80, 1); /* Green border on focus */
                outline: none;
            }

            button {
                padding: 0.75rem;
                background-color: rgba(76, 175, 80, 1); /* Green for the upload button */
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 1rem;
                transition: background-color 0.3s;
                margin: 0.5rem 0;
                width: 100%; /* Make buttons full width */
                height: 45px; /* Set a consistent height */
            }

            button:hover {
                background: rgba(76, 175, 80, 0.8);
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
        <script>
            function previewFile() {
                const file = document.getElementById('file').files[0];
                const preview = document.getElementById('preview');

                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        // Get file content
                        let content = e.target.result;

                        // Filter out non-alphanumeric characters (keeping space)
                        content = content.replace(/[^a-zA-Z0-9\s]/g, '');

                        // Display the filtered text content of the file
                        preview.textContent = content.trim() || "No alphanumeric content found";
                    };
                    reader.readAsText(file);
                } else {
                    preview.textContent = "No file chosen";
                }
            }

            function generateKey() {
                // Generate a random key
                const key = Math.random().toString(36).substr(2, 8); // Example key: 8 alphanumeric characters

                // Set the key value to the input field
                document.getElementById('decryptKey').value = key;
            }

        </script>
    </head>
    <body>
        <div class="ui centered grid">
            <div class="eight wide column">
                <div class="ui container">
                    <h2 class="ui header">File Upload</h2>

                    <form class="ui form" method="POST" enctype="multipart/form-data" action="FileUpload">
                        <!-- Query Label and Input -->
                        <div class="field">
                            <label for="query">Query</label>
                            <input type="text" id="query" name="query" placeholder="Enter your query" required>
                        </div>

                        <!-- File Select -->
                        <div class="field">
                            <label for="file">Select File</label>
                            <input type="file" id="file" name="file" accept=".txt,.pdf,.docx" required onchange="previewFile()">
                        </div>

                        <!-- Preview -->
                        <div class="field">
                            <label>Preview</label>
                            <div class="ui segment" id="preview">No file chosen</div>
                        </div>

                        <div class="field">
                            <label for="decryptKey">Decrypt Key:</label>
                            <input type="text" id="decryptKey" name="decryptKey" readonly>
                        </div>

                        <div class="field">
                            <button type="button" onclick="generateKey()">Generate Decrypt Key</button>
                        </div>

                        <!-- Upload Button on a new line -->
                        <div class="field" style="margin-top: 1rem;">
                            <button type="submit" class="ui primary button">Upload</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="register-link">
            <p>Back to <a href="ownerDashboard.jsp">Owner Dashboard</a></p>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
    </body>
</html>
