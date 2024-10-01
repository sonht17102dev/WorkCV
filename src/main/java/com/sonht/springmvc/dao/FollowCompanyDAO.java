package com.sonht.springmvc.dao;

import java.util.List;

import com.sonht.springmvc.entity.FollowCompany;

public interface FollowCompanyDAO {

	void save(FollowCompany fc);

	FollowCompany findByCompanyIdAndUserId(int companyId, int userId);

	void delete(FollowCompany fc);

	List<FollowCompany> getListFollowCompaniesByUserId(int userId);

}
