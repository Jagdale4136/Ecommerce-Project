<%@page import="com.mycart.helper.Helper"%>
<%@page import="com.mycart.entity.Category"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="com.mycart.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html; charset=ISO-8859-1"%>
<html>
<title>My Cart-Home Page</title>
<head> <link rel="icon" type="image/x-icon" href="img/logo.png">
<%@include file="component/common_css_js.jsp"%>
<div class="container-fluid">
</head>
<body>
	<style>
body {
	background-image:
		url('https://img.freepik.com/free-vector/online-shopping-concept-illustration-with-words-people_613284-2431.jpg?size=626&ext=jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>

	<%@include file="component/navbar.jsp"%>
	<div class="row mt-3 mx-2">
		<%
		String cat = request.getParameter("category");
		ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		List<Product> list = null;
		if (cat == null) {
			list = dao.getAllProdcuts();
		} else if (cat.trim().equals("all")) {
			list = dao.getAllProdcuts();
		} else {
			int cid = Integer.parseInt(cat.trim());
			list = dao.getAllProdcutsById(cid);
		}

		CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> cList = cDao.getCategories();
		%>

		<!-- show categories -->
		<div class="col-md-2">
			<div class="list-group mt-4">
				<a href="index.jsp?category=all"
					class="list-group-item list-group-item-action active"> All
					Products </a>
				<%
				for (Category c : cList) {
				%>
				<a href="index.jsp?category=<%=c.getCategoryId()%>"
					class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>


				<%
				}
				%>
			</div>
		</div>
		<!-- show products -->
		<div class="col-md-10">
			<!-- row -->
			<div class="row mt-4">

				<!-- col:12 -->
				<div class="col-md-12">
					<div class="card-columns">
						<!-- Iterating Products -->
						<%
						for (Product p : list) {
						%>

						<!-- Product card -->
						<div class="card product-card">
							<div class="container text-center">
								<img class="card-img-top" src="img/products/<%=p.getpPhoto()%>"
									class="card-img-top m-2"
									style="max-height: 320px; max-width: 100%; width: auto;"
									alt="Card image cap">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=p.getpName()%></h5>
								<p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>

							</div>
							<div class="card-footer">

								<button class="btn custom-bg text-white " onclick="add_to_cart(<%=p.getpId() %>, '<%=p.getpName() %>', <%=p.getpPrice() %>)">Add to cart </button>
									
									
								<button class="btn btn-outline-success ">
									&#8377;<%=p.getPriceAfterDiscount()%>/- <span
										class="text-secondary discount-lable">&#8377;<%=p.getpPrice()%>,
										<%=p.getpDiscount()%>%off
									</span>
								</button>
							</div>

						</div>

						<%
						}

						if (list.size() == 0) {
						out.println("<h1>Currently out of stock</h1>");
						}
						%>
					</div>



				</div>


			</div>

		</div>
	</div>
	</div>
	<%@include file="component/common_modals.jsp" %>
</body>
</html>
