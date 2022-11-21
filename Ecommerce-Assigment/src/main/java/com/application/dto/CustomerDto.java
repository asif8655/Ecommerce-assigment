package com.application.dto;

import java.io.Serializable;

public class CustomerDto implements Serializable {

	

	private String email;

	private String password;

	private String userName;

	private String name;

	private String mobileNo;

	private String address;

	public CustomerDto() {
		super();

	}

	public CustomerDto(String email, String password, String userName, String name, String mobileNo, String address) {
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
