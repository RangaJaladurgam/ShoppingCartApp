<%@page import="java.util.Map"%>
<%@page import="com.project.shopping_cart.entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
	<title> Cart</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-ui/4.11.4/css/material-ui.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
	
	<style>
		body {
			background-color: #ffffff; /* changed to white background */
		}
		
		.cart-header {
			font-size: 36px;
			font-weight: bold;
			color: #333;
		}
		
		.product-table {
			border-collapse: collapse;
			width: 100%;
		}
		
		.product-table th, .product-table td {
			border: 1px solid #ddd;
			padding: 10px;
			text-align: left;
		}
		
		.total-bill {
			font-size: 24px;
			font-weight: bold;
			color: #333;
			padding: 20px;
			border-top: 1px solid #ddd;
		}
		
		/* added custom styles for Mytra Cart */
		.mytra-cart {
			background-color: #f7f7f7;
			padding: 20px;
			border: 1px solid #ddd;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			
		}
		
		.mytra-cart-header {
			
			color: #ffffff;
			padding: 10px;
			border-bottom: 1px solid #ddd;
			
		}
		
		.mytra-cart-header h1 {
			font-size: 24px;
			font-weight: bold;
			margin: 0;
		}
		
		.mytra-cart-product {
			padding: 20px;
			border-bottom: 1px solid #ddd;
		}
		
		.mytra-cart-product:last-child {
			border-bottom: none;
		}
		
		.mytra-cart-product .product-name {
			font-size: 18px;
			font-weight: bold;
		}
		
		.mytra-cart-product .product-price {
			font-size: 16px;
			color: #666;
		}
		
		.mytra-cart-product .product-quantity {
			font-size: 16px;
			color: #666;
		}
		
		.mytra-cart-product .product-remove {
			font-size: 16px;
			color: #666;
			cursor: pointer;
		}
		
		.mytra-cart-product .product-remove:hover {
			color: #333;
		}
		
		.bgCol{
		background: #4568DC;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #B06AB3, #4568DC);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #B06AB3, #4568DC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
		}
	</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bgCol">
		<a class="navbar-brand" href="#">Cart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a>
				</li>
				
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="mytra-cart mt-5">
					<div class="mytra-cart-header bgCol">
						<h1>Cart</h1>
					</div>
					<table class="product-table">
						<thead>
							<tr>
								<th>PRODUCT</th>
								<th>QUANTITY</th>
								<th>PRODUCT_PRICE</th>
								<th>ACTION</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Product> products = (List) request.getAttribute("products");
								
							Integer cartId = (Integer) request.getAttribute("cartId");
							Map<Integer, Long> quantity = (Map) request.getAttribute("quantity");
							
							for (Product p : products) {
						%>
						<tr>
							<td><%=p.getProductBrand() + " " + p.getProductName()%></td>
							<td><%=quantity.get(p.getProductId()) %></td>
							<td><%=p.getProductPrice()%></td>
							<td><a href="remove-product-from-cart?productId=<%=p.getProductId()%>&cartId=<%=cartId%>">remove</a></td>
						</tr>
						<%} %>
					</tbody>
				</table>
				
				<div class="total-bill">
					Total bill: ${bill}
				</div>
			</div>
		</div>
	</div>

</body>
</html>