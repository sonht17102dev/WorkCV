package com.sonht.springmvc.service;

import java.util.List;

import com.sonht.springmvc.entity.Category;
import com.sonht.springmvc.entity.Recruitment;

public interface CategoryService {

	List<Category> getAlls();

	List<Category> getTop4Categories();

	Category findByName(String name);

	List<Recruitment> findRecruitmentsByCategory(int id);

}
