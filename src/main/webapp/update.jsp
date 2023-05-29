<%@page import="com.mycart.entity.User"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
<%@page import="com.mycart.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>  <%  int id=(Integer)session.getAttribute("id");
      UserDao u=new UserDao(FactoryProvider.getFactory());
    		 User user= u.getUserBYId(id);
%></h1>
<!DOCTYPE html>
<html>
<head>
	<title>Update User Record</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
			margin: 0;
			padding: 0;
		}

		.container {
			max-width: 600px;
			margin: 0 auto;
			padding: 20px;
			background-color: #fff;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
		}

		h1 {
			text-align: center;
			margin-bottom: 30px;
		}

		label {
			display: block;
			margin-bottom: 10px;
			font-weight: bold;
		}

		input[type="text"],
		input[type="email"],
		input[type="password"],
		input[type="tel"],
		textarea {
			display: block;
			width: 100%;
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 5px;
			margin-bottom: 20px;
			box-sizing: border-box;
			font-size: 16px;
		}

		input[type="submit"],
		input[type="reset"] {
			display: inline-block;
			background-color: #4CAF50;
			color: #fff;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-size: 16px;
		}

		input[type="submit"]:hover,
		input[type="reset"]:hover {
			background-color: #3e8e41;
		}

		input[type="submit"]:focus,
		input[type="reset"]:focus {
			outline: none;
			box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
		}

		input[type="submit"]:active,
		input[type="reset"]:active {
			background-color: #e7e7e7;
			color: #333;
			text-align: center;
		}

	</style>
</head>
<body><%
             String key=(String)session.getAttribute("key");
if(key!=null){
%>
<% String massege=(String)request.getAttribute("message"); %>
<center><h2><%=massege %></h2></center>
<%} %>
	<div class="container">
		<h1>Update User Record</h1>
		<form action="update" method="post">
		<label for="userId"></label>
			<input type="hidden" id="userId" name="userId" value="<%=user.getUserId()%>"   required>
		
			<label for="username">Username:</label>
			<input type="text" id="username" name="username" value="<%=user.getUserName() %>"   required>

			<label for="email">Email:</label>
			<input type="email" id="email" name="email" value="<%=user.getUserEmail() %>" required>

			<label for="password">Password:</label>
			<input type="password" id="password" name="password" value="<%=user.getUserPassword() %>" required>

			<label for="phone">Phone:</label>
			<input type="tel" id="phone" name="phone" value="<%=user.getUserPhone() %>" required>

			<label for="address">Address:</label>
			<textarea id="address" name="address" rows="5" cols="40"  required> <%=user.getUserAddress() %> </textarea>

			<input type="submit" value="Update">
			<input type="reset" value="Reset">
		</form>
	</div>
</body>
</html>

</body>
</html>