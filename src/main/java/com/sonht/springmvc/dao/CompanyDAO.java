package com.sonht.springmvc.dao;

import com.sonht.springmvc.entity.Company;

public interface CompanyDAO {

	Company getCompany(int userId);

	void saveCompany(Company company);

	void updateImage(String fileName, int userId);

	Long countCompany();

}
