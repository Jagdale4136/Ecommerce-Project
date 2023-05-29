<%@page import="com.mycart.entity.User"%>
<%

User user1=(User)session.getAttribute("current-user");

%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg" >

	<div class="container">
		<img src="img/logo.png" style="max-width: 80px" alt="Logo">
		<h4>M2CART</h4>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span><br>
		</button>&nbsp;
 &nbsp;
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link"
					 href="about.jsp"> About_Us </a></li>
			</ul>
			<ul class="navbar-nav ml-auto">


				<li class="nav-item active"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#cart"><i
						class="fa fa-shopping-cart" aria-hidden="true"
						style="font-size: 23px"></i> <span style="font-size: 18px"
						class="ml-0 cart-items">(0)</span> </a></li>


				<%  if(user1==null){
 %>
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login </a></li>
				<li class="nav-item active"><a class="nav-link"
					href="Register.jsp">Register </a></li>
				<%
 } else{
      
      %>
				<li class="nav-item active"><a class="nav-link"
					href="<%=user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp" %>"><%=user1.getUserName() %>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="LogOut">Log
						Out </a></li>
				<%} %>
			</ul>
		</div>
	</div>
</nav>