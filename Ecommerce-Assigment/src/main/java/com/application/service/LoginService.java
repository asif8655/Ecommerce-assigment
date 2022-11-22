package com.application.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.dao.LoginDao;
import com.application.dto.LoginDto;

@Service
public class LoginService {

	@Autowired
	private LoginDao loginDao;

	public boolean loginCustomerByEmail(String username,String password) {
		return this.loginDao.loginCustomerByEmail( username, password);
	}

	public String setRole(LoginDto loginDto) {
		return this.loginDao.setRole(loginDto);
	}
	
	public boolean loginCustomerByMobileNo(String username,String password) {
		return this.loginDao.loginCustomerByMobileNo(username, password);
	}

}
