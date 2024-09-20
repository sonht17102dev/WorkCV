package com.sonht.springmvc.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

import org.springframework.lang.NonNull;
import org.springframework.lang.NonNullFields;

public class RecruiterDTO {

	private int id;

	@NotEmpty(message = "Hãy nhập email")
	@Email(message = "Email không đúng định dạng")
	private String email;

	@NotEmpty(message = "Hãy nhập họ và tên")
	private String fullName;

	@NotEmpty(message = "Hãy nhập Địa chỉ")
	private String address;

	@NotEmpty(message = "Hãy nhập số điện thoại")
	private String phoneNumber;

	@NotEmpty(message = "Hãy chọn mô tả bản thân")
	private String description;
	
	@NotEmpty(message="Hãy chọn hình ảnh tải lên")
	private String image;

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "RecruiterDTO [id=" + id + ", email=" + email + ", fullName=" + fullName + ", address=" + address
				+ ", phoneNumber=" + phoneNumber + ", description=" + description + "]";
	}

}
