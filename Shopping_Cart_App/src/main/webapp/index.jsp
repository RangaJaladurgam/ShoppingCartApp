<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shopping Cart Application</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-ui/4.11.4/css/material-ui.min.css" />
	<style>
	.bgCol{
		background: #4568DC; 
		background: -webkit-linear-gradient(to right, #B06AB3, #4568DC); 
		background: linear-gradient(to right, #B06AB3, #4568DC); 
		}
	</style>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bgCol">
    <a class="navbar-brand" href="index.jsp">Shopping Cart Application</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="addproduct.jsp">Add Product <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adduser.jsp">Add User</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="userpage.jsp">Existing User</a>
        </li>
      </ul>
    </div>
  </nav>
  <header class="jumbotron bgCol">
    <h1 class="display-3">Shopping Cart Application</h1>
    </header>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <p>Welcome to our shopping cart application! This is a platform where you can buy and sell products online.</p>
        <p>We have a wide range of products to choose from, and our user-friendly interface makes it easy to navigate and find what you're looking for.</p>
        <p>If you're a seller, you can add your products to our platform and reach a wider audience.</p>
        <span class="text-muted">${message}</span>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/material-ui/4.11.4/js/material-ui.min.js"></script>
</body>
</html>
