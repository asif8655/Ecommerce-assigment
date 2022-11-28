package com.application.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.dao.OrderDao;
import com.application.entity.Customer;
import com.application.entity.Order;

@Service
public class OrderService {

	@Autowired
	private OrderDao orderDao;

	public boolean buyProduct(String email, int productId) {
		return this.orderDao.buyProduct(email, productId);
	}

	public List<Order> getAllOrderByEmail(Customer customer) {

		return this.orderDao.getAllOrderByEmail(customer);

	}
	
	public boolean outOfStock(int pid) {
		return this.orderDao.checkOutOfStocks(pid);
	}

}
