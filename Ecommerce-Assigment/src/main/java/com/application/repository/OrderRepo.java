package com.application.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.application.entity.Customer;
import com.application.entity.Order;

public interface OrderRepo extends JpaRepository<Order, Integer> {

	public List<Order> findAllByCustomer(Customer customer);

	@Query(nativeQuery = true, value = "select count(*) from order_data where pId=?")
	int countProduct(@Param("pId") int id);

}
