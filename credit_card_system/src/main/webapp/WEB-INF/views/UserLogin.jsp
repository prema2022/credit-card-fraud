<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    
    <style type="text/css">
    @charset "ISO-8859-1";
    body {
        font-family: sans-serif; 
        background-color: #E6E6FA; /* Light purple background */
        color: #333;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 30px 10px;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    form {
        width: 35rem;
        margin: auto;
        color: #333;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px 25px;
    }

    input[type=text], input[type=password] {
        width: 100%;
        margin: 10px 0;
        border-radius: 5px;
        padding: 15px 18px;
        box-sizing: border-box;
        border: 2px solid #ddd;
    }

    button {
        background-color: #800080; /* Orange color */
        color: white;
        padding: 14px 20px;
        border-radius: 5px;
        margin: 7px 0;
        width: 100%;
        font-size: 18px;
        border: none;
    }

    button:hover {
        background-color: #301934; /* Darker orange on hover */
        cursor: pointer;
    }

    .headingsContainer {
        text-align: center;
    }

    .headingsContainer p {
        color: #555;
    }

    .mainContainer {
        padding: 16px;
    }

    .subcontainer {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }

    .subcontainer a {
        font-size: 16px;
        margin-bottom: 12px;
        color: #ff6347;
    }

    span.forgotpsd a {
        float: right;
        color: #800080;
        padding-top: 16px;
    }

    .forgotpsd a {
        color: #800080;
    }

    .forgotpsd a:link {
        text-decoration: none;
    }

    .register {
        color: #333;
        text-align: center;
    }

    .register a {
        color: #800080;
    }

    .register a:link {
        text-decoration: none;
    }

    .error-message {
        color: red;
        text-align: center;
        margin-top: 10px;
    }
    .thq-img-ratio-16-8 {
  height: 450px;
  width: 350px;
  position: absolute;
  z-index: 1;
  margin-left: -450px;
  margin-top: -500px;
 
  
}
.thq-img-ratio-16-9 {
  height: 450px;
  width: 350px;
  position: absolute;
  z-index: 1;
  margin-left: 650px;
  margin-top: -500px;
  }

    /* Media queries for the responsiveness of the page */
    @media screen and (max-width: 600px) {
        form {
            width: 25rem;
        }
    }

    @media screen and (max-width: 400px) {
        form {
            width: 20rem;
        }
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
    </style>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    <h1>User Login Portal</h1>
    <form action="<%= request.getContextPath() %>/userlogin" method="post">
        <!-- Headings for the form -->
        <div class="headingsContainer">
            <h3>Sign in</h3>
            <p>Sign in with your username and password</p>
        </div>

        <!-- Main container for all inputs -->
        <div class="mainContainer">
            <!-- Username -->
            <label for="username">Your username</label>
            <input type="text" placeholder="Enter Username" name="username" required>

            <br><br>

            <!-- Password -->
            <label for="pswrd">Your password</label>
            <input type="password" placeholder="Enter Password" name="pswrd" required>

            <!-- sub container for the checkbox and forgot password link -->
            <div class="subcontainer">
                <label>
                  <input type="checkbox" checked="checked" name="remember"> Remember me
                </label>
                <p class="forgotpsd"> <a href="#">Forgot Password?</a></p>
            </div>

            <!-- Submit button -->
            <button type="submit">Login</button>

            <!-- Sign up link -->
            <p class="register">Not a member?<a href="<%= request.getContextPath() %>/Userregister">Register here!</a></p>

        </div>
        <div class="features2-image-container">
	 <img alt="feature 1"
        src="css/images/11.png"
        class="features2-image1 thq-img-ratio-16-8" />
      </div>
       <div class="features2-image-container">
	 <img alt="feature 1"
        src="css/images/13.png"
        class="features2-image1 thq-img-ratio-16-9" />
      </div>
      

    </form>
    
    <%
        String status = (String) request.getAttribute("status");
        if ("failed".equals(status)) {
    %>
        <div class="error-message">Wrong Username or Password</div>
    <%
        } else if ("suspended".equals(status)) {
    %>
        <div class="error-message">Your account is suspended. Please contact the administrator.</div>
    <%
        }
    %>

    <!-- Custom Modal Dialog Box -->
    <div id="customAlert" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p id="alertMessage"></p>
        </div>
    </div>
 	
    <script type="text/javascript">
        window.onload = function() {
            var status = document.getElementById("status").value;
            var modal = document.getElementById("customAlert");
            var span = document.getElementsByClassName("close")[0];
            var alertMessage = document.getElementById("alertMessage");

            if (status === "success") {
                alertMessage.innerText = "Login successful!";
                modal.style.display = "block";
            } else if (status === "failed") {
                alertMessage.innerText = "Incorrect username or password.";
                modal.style.display = "block";
            } else if (status === "suspended") {
                alertMessage.innerText = "Your account has been suspended. Please contact the administrator.";
                modal.style.display = "block";
            }

            span.onclick = function() {
                modal.style.display = "none";
            }

            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        };
    </script>
</body>
</html>