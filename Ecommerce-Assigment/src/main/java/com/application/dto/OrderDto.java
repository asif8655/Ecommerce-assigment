package com.application.dto;

public class OrderDto {
	
	
	
	
	private int productId;
	
	private String customerEmail;

	public OrderDto() {
		super();

	}

	public OrderDto(int productId, String customerEmail) {
		super();
		this.productId = productId;
		this.customerEmail = customerEmail;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	@Override
	public String toString() {
		return "OrderDto [productId=" + productId + ", customerEmail=" + customerEmail + "]";
	}

	
	
}
