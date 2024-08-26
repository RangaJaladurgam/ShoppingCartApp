<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add User</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-ui/4.11.4/css/material-ui.min.css" />

<style>
	.bgCol{
		background: #4568DC;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #B06AB3, #4568DC);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #B06AB3, #4568DC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
		}
		
		label{
		color:white;
		}
		
		button[type="submit"]{
			background: white;
			color:#B06AB3;
			font-weight: 600;
			 /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
			
			border:none;
		}
	</style>

</head>
<body class="bgCol">
  <nav class="navbar navbar-expand-lg navbar-dark bgCol">
    <a class="navbar-brand" href="index.jsp">Shopping Cart Application</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="addproduct.jsp">Add Product</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="adduser.jsp">Add User <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="userpage.jsp">Existing User</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="container my-5">
    <div class="row">
      <div class="col-md-12">
        <form action="add-user" method="post">
          <div class="form-group">
            <label for="userId">User ID</label>
            <input type="text" class="form-control" id="userId" placeholder="Enter user id" name="userId">
          </div>
          <div class="form-group">
            <label for="userName">User Name</label>
            <input type="text" class="form-control" id="userName" placeholder="Enter user name" name="userName">
          </div>
          <div class="form-group">
            <label for="userEmail">User Email</label>
            <input type="email" class="form-control" id="userEmail" placeholder="Enter user email" name="userEmail">
          </div>
          <div class="form-group">
            <label for="location">Location</label>
            <input type="text" class="form-control" id="userLocation" placeholder="Enter user Location" name="location">
          </div>
          <div class="form-group">
            <label for="mobile">Mobile</label>
            <input type="text" class="form-control" id="userMobile" placeholder="Enter user Mobile" name="mobile">
          </div>
          <div class="form-group">
            <label for="cartId">Cart ID</label>
            <input type="text" class="form-control" id="userCartId" placeholder="Enter user cartId" name="cartId">
          </div>
          
          <button type="submit" class="btn btn-primary">Add User</button>
        </form>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/material-ui/4.11.4/js/material-ui.min.js"></script>
</body>
</html>