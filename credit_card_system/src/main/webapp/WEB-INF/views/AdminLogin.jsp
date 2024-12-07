<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login Page</title>
    
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
    </style>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    <h1> Admin Login Portal</h1>
    <form action="<%= request.getContextPath() %>/login" method="post">
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
            <p class="register">Not a member?<a href="<%= request.getContextPath() %>/staffregister">Register here!</a></p>

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
    
<script type="text/javascript">
var status = document.getElementById("status").value;
if (status == "failed") {
    swal("Sorry", "Wrong Username or Password", "failed");
}
</script>
</body>
</html>