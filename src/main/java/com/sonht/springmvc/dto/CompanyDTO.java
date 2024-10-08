package com.sonht.springmvc.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

public class CompanyDTO {
	
	private int id;
	
	@NotEmpty(message = "Hãy nhập Địa chỉ")
	private String address;
	
	@NotEmpty(message = "Hãy nhập mô tả công ty")
	private String description;
	
	@NotEmpty(message = "Hãy nhập email")
	@Email(message = "Email không đúng định dạng")
	private String email;
	
	@NotEmpty(message = "Hãy nhập tên công ty")
	private String nameCompany;
	
	@NotEmpty(message = "Hãy nhập số điện thoại")
	private String phoneNumber;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getNameCompany() {
		return nameCompany;
	}

	public void setNameCompany(String nameCompany) {
		this.nameCompany = nameCompany;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
