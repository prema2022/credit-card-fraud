<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Card Validation</title>
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
        label {
            font-size: 14px;
            color: #555555;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #800080;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background-color: #0056b3;
        }
        p {
            text-align: center;
            margin-top: 20px;
        }
        a {
            text-decoration: none;
            color: #4caf50;
        }
        a:hover {
            text-decoration: underline;
        }
        .error {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
        .thq-img-ratio-16-8 {
  height: 500px;
  width: 400px;
  position: absolute;
  z-index: 1;
  margin-left: 50px;
  margin-top: -800px;
 
  
}
.thq-img-ratio-16-9 {
  height: 500px;
  width: 400px;
  position: absolute;
  z-index: 1;
  margin-left: 1100px;
  margin-top: -800px;
  }
    </style>
</head>
<body>
    <div class="container">
        <h1>Validate Your Card</h1>
        <form action="<%= request.getContextPath() %>/CardValidation" method="post" onsubmit="return validateForm()">
            <label for="card_number">Card Number:</label>
            <input type="text" id="card_number" name="card_number" required onblur="validateCardNumber()">
            <div class="error" id="card_number_error"></div>

            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv" required onblur="validateCVV()">
            <div class="error" id="cvv_error"></div>

            <label for="expiry_date">Expiry Date (yyyy-MM-dd):</label>
            <input type="text" id="expiry_date" name="expiry_date" required onblur="validateExpiryDate()">
            <div class="error" id="expiry_date_error"></div>

            <label for="bank_name">Bank Name:</label>
            <input type="text" id="bank_name" name="bank_name" required onblur="validateBankName()">
            <div class="error" id="bank_name_error"></div>

            <label for="branch">Branch:</label>
            <input type="text" id="branch" name="branch" required onblur="validateBranch()">
            <div class="error" id="branch_error"></div>

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required onblur="validateUsername()">
            <div class="error" id="username_error"></div>

            <label for="cardholder_name">Cardholder Name:</label>
            <input type="text" id="cardholder_name" name="cardholder_name" required onblur="validateCardholderName()">
            <div class="error" id="cardholder_name_error"></div>

            <button type="submit">Validate</button>
            <p><a href="<%= request.getContextPath() %>/index.jsp">Back to Home</a></p>
        </form>
    </div>
     <div class="features2-image-container">
	 <img alt="feature 1"
        src="css/images/9.png"
        class="features2-image1 thq-img-ratio-16-8" />
      </div>
      <div class="features2-image-container">
	 <img alt="feature 1"
        src="css/images/9.png"
        class="features2-image1 thq-img-ratio-16-9" />
      </div>
      <script type="text/javascript">
    function validateCardNumber() {
        var cardNumber = document.getElementById("card_number").value;
        var errorDiv = document.getElementById("card_number_error");
        if (!/^\d{16}$/.test(cardNumber)) {
            errorDiv.innerText = "Card number must be 16 digits.";
            console.log("Card number validation failed");
            return false;
        } else {
            errorDiv.innerText = "";
            console.log("Card number validation passed");
            return true;
        }
    }

    function validateCVV() {
        var cvv = document.getElementById("cvv").value;
        var errorDiv = document.getElementById("cvv_error");
        if (!/^\d{3}$/.test(cvv)) {
            errorDiv.innerText = "CVV must be 3 digits.";
            console.log("CVV validation failed");
            return false;
        } else {
            errorDiv.innerText = "";
            console.log("CVV validation passed");
            return true;
        }
    }

    function validateExpiryDate() {
        var expiryDate = document.getElementById("expiry_date").value;
        var errorDiv = document.getElementById("expiry_date_error");
        var datePattern = /^\d{4}-\d{2}-\d{2}$/;
        if (!datePattern.test(expiryDate)) {
            errorDiv.innerText = "Expiry date must be in yyyy-MM-dd format.";
            console.log("Expiry date validation failed");
            return false;
        } else {
            errorDiv.innerText = "";
            console.log("Expiry date validation passed");
            return true;
        }
    }

    function validateBankName() {
        var bankName = document.getElementById("bank_name").value;
        var errorDiv = document.getElementById("bank_name_error");
        if (bankName.trim() === "") {
            errorDiv.innerText = "Bank name is required.";
            console.log("Bank name validation failed");
            return false;
        } else {
            errorDiv.innerText = "";
            console.log("Bank name validation passed");
            return true;
        }
    }

    function validateBranch() {
        var branch = document.getElementById("branch").value;
        var errorDiv = document.getElementById("branch_error");
        if (branch.trim() === "") {
            errorDiv.innerText = "Branch is required.";
            console.log("Branch validation failed");
            return false;
        } else {
            errorDiv.innerText = "";
            console.log("Branch validation passed");
            return true;
        }
    }

    function validateUsername() {
        var username = document.getElementById("username").value;
        var errorDiv = document.getElementById("username_error");
        if (username.trim() === "") {
            errorDiv.innerText = "Username is required.";
            console.log("Username validation failed");
            return false;
        } else {
            errorDiv.innerText = "";
            console.log("Username validation passed");
            return true;
        }
    }

    function validateCardholderName() {
        var cardholderName = document.getElementById("cardholder_name").value;
        var errorDiv = document.getElementById("cardholder_name_error");
        if (cardholderName.trim() === "") {
            errorDiv.innerText = "Cardholder name is required.";
            console.log("Cardholder name validation failed");
            return false;
        } else {
            errorDiv.innerText = "";
            console.log("Cardholder name validation passed");
            return true;
        }
    }

    function validateForm() {
        console.log("Validating form...");
        var isValid = true;

        isValid = validateCardNumber() && isValid;
        isValid = validateCVV() && isValid;
        isValid = validateExpiryDate() && isValid;
        isValid = validateBankName() && isValid;
        isValid = validateBranch() && isValid;
        isValid = validateUsername() && isValid;
        isValid = validateCardholderName() && isValid;

        console.log("Form validation result: " + isValid);
        return isValid;
    }
</script>

</body>
</html>