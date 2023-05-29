
<%@page import="java.util.Map"%>
<%@page import="com.mycart.helper.Helper"%>
<%@page import="com.mycart.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="com.mycart.entity.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! log in first");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not Admin !! Dont access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

	<%
						CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
						List<Category> list = catDao.getCategories();
						
						//Fetching count from helper class
						Helper h=new Helper();
						Map<String,Long> m=h.getCounts(FactoryProvider.getFactory());
						
						%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.admin .card {
	border: 1px solid red;
}

.admin .card:hover {
	background: #E1BEE7;
	cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>Admin Panel</title>
<%@include file="component/common_css_js.jsp"%>
</head><link rel="icon" type="image/x-icon" href="img/logo.png">
<body>
	<style>
body {
	background-image:
		url('https://images.unsplash.com/photo-1615715757401-f30e7b27b912?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwxMTI1NDUzfHxlbnwwfHx8fA%3D%3D&w=1000&q=80');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
	<%@include file="component/navbar.jsp"%>
	<div class="container admin">
		<div class="container-fluid">
			<%@include file="component/message.jsp"%>
		</div>
		<div class="row mt-3">
			<!-- first column -->
			<div class="col-md-4">
				<!--    first box -->
				<div class="card ">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								alt="img/user.png" src="img/teamwork.png">
						</div>
						<h1><%=m.get("userCount") %></h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>
			<!-- second column -->
			<div class="col-md-4">
				<!--    second box -->
				<div class="card text-center">
					<div class="card-body">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								alt="img/user.png" src="img/category.png">
						</div>
						<h1><%=list.size()%></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<!-- Third column -->
			<div class="col-md-4">
				<!--    Third box -->
				<div class="card text-center">
					<div class="card-body">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								alt="img/user.png" src="img/product.png">
						</div>
						<h1><%=m.get("productCount") %></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>
		<!--second row  -->
		<div class="row mt-3">
			<!-- First column form second row -->
			<div class="col-md-6">
				<div class="card text-center">
					<div class="card-body" data-toggle="modal"
						data-target="#add-category-modal">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								alt="img/user.png" src="img/add-to-basket.png">
						</div>
						<p class="mt-2">Click here to add categories</p>
						<h1></h1>
						<h1 class="text-uppercase text-muted">Add Categories</h1>
					</div>
				</div>
			</div>
			<!-- second column form second row -->
			<div class="col-md-6">
				<div class="card text-center">
					<div class="card-body" data-toggle="modal"
						data-target="#add-product-modal">
						<div class="container">
							<img style="max-width: 150px" class="img-fluid rounded-circle"
								alt="img/user.png" src="img/plus.png">
						</div>
						<p class="mt-2">Click here to add product</p>
						
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Add Category modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addCategory">
						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required />
						</div>
						<div class="form-group">
							<textarea style="height: 150px"
								placeholder="Enter category discrption" name="catDescription"
								class="form-control"></textarea>
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-outline-warning"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--End of  Add Category modal -->

	<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++=========================================================================================================================== -->
	<!--  Add Product modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Product
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Form -->

					<!-- Product Title -->
					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addProduct">


						<div class="form-group">
							<input type="text" class="form-control" name="pName"
								placeholder="Enter product title" required />
						</div>
						<!-- Product Description -->
						<div class="form-group">
							<textarea style="height: 150px" class="form-control" name="pDesc"
								placeholder="Enter product description" required></textarea>
						</div>
						<!-- Product Price -->
						<div class="form-group">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter product price" required />

						</div>
						<!-- Product Discount -->
						<div class="form-group">

							<input type="number" class="form-control" name="pDis"
								placeholder="Enter product discount" required />
						</div>

						<!-- Product Quantity -->
						<div class="form-group">

							<input type="number" class="form-control" name="pQuantity"
								placeholder="Enter product quantity" required />
						</div>

						<!-- Product Category -->
					

						<div class="form-group">
							<select name="catId" class="form-control">
								<%
								for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>

								<%
								}
								%>
							</select>

						</div>
						<!-- Product photo file -->
						<div class="form-group">
							<label for="pPic">Select Product Picture</label><br> <input
								type="file" id="pPic" name="pPic" required />

						</div>

						<!-- Submit  Button  -->
						<div class="form-group text-center">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-outline-warning"
								data-dismiss="modal">Close</button>
						</div>
					</form>
					<!-- Form End -->
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/common_modals.jsp" %>
	<!--End of  Add Product modal -->
</body>
</html>