package com.application.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import com.application.entity.Login;

public interface LoginRepo extends JpaRepository<Login, String>{
	
	public List<Login> findByMobileNo(String mobileNo);

}
