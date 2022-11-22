package com.application.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.datamap.DataMap;
import com.application.dto.CustomerDto;
import com.application.dto.ResponseStatus;
import com.application.entity.Customer;
import com.application.entity.Order;
import com.application.entity.Product;
import com.application.service.CustomerService;
import com.application.service.OrderService;

@Controller
public class CustomerController {
	
	private static final String SUCCESS="SUCCESS";
	
	static final String LOGIN = "login";

	@Autowired
	private CustomerService customerService;

	@Autowired
	private OrderService orderService;

	List<Product> cartProduct = new ArrayList<>();

	@RequestMapping("/register")
	public String insertCustomer() {
		return "register";
	}

	// Calling Insert Method
	@PostMapping("/register")
	public @ResponseBody ResponseStatus<String> insertCustomer(CustomerDto customerDto) {
		
		

		try {
		this.customerService.insertCustomer(customerDto); 
			return new ResponseStatus<>(200,SUCCESS);
		
		}
		catch(Exception e) {
		return new ResponseStatus<>(401,"failed");
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/order")
	public String orderPage(HttpSession session, Model m) {
		if (session.getAttribute("user") == null)
			return "redirect:login";
		CustomerDto customerDto = (CustomerDto) session.getAttribute("user");
		Customer customer = DataMap.customerDataMap(customerDto);
		List<Order> orders = this.orderService.getAllOrderByEmail(customer);
		m.addAttribute("orders", orders);
		return "order";

	}

}
