<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Card Details</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f8;
            margin: 0;
            padding: 0;
        }
        body {
	background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
	background-size: 400% 400%;
	animation: gradient 15s ease infinite;
	height: 100vh;
}

@keyframes gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}
        
        .container {
            max-width: 500px;
            margin: 50px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }
        .card-details {
            font-size: 14px;
            color: #555555;
            line-height: 1.6;
        }
        .card-details strong {
            color: #000000;
        }
        .btn-container {
            margin-top: 20px;
            text-align: center;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #800080;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            margin: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .validation-status {
            text-align: center;
            font-size: 18px;
            color: #ff0000;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Card Validation Result</h1>
        <div class="validation-status">
            <% if (request.getSession().getAttribute("isValid") != null && (boolean) request.getSession().getAttribute("isValid")) { %>
                This card is not a fraudulent card.
            <% } else { %>
                This card is a fraudulent card.
            <% } %>
        </div>
        <div class="card-details">
            <p><strong>Card Number:</strong> <%= request.getSession().getAttribute("cardNumber") %></p>
            <p><strong>CVV:</strong> <%= request.getSession().getAttribute("cvv") %></p>
            <p><strong>Expiry Date:</strong> <%= request.getSession().getAttribute("expiryDate") %></p>
            <p><strong>Bank Name:</strong> <%= request.getSession().getAttribute("bankName") %></p>
            <p><strong>Branch:</strong> <%= request.getSession().getAttribute("branch") %></p>
            <p><strong>Username:</strong> <%= request.getSession().getAttribute("username") %></p>
            <p><strong>Cardholder Name:</strong> <%= request.getSession().getAttribute("cardholderName") %></p>
        </div>
        <div class="btn-container">
            <a href="<%= request.getContextPath() %>/CardValidation" class="btn">Validate Another Card</a>
            <a href="<%= request.getContextPath() %>/index.jsp" class="btn">Back to Home</a>
            <button onclick="window.print()" class="btn">Print this page</button>
        </div>
    </div>
</body>
</html>