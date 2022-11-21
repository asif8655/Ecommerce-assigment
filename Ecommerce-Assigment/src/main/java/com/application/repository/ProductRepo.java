package com.application.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.application.entity.Product;

public interface ProductRepo extends JpaRepository<Product, Integer> {

	public List<Product> findByNameContaining(String name);

	@Query(nativeQuery = true, value = "select quantity from product_data where pId=?")
	int countProductQuantity(@Param("pId") int id);

	@Transactional
	@Modifying
	@Query(nativeQuery = true, value = "update product_data set quantity=? where pId=?")
	void updateQuantity(@Param("quantity") int dedQuantity, @Param("pId") int pId);

}
