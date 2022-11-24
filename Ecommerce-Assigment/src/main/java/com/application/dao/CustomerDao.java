package com.application.dao;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.datamap.DataMap;
import com.application.dto.CustomerDto;
import com.application.entity.Customer;
import com.application.entity.Login;
import com.application.repository.CustomerRepo;
import com.application.repository.LoginRepo;

@Repository
public class CustomerDao {

	@Autowired
	private CustomerRepo customerRepo;

	@Autowired
	private LoginRepo loginRepo;

	// Insert Customer in Database
	public boolean insertCustomer(CustomerDto customerDto) throws EntityNotFoundException {

		
		Customer cust = DataMap.customerDataMap(customerDto);
		Login login = DataMap.loginDataMapFromCustomer(customerDto);
		System.out.println(cust);
		if (this.customerRepo.existsById(cust.getEmail())) {
			throw new EntityExistsException("This email " + cust.getEmail() + " is already used");
		}
		this.customerRepo.save(cust);
		this.loginRepo.save(login);
		return true;
	}

	// Fetch Customer from database
	public Customer getCustomerById(String email) {

		Customer cust = null;
		Optional<Customer> optCustomer = this.customerRepo.findById(email);
		if (optCustomer.isPresent()) {
			cust = optCustomer.get();

		}

		return cust;
	}
	
	public Customer getCustomerByMobileNo(String mobileNo) {
		
		
		return this.customerRepo.findByMobileNo(mobileNo);
		
	}
	
	public boolean updateCustomer(Customer cust,CustomerDto customerDto) throws Exception {
		Customer newData = DataMap.customerDataMap(customerDto);
		Login login = DataMap.loginDataMapFromCustomer(customerDto);
		
		System.out.println("before"+newData);
		if(this.customerRepo.existsById(cust.getEmail())) {
			try {
				System.out.println("after"+newData);
				this.customerRepo.save(newData);
				this.loginRepo.save(login);
				return true;
			}
			catch(Exception e) {
				throw new Exception("Customer Mobile number used by diffrent user");
			}
			
		}
		return false;
		
	}

}
