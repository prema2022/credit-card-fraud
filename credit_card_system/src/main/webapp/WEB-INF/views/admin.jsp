<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal</title>
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
        }body {
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
            width: 100%;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #333333;
            margin-bottom: 20px;
            align-content: center;
        }
        .btn-container {
            margin-top: 20px;
        }
        .btn {
            display: block;
            width: 100%;
            padding: 15px 20px;
            background-color: #800080;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            margin: 10px 0;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #301934;
        }
        table {
            width: 100%;
        }
        table tr {
            display: block;
            margin-bottom: 10px;
        }
        table td {
            display: block;
            width: 90%;
        }
        .thq-img-ratio-16-8 {
  height: 450px;
  width: 350px;
  position: absolute;
  z-index: 1;
  margin-left: 70px;
  margin-top: -250px;
 
  
}
.thq-img-ratio-16-9 {
  height: 450px;
  width: 350px;
  position: absolute;
  z-index: 1;
  margin-left: -1000px;
  margin-top: -250px;
  }

    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <div class="btn-container">
            <table>
                <tr> <td><a href="Admin?action=viewValidCards" class="btn">View Genuine Cards</a> </td> </tr>
                <tr><td><a href="Admin?action=viewInvalidCards" class="btn">View Fraudulent Cards</a> </td></tr>
                <tr><td><a href="Admin?action=viewRegisteredUsers" class="btn">View Registered Users</a> </td> </tr>
                <tr><td><a href="index.jsp" class="btn">Log out</a> </td></tr>
            </table>
        </div>
    </div>
     <div class="features2-image-container">
	 <img alt="feature 1"
        src="css/images/16.png"
        class="features2-image1 thq-img-ratio-16-8" />
      </div>
       <div class="features2-image-container">
	 <img alt="feature 1"
        src="css/images/17.png"
        class="features2-image1 thq-img-ratio-16-9" />
      </div>
      
</body>
</html>