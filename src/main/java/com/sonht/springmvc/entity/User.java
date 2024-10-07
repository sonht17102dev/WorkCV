package com.sonht.springmvc.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {
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

	@Column(name = "full_name")
	private String fullName;

	@Column(name = "image")
	private String image;

	@Column(name = "password")
	private String password;

	@Column(name = "phone_number")
	private String phoneNumber;

	@Column(name = "status")
	private String status;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "role_id")
	private Role role;

	@OneToMany(mappedBy = "user", cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH })
	private List<ApplyPost> applyPosts;

	@OneToMany(mappedBy = "user", cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH })
	private List<SaveJob> saveJobs;
	
	@OneToMany(mappedBy = "user", cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH })
	private List<FollowCompany> followCompanies;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "cv_id")
	private Cv cv;
	
	@Column(name = "is_verified")
	private int isVerified = 0;
	
	public User() {
	}

	public User(String address, String description, String email, String fullName, String image, String password,
			String phoneNumber, String status) {
		this.address = address;
		this.description = description;
		this.email = email;
		this.fullName = fullName;
		this.image = image;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.status = status;
	}

	public User(String email, String fullName, String password, String status, Role role) {
		this.email = email;
		this.fullName = fullName;
		this.password = password;
		this.status = status;
		this.role = role;
	}

	public User(String address, String description, String fullName, String image, String phoneNumber) {
		this.address = address;
		this.description = description;
		this.fullName = fullName;
		this.image = image;
		this.phoneNumber = phoneNumber;
	}
	
	public int getIsVerified() {
		return isVerified;
	}

	public void setIsVerified(int isVerified) {
		this.isVerified = isVerified;
	}

	public List<FollowCompany> getFollowCompanies() {
		return followCompanies;
	}

	public void setFollowCompanies(List<FollowCompany> followCompanies) {
		this.followCompanies = followCompanies;
	}

	public List<SaveJob> getSaveJobs() {
		return saveJobs;
	}

	public void setSaveJobs(List<SaveJob> saveJobs) {
		this.saveJobs = saveJobs;
	}

	public void setApplyPosts(List<ApplyPost> applyPosts) {
		this.applyPosts = applyPosts;
	}

	public List<ApplyPost> getApplyPosts() {
		return applyPosts;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public Role getRole() {
		return role;
	}

	public Cv getCv() {
		return cv;
	}

	public void setCv(Cv cv) {
		this.cv = cv;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", address=" + address + ", description=" + description + ", email=" + email
				+ ", fullName=" + fullName + ", image=" + image + ", password=" + password + ", phoneNumber="
				+ phoneNumber + ", status=" + status + "]";
	}


}
