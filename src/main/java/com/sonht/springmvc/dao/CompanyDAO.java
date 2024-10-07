package com.sonht.springmvc.dao;

import java.util.List;

import com.sonht.springmvc.entity.Company;

public interface CompanyDAO {

	Company getCompany(int id);

	void saveCompany(Company company);

	void updateImage(String fileName, int userId);

	Long countCompany();

	List<Company> searchByName(String keyword);

	Company getCompanyByUserId(int userId);

	List<Company> findPaginated(int page, int size);

	long count();

}
