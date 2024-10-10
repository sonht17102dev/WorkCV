package com.sonht.springmvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonht.springmvc.dao.CategoryDAO;
import com.sonht.springmvc.entity.Category;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Override
	@Transactional
	public List<Category> getAlls() {
		return categoryDAO.getAlls();
	}

	@Override
	@Transactional
	public List<Category> getTop4Categories() {
		return categoryDAO.getTop4Categories();
	}

	@Override
	@Transactional
	public Category findByName(String name) {
		return categoryDAO.findByName(name);
	}

}
