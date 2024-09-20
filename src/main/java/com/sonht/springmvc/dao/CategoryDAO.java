package com.sonht.springmvc.dao;

import java.util.List;

import com.sonht.springmvc.entity.Category;

public interface CategoryDAO {

	List<Category> getAlls();

	List<Category> getTop4Categories();

}
