<!DOCTYPE html>
<%@page import="com.mycart.helper.FactoryProvider"%>
<%@page import="com.mycart.dao.UserDao"%>
<%@page import="com.mycart.entity.User"%>
<html>
<head>
	<title>Person Information</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		.container {
			margin-top: 50px;
		}
		.person-info {
			margin-top: 20px;
			border: 1px solid #ddd;
			padding: 20px;
			border-radius: 5px;
		}
		.person-info h2 {
			margin-top: 0;
		}
		.person-info p {
			margin-bottom: 0;
		}
		.person-info img {
			width: 150px;
			height: 150px;
			border-radius: 50%;
			object-fit: cover;
			object-position: center;
			margin-right: 20px;
		}
	</style>
	<%
                 String  email=(String)session.getAttribute("email");
	             String  pass=(String)session.getAttribute("password");
	             UserDao userDao=new UserDao(FactoryProvider.getFactory());
	        	 User u = userDao.getUserByEmailAndPassword(email, pass);
	        	 int id=u.getUserId();
	        	 session.setAttribute("id", id);
	%>
</head>
<%@include file="component/common_css_js.jsp" %>
<body>
<%@include file="component/navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="person-info">
					<img src="img/user.png" alt="Person Image">
					<h2><%=u.getUserName() %></h2>
					<p><strong>Email:</strong> <%=u.getUserEmail() %></p>
						<p><strong>Password:</strong> <%=u.getUserPassword() %></p>
					<p><strong>Phone:</strong> <%=u.getUserPhone() %></p>
					<p><strong>Address:</strong><%=u.getUserAddress() %></p>
					<div class="continer mt-2">
					<button class="btn btn-outline-success" onclick="location.href='update.jsp'">Update Profile</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
