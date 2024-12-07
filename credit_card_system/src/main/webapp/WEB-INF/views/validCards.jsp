<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="net.credit_card_system.model.CardDetails" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Valid Cards</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f8;
            margin: 0;
            padding: 0;
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
	background-size: 400% 400%;
	animation: gradient 15s ease infinite;
	height: 100vh;
        }
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
            max-width: 1200px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #800080;
            color: white;
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
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Valid Cards</h1>
        <table>
            <thead>
                <tr>
                    <th>Card Number</th>
                    <th>CVV</th>
                    <th>Expiry Date</th>
                    <th>Bank Name</th>
                    <th>Branch</th>
                    <th>Username</th>
                    <th>Cardholder Name</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<CardDetails> validCards = (List<CardDetails>) request.getAttribute("validCards");
                    for (CardDetails card : validCards) {
                %>
                <tr>
                    <td><%= card.getCardNumber() %></td>
                    <td><%= card.getCvv() %></td>
                    <td><%= card.getExpiryDate() %></td>
                    <td><%= card.getBankName() %></td>
                    <td><%= card.getBranch() %></td>
                    <td><%= card.getUsername() %></td>
                    <td><%= card.getCardholderName() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div class="btn-container">
            <a href="index.jsp" class="btn">Back to Home</a>
        </div>
    </div>
</body>
</html>