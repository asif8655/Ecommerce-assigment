package com.application.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.dao.LoginDao;
import com.application.dto.LoginDto;

@Service
public class LoginService {

	@Autowired
	private LoginDao loginDao;

	public boolean validateCustomer(LoginDto loginDto) {
		return this.loginDao.validateCustomer(loginDto);
	}

	public String setRole(LoginDto loginDto) {
		return this.loginDao.setRole(loginDto);
	}

}
