<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 500px;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #ff0000;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            color: #555555;
        }
        .btn-container {
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4caf50;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            margin: 5px;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Error</h1>
        <p>An error occurred while processing your request.</p>
        <div class="btn-container">
            <a href="<%= request.getContextPath() %>/index.jsp" class="btn">Back to Home</a>
        </div>
    </div>
</body>
</html>