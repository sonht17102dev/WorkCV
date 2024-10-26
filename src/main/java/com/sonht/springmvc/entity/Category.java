package com.sonht.springmvc.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "number_choose")
	private int numberChoose;
	
	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
	@JoinColumn(name = "recruitment_id")
	private Recruitment recruitment;

	public Category() {
	}

	public Category(String name, int numberChoose) {
		this.name = name;
		this.numberChoose = numberChoose;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNumberChoose() {
		return numberChoose;
	}

	public void setNumberChoose(int numberChoose) {
		this.numberChoose = numberChoose;
	}

	public Recruitment getRecruitment() {
		return recruitment;
	}

	public void setRecruitment(Recruitment recruitment) {
		this.recruitment = recruitment;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", numberChoose=" + numberChoose + "]";
	}

	
}
