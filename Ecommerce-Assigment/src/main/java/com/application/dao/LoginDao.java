package com.application.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.dto.LoginDto;
import com.application.entity.Login;
import com.application.repository.LoginRepo;

@Repository
public class LoginDao {

	@Autowired
	private LoginRepo loginRepo;

	// To validate Login id and password
	public boolean loginCustomerByEmail(String username,String password) {
		if (this.loginRepo.existsById(username)) {
			Optional<Login> optLogin = this.loginRepo.findById(username);
			if (optLogin.isPresent()) {
				String pass = optLogin.get().getPassword();
				System.out.println(pass);
				if (pass!=null&&pass.equals(password))
					return true;
			}

		}

		return false;

	}
	
	public boolean loginCustomerByMobileNo(String mobileNo,String password) {
		System.out.println("UserName method call");
		System.out.println(mobileNo+":"+password);
		if(!this.loginRepo.findByMobileNo(mobileNo).isEmpty()) {
			System.out.println("Username:"+mobileNo);
			List<Login> customer = this.loginRepo.findByMobileNo(mobileNo);
			System.out.println(customer);
				String pass=customer.get(0).getPassword();
				if(pass!=null&&pass.equals(password)) {
					
					return true;
				}
			
		}
		return false;
	}

	// get role to check admin or customer
	public String setRole(LoginDto loginDto) {
		String role = null;
		if (this.loginRepo.existsById(loginDto.getEmail())) {
			Optional<Login> optLogin = this.loginRepo.findById(loginDto.getEmail());
			if (optLogin.isPresent())
				role = optLogin.get().getRole();
		}
		return role;
	}

}