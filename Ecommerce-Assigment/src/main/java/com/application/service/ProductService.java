package com.application.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.dao.ProductDao;
import com.application.dto.ProductDto;
import com.application.entity.Product;

@Service
public class ProductService {

	@Autowired
	private ProductDao productDao;

	public boolean insertProduct(ProductDto productDto) {
		return this.productDao.insertProduct(productDto);
	}

	public boolean updateProduct(ProductDto productDto) {
		return this.productDao.updateProduct(productDto);
	}

	public List<Product> getAllProduct() {
		return this.productDao.getAllProduct();
	}

	public List<Product> getProductByName(String pName) {
		return this.productDao.getProdcutBySearch(pName);
	}

	public Product getProductById(int pid) {

		return this.productDao.getProductById(pid);

	}

	public boolean deleteProductById(int id) {
		return this.productDao.deleteProductById(id);
	}

	public int getQuantity(int productId) {
		return this.productDao.getQuantity(productId);
	}

	public void updateQuantity(int dedQuantity, int pId) {
		this.productDao.updateQuantity(dedQuantity, pId);
	}

}
