package com.application.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.dao.CustomerDao;
import com.application.dto.CustomerDto;
import com.application.entity.Customer;

@Service
public class CustomerService {

	@Autowired
	private CustomerDao customerDao;

	public boolean insertCustomer(CustomerDto customerDto) {

		return this.customerDao.insertCustomer(customerDto);
	}

	public Customer getCustomerById(String email) {

		return this.customerDao.getCustomerById(email);
	}
	
	public Customer getCustomerByMobileNo(String mobileNo) {
		return this.customerDao.getCustomerByMobileNo(mobileNo);
	}

}
