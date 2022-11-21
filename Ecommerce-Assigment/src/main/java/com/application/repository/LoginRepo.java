package com.application.repository;

import org.springframework.data.repository.CrudRepository;

import com.application.entity.Login;

public interface LoginRepo extends CrudRepository<Login, String>{

}
