package com.sonht.springmvc.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "recruitment")
public class Recruitment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "address")
	private String address;

	@Column(name = "created_at")
	private String createdAt;

	@Column(name = "description")
	private String description;

	@Column(name = "experience")
	private String experience;

	@Column(name = "quantity")
	private int quantity;

	@Column(name = "ranked")
	private String ranked;

	@Column(name = "salary")
	private String salary;

	@Column(name = "status")
	private String status;

	@Column(name = "title")
	private String title;

	@Column(name = "type")
	private String type;

	@Column(name = "view")
	private int view;

	@Column(name = "category")
	private String category;

	@ManyToOne
	@JoinColumn(name = "company_id")
	private Company company;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "applypost")
	private List<ApplyPost> applyPosts;
	
	@ManyToMany(fetch = FetchType.LAZY, 
			cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinTable(
			name="save_job",
			joinColumns = @JoinColumn(name="user_id"),
			inverseJoinColumns = @JoinColumn(name="recruitment_id")
			)
	private List<User> users;
	


	@Column(name = "deadline")
	private String deadline;

	public Recruitment() {
	}

	public Recruitment(String address, String createdAt, String description, String experience, int quantity,
			String salary, String status, String title, String type, String category, Company company,
			String deadline) {
		this.address = address;
		this.createdAt = createdAt;
		this.description = description;
		this.experience = experience;
		this.quantity = quantity;
		this.salary = salary;
		this.status = status;
		this.title = title;
		this.type = type;
		this.category = category;
		this.company = company;
		this.deadline = deadline;
	}
	// add a convenience method
	public void addUser(User user) {
		if(user == null) 
			users = new ArrayList<User>();
		
		users.add(user);
	}
	public List<ApplyPost> getApplyPosts() {
		return applyPosts;
	}
	
	public void setApplyPosts(List<ApplyPost> applyPosts) {
		this.applyPosts = applyPosts;
	}
	
	public void setRanked(String ranked) {
		this.ranked = ranked;
	}
	@Override
	public String toString() {
		return "Recruitment [id=" + id + ", address=" + address + ", createdAt=" + createdAt + ", description="
				+ description + ", experience=" + experience + ", quantity=" + quantity + ", ranked=" + ranked
				+ ", salary=" + salary + ", status=" + status + ", title=" + title + ", type=" + type + ", view=" + view
				+ ", category=" + category + ", company=" + company + ", deadline=" + deadline + "]";
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

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
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

	public String getRanked() {
		return ranked;
	}

	public void setRank(String ranked) {
		this.ranked = ranked;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

}
