package com.sonht.springmvc.dto;

import java.util.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

public class RecruitmentDTO {
	private int userId;
	private int id;

	@NotEmpty(message = "Hãy nhập địa chỉ")
	private String address; //

	@NotEmpty(message = "Hãy nhập mô tả công việc")
	private String description; //

	@NotEmpty(message = "Hãy nhập kinh nghiệm")
	private String experience; //

	@Min(value = 1, message = "Số người cần tuyển phải lớn hơn 0")
	private int quantity; //

	@NotEmpty(message = "Hãy nhập lương")
	private String salary; //

	@NotEmpty(message = "Hãy nhập tiêu đề bài tuyển dụng")
	private String title; //

	@NotEmpty(message = "Hãy chọn loại công việc")
	private String type; //

	@NotEmpty(message = "Hãy chọn công việc")
	private String category; //

	@NotNull(message = "Hãy chọn hạn ứng tuyển")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date deadline; //

	public RecruitmentDTO() {

	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public RecruitmentDTO(int id, int userId, @NotEmpty(message = "Hãy nhập địa chỉ") String address,
			@NotEmpty(message = "Hãy nhập mô tả công việc") String description,
			@NotEmpty(message = "Hãy nhập kinh nghiệm") String experience,
			@Min(value = 1, message = "Số người cần tuyển phải lớn hơn 0") int quantity,
			@NotEmpty(message = "Hãy nhập lương") String salary,
			@NotEmpty(message = "Hãy nhập tiêu đề bài tuyển dụng") String title,
			@NotEmpty(message = "Hãy chọn loại công việc") String type,
			@NotEmpty(message = "Hãy chọn công việc") String category,
			@NotNull(message = "Hãy chọn hạn ứng tuyển") Date deadline) {
		this.id = id;
		this.userId = userId;
		this.address = address;
		this.description = description;
		this.experience = experience;
		this.quantity = quantity;
		this.salary = salary;
		this.title = title;
		this.type = type;
		this.category = category;
		this.deadline = deadline;
	}

	@Override
	public String toString() {
		return "RecruitmentDTO [userId=" + userId + ", id=" + id + ", address=" + address + ", description="
				+ description + ", experience=" + experience + ", quantity=" + quantity + ", salary=" + salary
				+ ", title=" + title + ", type=" + type + ", category=" + category + ", deadline=" + deadline + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
