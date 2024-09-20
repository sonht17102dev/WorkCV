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
		// TODO Auto-generated method stub
		return categoryDAO.getAlls();
	}

	@Override
	@Transactional
	public List<Category> getTop4Categories() {
		// TODO Auto-generated method stub
		return categoryDAO.getTop4Categories();
	}

}
