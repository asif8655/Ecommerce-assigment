package com.application.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.entity.Customer;
import com.application.entity.Order;
import com.application.entity.Product;
import com.application.repository.OrderRepo;
import com.application.service.CustomerService;
import com.application.service.ProductService;

@Repository
public class OrderDao {

	@Autowired
	private OrderRepo orderRepo;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ProductService productService;

	public boolean insertOrder(Order order) {
		this.orderRepo.save(order);
		return true;
	}

	public boolean buyProduct(String email, int productId) {
		Customer customer = this.customerService.getCustomerById(email);
		Product product = this.productService.getProductById(productId);
		int productQuantity = this.productService.getQuantity(productId);
		if (productQuantity > 0) {
			Order order = new Order();
			order.setCustomer(customer);
			order.setProduct(product);
			this.orderRepo.save(order);
			int dedQuantity = productQuantity - 1;
			this.productService.updateQuantity(dedQuantity, productId);
			return true;
		}
		return false;
	}

	public List<Order> getAllOrderByEmail(Customer customer) {
		return this.orderRepo.findAllByCustomer(customer);
	}

}
