<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Credit Card Fraud Detection System</title>
    <style>
    
     @keyframes scroll-x {
		from {
        transform: translateX(0);
        }
        to {
        transform: translateX(calc(-100% - 16px));
        }
        }
      @keyframes scroll-y {
        from {
        transform: translateY(0);
        }

        to {
        transform: translateY(calc(-100% - 16px));
        }
        }
    
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background: #fff;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .container h1 {
            color: #333;
        }
        .login-options {
            margin-top: 20px;
        }
        .login-options a {
            display: inline-block;
            text-decoration: none;
            color: #fff;
            background: #800080;
            padding: 10px 20px;
            margin: 10px;
            border-radius: 5px;
            font-size: 16px;
            transition: background 0.3s;
        }
        .login-options a:hover {
            background: #0056b3;
        }
        
        
        body {
    margin: auto;
    font-family: -apple-system, BlinkMacSystemFont, sans-serif;
    overflow: auto;
    background: linear-gradient(315deg, rgba(101,0,94,1) 3%, rgba(60,132,206,1) 38%, rgba(48,238,226,1) 68%, rgba(255,25,25,1) 98%);
    animation: gradient 15s ease infinite;
    background-size: 400% 400%;
    background-attachment: fixed;
}

@keyframes gradient {
    0% {
        background-position: 0% 0%;
    }
    50% {
        background-position: 100% 100%;
    }
    100% {
        background-position: 0% 0%;
    }
}

.wave {
    background: rgb(255 255 255 / 25%);
    border-radius: 1000% 1000% 0 0;
    position: fixed;
    width: 200%;
    height: 12em;
    animation: wave 10s -3s linear infinite;
    transform: translate3d(0, 0, 0);
    opacity: 0.8;
    bottom: 0;
    left: 0;
    z-index: -1;
}

.wave:nth-of-type(2) {
    bottom: -1.25em;
    animation: wave 18s linear reverse infinite;
    opacity: 0.8;
}

.wave:nth-of-type(3) {
    bottom: -2.5em;
    animation: wave 20s -1s reverse infinite;
    opacity: 0.9;
}

@keyframes wave {
    2% {
        transform: translateX(1);
    }

    25% {
        transform: translateX(-25%);
    }

    50% {
        transform: translateX(-50%);
    }

    75% {
        transform: translateX(-25%);
    }

    100% {
        transform: translateX(1);
    }
}
.thq-img-ratio-16-8 {
  height: 450px;
  width: 350px;
  position: absolute;
  z-index: 1;
  margin-left: 50px;
  margin-top: -200px;
 
  
}
.thq-img-ratio-16-9 {
  height: 450px;
  width: 350px;
  position: absolute;
  z-index: 1;
  margin-left: -1000px;
  margin-top: -200px;
  }

    </style>
</head>
<body>

<div>
     <div class="wave"></div>
     <div class="wave"></div>
     <div class="wave"></div>
  </div>
    <div class="container">
        <h1>Credit Card Fraud Detection System</h1>
        <p>Welcome! Please select your login type:</p>
        <div class="login-options">
            <a href="<%= request.getContextPath() %>/userlogin">User Login</a>
            <a href="<%= request.getContextPath() %>/login">Admin Login</a>
        </div>
    </div>
     <div class="features2-image-container">
	 <img alt="feature 1"
        src="css/images/21.jpg"
        class="features2-image1 thq-img-ratio-16-8" />
      </div>
       <div class="features2-image-container">
	 <img alt="feature 1"
        src="css/images/1.png"
        class="features2-image1 thq-img-ratio-16-9" />
      </div>
    
</body>
</html>
