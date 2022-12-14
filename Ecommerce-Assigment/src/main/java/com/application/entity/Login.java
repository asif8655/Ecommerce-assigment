package com.application.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Login_Data")
public class Login {

	@Id
	private String email;
	private String mobileNo;
	private String password;
	private String role;

	public Login() {
		super();

	}

	

	public Login(String email, String mobileNo, String password, String role) {
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
		return "Login [email=" + email + ", mobileNo=" + mobileNo + ", password=" + password + ", role=" + role + "]";
	}

	

}
