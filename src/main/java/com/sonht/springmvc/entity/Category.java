package com.sonht.springmvc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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

}
