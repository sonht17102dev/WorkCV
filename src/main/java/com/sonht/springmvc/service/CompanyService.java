package com.sonht.springmvc.service;

import java.util.List;

import com.sonht.springmvc.entity.Company;

public interface CompanyService {

	Company getCompany(int id);

	void saveCompany(Company company);

	void updateImage(String fileName, int userId);

	Long countCompany();

	List<Company> searchByName(String keyword);

	Company getCompanyByUserId(int userId);
}
