
<%@page import="com.mycart.helper.FactoryProvider"%>
<%@page import="com.mycart.dao.UserDao"%>
<%@page import="com.mycart.entity.User"%>
<%

User user=(User)session.getAttribute("current-user");
  if(user==null){
	  session.setAttribute("message", "You are not logged in !! log in first");
	  response.sendRedirect("login.jsp");
	  return;
  }

  else{
	  
	  if(user.getUserType().equals("admin")){
		  session.setAttribute("message", "cant access this page");
		  response.sendRedirect("login.jsp");
		  return;
		  
	  }
  }

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="icon" type="image/x-icon" href="img/logo.png">
<meta charset="UTF-8">
<title>Normal User</title>
<%@include file="component/common_css_js.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>
<%                             String email= (String) session.getAttribute("email");
String pass= (String) session.getAttribute("password");
    UserDao userDao=new UserDao(FactoryProvider.getFactory());
	 User u = userDao.getUserByEmailAndPassword(email, pass);
	 session.setAttribute("email", email);
	 session.setAttribute("password", pass);
%>

<main>
		<h1>Welcome, <span class="username"><%=u.getUserName() %></span>!</h1>
		<p>Thank you for logging in to our Ecommerce Website. We have a wide range of products available at competitive prices. Please browse our catalog and add items to your cart. You can also manage your account details and view your order history.</p>
       <h4>View your profile here <a href="normalUserProfile.jsp">view profile</a></h4>
		<div class="product-catalog">
			<!-- Your product catalog goes here -->
		</div>
	</main>

	<!-- Footer -->
	<footer>
		<p>&copy; 2023 Our Ecommerce Website</p>
	</footer>
</body>
</html>