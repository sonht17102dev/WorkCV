package com.sonht.springmvc.dao;

import java.util.List;

import com.sonht.springmvc.entity.Category;
import com.sonht.springmvc.entity.Recruitment;

public interface CategoryDAO {

	List<Category> getAlls();

	List<Category> getTop4Categories();

	Category findByName(String name);

	List<Recruitment> findRecruitmentsByCategory(int id);

}
