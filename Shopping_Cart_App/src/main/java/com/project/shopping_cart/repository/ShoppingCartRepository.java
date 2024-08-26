package com.project.shopping_cart.repository;

import java.util.List;
import java.util.Scanner;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.project.shopping_cart.entity.Cart;
import com.project.shopping_cart.entity.Product;
import com.project.shopping_cart.entity.User;



public class ShoppingCartRepository {
	Configuration cfg = new Configuration().configure().addAnnotatedClass(User.class).addAnnotatedClass(Cart.class).addAnnotatedClass(Product.class);
	SessionFactory sfactory = cfg.buildSessionFactory();
	Scanner sc = new Scanner(System.in);

	public void addProduct(Product product) {
		Session session = sfactory.openSession();
		Transaction transaction = session.beginTransaction();


		session.save(product);

		transaction.commit();
		session.close();

	}//add product end here


	public void addUserWithCart(User user,Cart cart) {
		Session session = sfactory.openSession();
		Transaction transaction = session.beginTransaction();

		session.save(user);
		session.save(cart);

		transaction.commit();
		session.close();

	} //add user cart end here


	public List<Product> displayAllProduts(){
		Session session = sfactory.openSession();
		Transaction transaction = session.beginTransaction();

		Query<Product> query = session.createQuery("FROM Product");

		List<Product> products = query.list();

		transaction.commit();
		session.close();
		return products;
		
	}




	public void addProductToUserCart(Integer p_id,Integer u_id) {
		Session session = sfactory.openSession();
		Transaction transaction = session.beginTransaction();

		Product product = session.get(Product.class, p_id);

		User user = session.get(User.class, u_id);

		Cart cart = user.getCart();

		cart.getProducts().add(product);

		session.update(cart);

		transaction.commit();

	} //add product to user cart end here


	public void removeProductFromUserCart(Integer productId,Integer cartId) {
		Session session = sfactory.openSession();
		Transaction transaction = session.beginTransaction();
		
		Product product = session.get(Product.class, productId);

		Cart cart = session.get(Cart.class, cartId);
		
		cart.getProducts().remove(product);

		session.update(cart);

		transaction.commit();
		session.close();

	} //remove product from user cart end here


	public List<Product> FindAllProductsInUserCart(Integer cartId) {
		Session session = sfactory.openSession();
		Transaction transaction = session.beginTransaction();

		Query<Product> query = session.createQuery
				("SELECT p FROM Cart c JOIN c.products p WHERE c.cartId = :cartId", Product.class);
		query.setParameter("cartId", cartId);
		List<Product> products = query.list();

		
		transaction.commit();
		session.close();
		return products;
	} // find all product in user cart end here


	public User checkUserExists(Integer userId) {
		Session session = sfactory.openSession();
		Transaction transaction = session.beginTransaction();

		User user = session.get(User.class, userId);

		transaction.commit();
		return user;
	}



}
