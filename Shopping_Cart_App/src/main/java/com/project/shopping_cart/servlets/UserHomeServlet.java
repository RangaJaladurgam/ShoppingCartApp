package com.project.shopping_cart.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.shopping_cart.entity.Cart;
import com.project.shopping_cart.entity.Product;
import com.project.shopping_cart.entity.User;
import com.project.shopping_cart.repository.ShoppingCartRepository;




@WebServlet("/user-home")
public class UserHomeServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Integer userId = Integer.parseInt(req.getParameter("userId"));
		System.out.println(userId);

		ShoppingCartRepository s = new ShoppingCartRepository();
		User user = s.checkUserExists(userId);
		if(user!=null) {
			List<Product> products = s.displayAllProduts();		
			
			req.setAttribute("list", products);
			req.setAttribute("user", user);
			req.getRequestDispatcher("displayAllProducts.jsp").forward(req, resp);
		}else {
			req.setAttribute("message", "User not found");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}

	}	

}
