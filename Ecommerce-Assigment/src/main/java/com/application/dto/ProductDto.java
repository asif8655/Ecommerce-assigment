package com.application.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDto {
	
	MultipartFile image;
	
	private int pId;
	
	private String name;
	
	private String description;
	
	private String img;
	
	private int quantity;
	
	private double price;
	
	public ProductDto() {
		super();

	}

	
	public ProductDto(MultipartFile image, int pId, String name, String description, String img, int quantity,
			double price) {
		super();
		this.image = image;
		this.pId = pId;
		this.name = name;
		this.description = description;
		this.img = img;
		this.quantity = quantity;
		this.price = price;
	}


	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}


	public MultipartFile getImage() {
		return image;
	}


	public void setImage(MultipartFile image) {
		this.image = image;
	}


	@Override
	public String toString() {
		return "ProductDto [image=" + image + ", pId=" + pId + ", name=" + name + ", description=" + description
				+ ", img=" + img + ", quantity=" + quantity + ", price=" + price + "]";
	}

	
	

}
