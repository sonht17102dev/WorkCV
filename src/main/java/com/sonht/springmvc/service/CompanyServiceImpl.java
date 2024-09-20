package com.sonht.springmvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonht.springmvc.dao.CompanyDAO;
import com.sonht.springmvc.entity.Company;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	CompanyDAO companyDAO;
	
	@Override
	@Transactional
	public Company getCompany(int userId) {
		return companyDAO.getCompany(userId);
	}

	@Override
	@Transactional
	public void saveCompany(Company company) {
		companyDAO.saveCompany(company);
	}

	@Override
	@Transactional
	public void updateImage(String fileName, int userId) {
		companyDAO.updateImage(fileName, userId);
		
	}

	@Override
	@Transactional
	public Long countCompany() {
		return companyDAO.countCompany();
	}

}
