package com.application.dto;

import java.io.Serializable;

public class LoginDto implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1329761868022817486L;
	private String email;
	private String mobileNo;
	private String password;
	private String role;
	
	public LoginDto() {
		super();
		
	}
	
	public LoginDto(String email, String mobileNo, String password, String role) {
		super();
		this.email = email;
		this.mobileNo = mobileNo;
		this.password = password;
		this.role = role;
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
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	@Override
	public String toString() {
		return "LoginDto [email=" + email + ", mobileNo=" + mobileNo + ", password=" + password + ", role=" + role
				+ "]";
	}
	
}
