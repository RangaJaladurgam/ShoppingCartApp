<%@page import="com.project.shopping_cart.entity.User"%>
<%@page import="com.project.shopping_cart.entity.Product"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Home</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/material-ui/4.11.4/css/material-ui.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<style>
.bgCol{
		background: #4568DC;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #B06AB3, #4568DC);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #B06AB3, #4568DC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
		}
table {
	width: 100%;
}

.welcome-message {
	font-size: 24px;
	font-weight: bold;
}

.product-list-header {
	font-size: 36px;
	font-weight: bold;
}

.notification {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background-color: green;
  color: white;
  padding: 10px 30px;
  border-radius: 5px;
  display: none;
  transition: opacity 0.5s, transform 0.5s; /* add transition effect */
}

.notification.show {
  display: block;
  opacity: 1;
  transform: translateY(0); /* move to original position */
}

.notification.hide {
  opacity: 0;
  transform: translateY(20px); /* move down and out of sight */
}

.notification.show.animate {
  animation: notification-show 0.5s forwards; /* add animation */
}

.notification.hide.animate {
  animation: notification-hide 0.5s forwards; /* add animation */
}

@keyframes notification-show {
  0% {
    opacity: 0;
    transform: translateY(20px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes notification-hide {
  0% {
    opacity: 1;
    transform: translateY(0);
  }
  100% {
    opacity: 0;
    transform: translateY(20px);
  }
}
</style>
</head>
<body >

	<% List<Product> products= (List) request.getAttribute("list");
		User user = (User) request.getAttribute("user");
	%>

	<nav class="navbar navbar-expand-lg navbar-dark bgCol">
		<a class="navbar-brand" href="#">Shopping Cart Application</a>
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
				<li class="nav-item"><a class="nav-link"
					href="cart?cartId=<%=user.getCart().getCartId()%>">My Cart</a></li>
			</ul>
		</div>
	</nav>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-12">
				<span class="welcome-message">Welocome Back, <%=user.getUserName() %></span>
				<span>${message}</span>
				<h4 class="product-list-header">List of Products Available</h4>

				<table border="1" class="table table-striped">
					<tr>
						<th>PRODUCT_ID</th>
						<th>PRODUCT_NAME</th>
						<th>PRODUCT_BRAND</th>
						<th>PRODUCT_PRICE</th>
						<th>ACTION</th>
					</tr>
					<%
						for(Product p : products) {
					%>
					<tr>
						<td><%= p.getProductId() %></td>
						<td><%= p.getProductName() %></td>
						<td><%= p.getProductBrand() %></td>
						<td><%= p.getProductPrice() %></td>
						<td>
							<button type="button" class="btn btn-primary"
								onclick="addToCart(<%=p.getProductId()%>, <%=user.getUserId()%>)">
								<i class="fas fa-shopping-cart"></i> Add to Cart
							</button>
						</td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>

	<div class="notification" id="notification"></div>

	<script>
	  function addToCart(productId, userId) {
	    // Send a request to the server to add the product to the cart
	    var xhr = new XMLHttpRequest();
	    xhr.open('GET', 'add-product-tocart?productId=' + productId + '&userId=' + userId, true);
	    xhr.onload = function() {
	      if (xhr.status === 200) {
	        showNotification("Added to cart!", "success");
	      } else {
	        showNotification("Error adding to cart!", "error");
	      }
	    };
	    xhr.send();
	  }

	  function showNotification(message, type) {
		  var notification = document.getElementById("notification");
		  notification.innerHTML = message;
		  notification.className = "notification show animate";
		  setTimeout(function() {
		    notification.className = "notification hide animate";
		  }, 3000);
		}
		</script>
	</body>
	</html>