package com.project.shopping_cart.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.shopping_cart.repository.ShoppingCartRepository;

@WebServlet("/remove-product-from-cart")
public class RemoveProductsCartServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer productId = Integer.parseInt(req.getParameter("productId"));
		Integer cartId = Integer.parseInt(req.getParameter("cartId"));
		
		ShoppingCartRepository s = new ShoppingCartRepository();
		s.removeProductFromUserCart(productId,cartId);
		
		resp.sendRedirect("cart?cartId="+cartId);
		
	}
}
