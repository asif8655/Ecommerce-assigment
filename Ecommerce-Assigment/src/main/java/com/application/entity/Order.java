package com.application.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Order_Data")
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int orderId;

	@ManyToOne
	@JoinColumn(name = "pId")
	private Product product;

	@ManyToOne
	@JoinColumn(name = "email")
	private Customer customer;

	@Column(name = "orderDate", nullable = false, columnDefinition = "TIMESTAMP default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP")
	private Date orderDate = new Date();

	public Order() {
		super();

	}

	public Order(int orderId, Product product, Customer customer, Date orderDate) {
		super();
		this.orderId = orderId;
		this.product = product;
		this.customer = customer;
		this.orderDate = orderDate;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", product=" + product + ", customer=" + customer + ", OrderDate="
				+ orderDate + "]";
	}

}
