package com.project.shopping_cart.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.shopping_cart.entity.Product;
import com.project.shopping_cart.repository.ShoppingCartRepository;

@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer productId = Integer.parseInt(req.getParameter("productId"));
		String productName = req.getParameter("productName");
		String productBrand = req.getParameter("productBrand");
		Integer productPrice = Integer.parseInt(req.getParameter("productPrice"));
	
		ShoppingCartRepository s = new ShoppingCartRepository();
		Product product = new Product();
		product.setProductId(productId);
		product.setProductName(productName);
		product.setProductBrand(productBrand);
		product.setProductPrice(productPrice);
		
		s.addProduct(product);
		
		req.setAttribute("message", "product added");
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	
	
	}	
	
}
