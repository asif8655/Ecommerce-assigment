package com.application.controller;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.datamap.DataMap;
import com.application.dto.CustomerDto;
import com.application.dto.LoginDto;
import com.application.dto.ResponseStatus;
import com.application.entity.Product;
import com.application.service.CustomerService;
import com.application.service.LoginService;
import com.application.service.OrderService;
import com.application.service.ProductService;

@Controller
public class HomeController {

	static final String LOGIN = "login";

	@Autowired
	private CustomerService customerService;

	@Autowired
	private LoginService loginService;

	@Autowired
	private ProductService productService;

	@Autowired
	private OrderService orderService;

	List<Product> cartProduct = new ArrayList<>();

	@RequestMapping({ "/", "/index" })
	public String home(Model m) {
		m.addAttribute("product", this.productService.getAllProduct());

		return "index";
	}

	// Login index page
	@RequestMapping("/login")
	public String login(Model m) {
		m.addAttribute("loginDto", new LoginDto());
		return LOGIN;
	}

	// after login go to HomePage
	@PostMapping("/login")
	public String validateCustomer(LoginDto loginDto, HttpSession session) {

		if (this.loginService.validateCustomer(loginDto)) {
			String role = this.loginService.setRole(loginDto);
			if (role.contentEquals("Admin")) {
				session.setAttribute("adminuser", loginDto);
				return "redirect:adminpage";
			} else {
				CustomerDto customerDto = DataMap
						.convertCustomerToCustomerDto(this.customerService.getCustomerById(loginDto.getEmail()));
				session.setAttribute("user", customerDto);
				return "redirect:index";
			}
		}
		return "redirect:" + LOGIN + "?msg=Invalid Credential";
	}

	// Take cart product and hold in session
	@PostMapping("/getCartProduct")
	public @ResponseBody List<Product> getProductsInCart(@RequestBody String data, HttpSession session) {

		if (session.getAttribute("user") == null) {
			return Collections.emptyList();
		}
		if (!this.cartProduct.isEmpty())
			return this.cartProduct;
		return Collections.emptyList();
	}

	// remove from cart
	@PostMapping("/removeproduct")
	public @ResponseBody List<Product> removeProduct(@RequestBody String pid) {

		List<Product> afterRemovingCart = new ArrayList<>();
		JSONObject jsonObj = new JSONObject(pid);
		int prodId = jsonObj.getInt("pid");
		this.cartProduct.stream().filter(cartp -> cartp.getpId() != prodId).forEach(afterRemovingCart::add);
		cartProduct = afterRemovingCart;
		return cartProduct;
	}



	// Take product and add to cart
	@PostMapping("/proudctId")
	public @ResponseBody List<Product> getProductById(@RequestBody String pid, HttpSession session) {

		if (session.getAttribute("user") == null) {
			return null;
		}

		JSONObject jsonObj = new JSONObject(pid);
		int prodId = jsonObj.getInt("pid");
		Product product = this.productService.getProductById(prodId);
		if (cartProduct.isEmpty()) {
			cartProduct.add(product);
		} else {
			for (Product p : cartProduct) {
				if (p.getpId() == prodId) {
					return cartProduct;
				}
			}
			cartProduct.add(product);
		}
		return cartProduct;
	}

	// Search Product on HomePage
	@PostMapping("/search")
	public @ResponseBody List<Product> getProductBySearch(@RequestBody String name) {
		JSONObject jsonObj = new JSONObject(name);
		String newName = jsonObj.getString("name");
		if (newName.trim().isEmpty()) {
			newName = "";
		}

		return this.productService.getProductByName(newName);
	}

	// Buy product
	@PostMapping("/buyproduct")
	public @ResponseBody ResponseStatus<String> buyProduct(@RequestBody String pid, HttpSession session) {
		JSONObject orderJson = new JSONObject(pid);
		int prodId = orderJson.getInt("productId");

		CustomerDto customer = (CustomerDto) session.getAttribute("user");

		if (this.orderService.buyProduct(customer.getEmail(), prodId)) {
			return new ResponseStatus<>(200, "Order Placed");
		} else
			return new ResponseStatus<>(401, "something went wrong");
	}

}
