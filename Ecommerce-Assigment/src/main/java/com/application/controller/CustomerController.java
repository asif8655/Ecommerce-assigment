package com.application.controller;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityExistsException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
import com.application.service.ProductService;

@Controller
public class CustomerController {
	
	private static final String SUCCESS="SUCCESS";
	
	static final String LOGIN = "login";

	@Autowired
	private CustomerService customerService;

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;

	List<Product> cartProduct = new ArrayList<>();

	@RequestMapping("/register")
	public String insertCustomer() {
		return "register";
	}

	// Calling Insert Method
	@PostMapping("/register")
	public @ResponseBody ResponseStatus<String> insertCustomer(CustomerDto customerDto) {
		
		System.out.println("Js not working");

		try {
		this.customerService.insertCustomer(customerDto); 
			return new ResponseStatus<>(200,SUCCESS);
		
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		return new ResponseStatus<>(401,e.getMessage());
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
	
	@PostMapping("/payment")
	public @ResponseBody ResponseStatus<Product> paymentPage(@RequestBody String pid,Model m) {
		JSONObject json = new JSONObject(pid);
		int prodId = json.getInt("pid");
		System.out.println(prodId);
		Product product = this.productService.getProductById(prodId);
		System.out.println(product);
		m.addAttribute("product", product);
		return new ResponseStatus<>(200,product);
	}
	
	@GetMapping("/payment")
	public String paymentPage() {
		return "payment";
	}
	
	@GetMapping("/profile")
	public String userProfile(HttpSession session) {
		if (session.getAttribute("user") == null)
			return "redirect:login";
		return "/profile";
	}
	
	@PostMapping("/update")
	public @ResponseBody ResponseStatus<String> updateProfile( CustomerDto customerDto,
			HttpSession session) {
		
		
		CustomerDto customerSession =(CustomerDto) session.getAttribute("user");
		Customer cust = this.customerService.getCustomerById(customerSession.getEmail());
		
		try {
			if(this.customerService.updateCustomer(cust, customerDto)) {
				session.setAttribute("user", customerDto);
				return new ResponseStatus<>(200,"Success");
			}
			return new ResponseStatus<>(500,"SomeThing went Wrong");
		}catch(Exception e) {
			return new ResponseStatus<>(500,e.getMessage());
		}
		
		
	}
	
}
