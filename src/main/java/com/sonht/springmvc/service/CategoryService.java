package com.sonht.springmvc.service;

import java.util.List;

import com.sonht.springmvc.entity.Category;

public interface CategoryService {

	List<Category> getAlls();

	List<Category> getTop4Categories();

}
