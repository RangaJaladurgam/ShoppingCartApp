package com.project.shopping_cart.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.shopping_cart.entity.Product;
import com.project.shopping_cart.entity.User;
import com.project.shopping_cart.repository.ShoppingCartRepository;

@WebServlet("/add-product-tocart")
public class AddProductsToCart extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer productId = Integer.parseInt(req.getParameter("productId"));
		Integer userId =  Integer.parseInt(req.getParameter("userId"));
		
		ShoppingCartRepository s = new ShoppingCartRepository();
		s.addProductToUserCart(productId, userId);
		User user = s.checkUserExists(userId);
		
		List<Product> products = s.displayAllProduts();		
		
		req.setAttribute("list", products);
		req.setAttribute("user", user);
		req.getRequestDispatcher("displayAllProducts.jsp").forward(req, resp);
		
		
		
		
	}
}
