package com.application.datamap;

import com.application.dto.CustomerDto;
import com.application.dto.ProductDto;
import com.application.entity.Customer;
import com.application.entity.Login;
import com.application.entity.Product;

public class DataMap {

	private DataMap() {
		super();

	}

	// Take data from dto and set on entity
	public static Customer customerDataMap(CustomerDto customerDto) {
		Customer cust = new Customer();
		cust.setAddress(customerDto.getAddress());
		cust.setEmail(customerDto.getEmail());
		cust.setMobileNo(customerDto.getMobileNo());
		cust.setName(customerDto.getName());
		cust.setPassword(customerDto.getPassword());
		cust.setUserName(customerDto.getUserName());
		return cust;
	}
	
	// Real entity
	public static CustomerDto convertCustomerToCustomerDto(Customer customer) {
		
		CustomerDto c = new CustomerDto();
		c.setEmail(customer.getEmail());
		c.setName(customer.getName());
		c.setUserName(customer.getUserName());
		c.setMobileNo(customer.getMobileNo());
		c.setAddress(customer.getAddress());
		c.setPassword(customer.getPassword());
		return c;

	}

	// Take Data from dto and set on entity
	public static Login loginDataMapFromCustomer(CustomerDto customerDto) {
		Login login = new Login();
		login.setEmail(customerDto.getEmail());
		login.setPassword(customerDto.getPassword());
		login.setRole("Customer");
		return login;
	}

	public static Product productDataMap(ProductDto productDto) {
		Product product = new Product();
		product.setDescription(productDto.getDescription());
		product.setImg(productDto.getImg());
		product.setName(productDto.getName());
		product.setpId(productDto.getpId());
		product.setPrice(productDto.getPrice());
		product.setQuantity(productDto.getQuantity());
		return product;
	}

}
