<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="net.credit_card_system.model.UserRegister" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered Users</title>
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
        .suspend-btn, .reactivate-btn {
            padding: 5px 10px;
            margin: 2px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .suspend-btn {
            background-color: #ff6347;
            color: white;
        }
        .reactivate-btn {
            background-color: #4caf50;
            color: white;
        }

        /* Custom Modal Styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            max-width: 400px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        #confirmButton {
            background-color: #800080;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        #confirmButton:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registered Users</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>User Name</th>
                    <th>Passkey</th>
                    <th>Passkey1</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<UserRegister> users = (List<UserRegister>) request.getAttribute("users");
                    for (UserRegister user : users) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getUsername() %></td>
                    <td><%= user.getPswrd() %></td>
                    <td><%= user.getPswrd1() %></td>
                    <td><%= user.isSuspended() ? "Suspended" : "Active" %></td>
                    <td>
                        <% if (user.isSuspended()) { %>
                            <form action="ReactivateUser" method="post" style="display:inline;" onsubmit="return confirmReactivate(event, <%= user.getId() %>)">
                                <input type="hidden" name="userId" value="<%= user.getId() %>">
                                <button type="submit" class="reactivate-btn">Reactivate</button>
                            </form>
                        <% } else { %>
                            <form action="SuspendUser" method="post" style="display:inline;" onsubmit="return confirmSuspend(event, <%= user.getId() %>)">
                                <input type="hidden" name="userId" value="<%= user.getId() %>">
                                <button type="submit" class="suspend-btn">Suspend</button>
                            </form>
                        <% } %>
                    </td>
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

    <!-- Custom Modal Dialog Box -->
    <div id="customAlert" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p id="alertMessage"></p>
            <button id="confirmButton">OK</button>
        </div>
    </div>

    <script type="text/javascript">
        function showCustomAlert(message) {
            var modal = document.getElementById("customAlert");
            var span = document.getElementsByClassName("close")[0];
            var confirmButton = document.getElementById("confirmButton");
            var alertMessage = document.getElementById("alertMessage");

            alertMessage.innerText = message;
            modal.style.display = "block";

            span.onclick = function() {
                modal.style.display = "none";
            }

            confirmButton.onclick = function() {
                modal.style.display = "none";
            }

            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        }

        function confirmSuspend(event, userId) {
            event.preventDefault(); // Prevent the form from submitting immediately
            showCustomAlert("Are you sure you want to suspend user with ID " + userId + "?");
            var confirmButton = document.getElementById("confirmButton");
            confirmButton.onclick = function() {
                event.target.submit(); // Submit the form if the user confirms
            }
        }

        function confirmReactivate(event, userId) {
            event.preventDefault(); // Prevent the form from submitting immediately
            showCustomAlert("Are you sure you want to reactivate user with ID " + userId + "?");
            var confirmButton = document.getElementById("confirmButton");
            confirmButton.onclick = function() {
                event.target.submit(); // Submit the form if the user confirms
            }
        }
    </script>
</body>
</html>