package com.application.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Product_Data")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pId;

	private String name;

	@Column(columnDefinition = "longtext")
	private String description;

	private String img;

	private int quantity;

	private double price;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<Order> order;

	public Product() {
		super();

	}

	public Product(int pId, String name, String description, String img, int quantity, double price) {
		super();
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

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", name=" + name + ", description=" + description + ", img=" + img
				+ ", quantity=" + quantity + ", price=" + price + "]";
	}

}
