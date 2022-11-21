package com.application.dao;

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
	public boolean validateCustomer(LoginDto loginDto) {
		if (this.loginRepo.existsById(loginDto.getEmail())) {
			Optional<Login> optLogin = this.loginRepo.findById(loginDto.getEmail());
			if (optLogin.isPresent()) {
				String password = optLogin.get().getPassword();
				if (password.equals(loginDto.getPassword()))
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