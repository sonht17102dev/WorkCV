package com.sonht.springmvc.service;

import java.util.List;

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
	public Company getCompanyByUserId(int userId) {
		return companyDAO.getCompanyByUserId(userId);
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

	@Override
	@Transactional
	public List<Company> searchByName(String keyword) {
		return companyDAO.searchByName(keyword);
	}

	@Override
	@Transactional
	public Company getCompany(int id) {
		return companyDAO.getCompany(id);
	}

}
