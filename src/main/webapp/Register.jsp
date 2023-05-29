<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="icon" type="image/x-icon" href="img/logo.png">
<meta charset="UTF-8">
<title>New User Registration</title>
<%@include file="component/common_css_js.jsp" %>
</head>
<style>
		body {
			background-color: white;
			font-family: Arial, sans-serif;
		}
		
		form {
			background-color: #80DEEA;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			padding: 20px;
			width: 500px;
			margin: 50px auto;
		}
		
		h1 {
			text-align: center;
			color: #333;
		}
		
		input[type="text"], input[type="email"], input[type="password"], input[type="tel"], textarea {
			padding: 10px;
			border-radius: 5px;
			border: none;
			width: 100%;
			margin-bottom: 20px;
			box-sizing: border-box;
			font-size: 16px;
		}
		
		.icon {
			display: block;
			margin: 0 auto 20px;
			width: 100px;
			height: 100px;
		}
		input[type="submit"] {
			background-color: #4CAF50;
			color: #fff;
			border: none;
			padding: 10px 20px;
			border-radius: 5px;
			cursor: pointer;
			font-size: 16px;
		}
		
		input[type="submit"]:hover {
			background-color: #3e8e41;
		}
		
		.error-message {
			color: red;
			font-size: 14px;
			margin-top: 5px;
		}
	</style>
<body>
<style>
body {
  background-image: url('https://cdn2.vectorstock.com/i/1000x1000/40/41/clothing-store-woman-clothes-shop-and-boutique-vector-8084041.jpg');
  background-repeat: no-repeat;
  background-size:cover;
}
</style>
<%@include file="component/navbar.jsp" %>
<center><%@include file="component/message.jsp" %></center>
<div class="row">
<div class="col-md-6 offset-md-3">
<form method="post" action="Register">
<img src="img/user.png" alt="Icon" class="icon">
		<h1>Register Here!</h1>
		<div class="form-group">
		<label for="user_name">Name:</label>
		<input type="text" name="user_name" id="user_name" required>
		</div>
		<div class="form-group">
		<label for="user_email">Email:</label>
		<input type="email" name="user_email" id="user_email" required>
		</div>
		<div class="form-group">
		<label for="user_password">Password:</label>
		<input type="password" name="user_password" id="user_password" required>
		</div>
		<div class="form-group">
		<label for="user_phone">Phone:</label>
		<input type="tel" name="user_phone" id="user_phone" required>
		</div>
		<div class="form-group">
		<label for="user_address">Address:</label>
		<textarea name="user_address" id="user_address" rows="3" required></textarea>
		</div>
		<div class="container text-center">
		<button type="submit" class="btn btn-outline-success">Register</button>
		<button type="reset"  class="btn btn-outline-warning">Reset</button>
		</div>
	</form>


</div>
</div >
</body>
</html>