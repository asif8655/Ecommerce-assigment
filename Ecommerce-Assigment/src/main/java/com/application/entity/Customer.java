package com.application.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Customer_Data")
public class Customer {
	@Id
	private String email;
	@Column(nullable = false)
	private String password;
	@Column(unique = true, nullable = false)
	private String userName;
	@Column(nullable = false)
	private String name;
	@Column(unique = true, nullable = false)
	private String mobileNo;
	@Column(nullable = false)
	private String address;
	@Transient
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Order order;

	public Customer() {
		super();

	}

	public Customer(String email, String password, String userName, String name, String mobileNo, String address) {
		super();
		this.email = email;
		this.password = password;
		this.userName = userName;
		this.name = name;
		this.mobileNo = mobileNo;
		this.address = address;

	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "CustomerDto [email=" + email + ", password=" + password + ", userName=" + userName + ", name=" + name
				+ ", mobileNo=" + mobileNo + ", address=" + address + "]";
	}

}
