package com.project.shopping_cart.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.shopping_cart.entity.Cart;
import com.project.shopping_cart.entity.Product;
import com.project.shopping_cart.entity.User;
import com.project.shopping_cart.repository.ShoppingCartRepository;

@WebServlet("/add-user")
public class AddUserServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer userId = Integer.parseInt(req.getParameter("userId"));
		
		String userName = req.getParameter("userName");
		String email = req.getParameter("email");
		String location = req.getParameter("location");
		Long mobile = Long.parseLong(req.getParameter("mobile"));
		
		Integer cartId = Integer.parseInt(req.getParameter("cartId"));
		
	
		ShoppingCartRepository s = new ShoppingCartRepository();
		User user = new User();
		
		user.setUserId(userId);
		user.setUserName(userName);
		user.setUserEmail(email);
		user.setLocation(location);
		user.setMobileNo(mobile);
		
		
		Cart cart = new Cart();
		cart.setCartId(cartId);
		user.setCart(cart);
		
		s.addUserWithCart(user,cart);
		
		resp.sendRedirect("index.jsp");
	
	
	}	
	
}
