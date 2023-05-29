<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! log in first to access checkout page");
	response.sendRedirect("login.jsp");
	return;
}

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout page</title>
<%@include file="component/common_css_js.jsp"%>

</head><link rel="icon" type="image/x-icon" href="img/logo.png">
<body>
	<style>
body {
	background-image:
		url('https://img.freepik.com/free-photo/top-view-truck-boxes_23-2149853130.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
<%@include file="component/navbar.jsp" %>

<div class="container">
<div class="row mt-5">
<div class="col-md-6">
<!-- Card -->
<div class="card">
<div class="card-body">
<h3 class="text-center mb-3">Your Selected Items</h3>
<div class="cart-body"></div></div>
</div>



</div>
<div class="col-md-6">
<!-- form details -->
<div class="card">
<div class="card-body">
<h3 class="text-center mb-3">Your Details for order</h3>
<form action="">
 <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input value="<%=user.getUserEmail() %>"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" readonly>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
 <div class="form-group">
    <label for="name">Your Name</label>
    <input  value="<%=user.getUserName() %>"  type="" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name" readonly>

  </div>
  
   <div class="form-group">
    <label for="name">Enter MobNo</label>
    <input value="<%=user.getUserPhone() %>" type="number" class="form-control" id="phone" aria-describedby="emailHelp" readonly>

  </div>
 <div class="form-group">
    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter your address"></textarea>
  </div>
 <div class="container text-center">
<button class="btn btn-outline-success">Order now</button> 
<button class="btn btn-outline-primary" >Continue Shopping</button>  
 
 </div>

</form>
</div>

</div>
</div>
</div>
<%@include file="component/common_modals.jsp" %>
</body>
</html>