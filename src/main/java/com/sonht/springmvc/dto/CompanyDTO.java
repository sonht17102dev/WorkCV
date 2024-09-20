package com.sonht.springmvc.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

public class CompanyDTO {
	@Override
	public String toString() {
		return "CompanyDTO [address=" + address + ", description=" + description + ", email=" + email + ", logo=" + logo
				+ ", nameCompany=" + nameCompany + ", phoneNumber=" + phoneNumber + ", userId=" + userId + "]";
	}
	private int id;
	
	@NotEmpty(message = "Hãy nhập Địa chỉ")
	private String address;
	
	@NotEmpty(message = "Hãy nhập mô tả bản thân")
	private String description;
	
	@NotEmpty(message = "Hãy nhập email")
	@Email(message = "Email không đúng định dạng")
	private String email;
	
	@NotEmpty(message = "Hãy chọn logo")
	private String logo;
	
	@NotEmpty(message = "Hãy nhập tên công ty")
	private String nameCompany;
	
	@NotEmpty(message = "Hãy nhập số điện thoại")
	private String phoneNumber;

	private int userId;
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

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

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
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
