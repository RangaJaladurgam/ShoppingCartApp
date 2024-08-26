package com.project.shopping_cart.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.function.Supplier;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.query.Query;

import com.project.shopping_cart.entity.Product;
import com.project.shopping_cart.repository.ShoppingCartRepository;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer cartId = Integer.parseInt(req.getParameter("cartId"));
		
		ShoppingCartRepository s = new ShoppingCartRepository();
		
		List<Product> allproducts = s.FindAllProductsInUserCart(cartId);
		
		List<Product> products = allproducts.stream()
							.distinct()
							.toList();
		
		Map<Integer, Long> quantity = allproducts.stream()
                .collect(Collectors.groupingBy(Product::getProductId, Collectors.counting()));
		
		// sum of items
		double sum = allproducts.stream()
							.map(x->x.getProductPrice())
							.reduce(0,(a,b)->a+b);
		
		
		req.setAttribute("products",products );
		req.setAttribute("cartId",cartId );
		req.setAttribute("bill", sum);
		req.setAttribute("quantity", quantity);
		req.getRequestDispatcher("cart.jsp").forward(req, resp);
	}
}
