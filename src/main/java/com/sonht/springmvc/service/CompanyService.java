package com.sonht.springmvc.service;

import com.sonht.springmvc.entity.Company;

public interface CompanyService {

	Company getCompany(int userId);

	void saveCompany(Company company);

	void updateImage(String fileName, int userId);

	Long countCompany();
}
