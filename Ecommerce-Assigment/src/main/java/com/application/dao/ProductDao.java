package com.application.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.datamap.DataMap;
import com.application.dto.ProductDto;
import com.application.entity.Product;
import com.application.repository.ProductRepo;

@Repository
public class ProductDao {

	@Autowired
	private ProductRepo productRepo;

	public List<Product> getAllProduct() {

		List<Product> products = new ArrayList<>();
		this.productRepo.findAll().forEach(products::add);
		return products;
	}

	public boolean insertProduct(ProductDto productDto) {

		Product product = DataMap.productDataMap(productDto);
		if (!this.productRepo.existsById(productDto.getpId())) {
			this.productRepo.save(product);
			return true;
		}
		return false;
	}

	public boolean updateProduct(ProductDto productDto) {
		if (this.productRepo.existsById(productDto.getpId())) {
			Product product = DataMap.productDataMap(productDto);
			this.productRepo.save(product);
			return true;
		}
		return false;
	}

	public Product getProductById(int pid) {
		Product prod = null;
		Optional<Product> optProduct = this.productRepo.findById(pid);
		if (optProduct.isPresent())
			prod = optProduct.get();
		return prod;
	}

	public List<Product> getProdcutBySearch(String pName) {
		return this.productRepo.findByNameContaining(pName);
	}

	public boolean deleteProductById(int id) {
		this.productRepo.deleteById(id);
		return true;
	}

	public int getQuantity(int productId) {
		return this.productRepo.countProductQuantity(productId);
	}

	public void updateQuantity(int dedQuantity, int pId) {
		this.productRepo.updateQuantity(dedQuantity, pId);
	}

}
