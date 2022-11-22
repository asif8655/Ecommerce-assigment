package com.application.repository;



import org.springframework.data.repository.CrudRepository;

import com.application.entity.Customer;

public interface CustomerRepo extends CrudRepository<Customer, String>{
	
	
	public Customer findByMobileNo(String mobileNo);

}
