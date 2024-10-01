package com.sonht.springmvc.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "company")
public class Company {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "address")
	private String address;

	@Column(name = "description")
	private String description;

	@Column(name = "email")
	private String email;

	@Column(name = "logo")
	private String logo;

	@Column(name = "name_company")
	private String nameCompany;

	@Column(name = "phone_number")
	private String phoneNumber;

	@Column(name = "status")
	private String status;

	@OneToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
	@JoinColumn(name = "user_id")
	private User user;

	@OneToMany(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
	@JoinColumn(name = "recruitment_id")
	private List<Recruitment> recruitments;
	
	@OneToMany(mappedBy = "company", cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH })
	private List<FollowCompany> followCompanies;
	
	public Company() {
	}

	public Company(String address, String description, String email, String logo, String nameCompany,
			String phoneNumber, String status) {
		this.address = address;
		this.description = description;
		this.email = email;
		this.logo = logo;
		this.nameCompany = nameCompany;
		this.phoneNumber = phoneNumber;
		this.status = status;
	}

	
	public List<Recruitment> getRecruitments() {
		return recruitments;
	}

	public void setRecruitments(List<Recruitment> recruitments) {
		this.recruitments = recruitments;
	}

	public List<FollowCompany> getFollowCompanies() {
		return followCompanies;
	}

	public void setFollowCompanies(List<FollowCompany> followCompanies) {
		this.followCompanies = followCompanies;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Company [id=" + id + ", address=" + address + ", description=" + description + ", email=" + email
				+ ", logo=" + logo + ", nameCompany=" + nameCompany + ", phoneNumber=" + phoneNumber + ", status="
				+ status + "]";
	}

}
