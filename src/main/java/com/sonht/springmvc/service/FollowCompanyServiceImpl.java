package com.sonht.springmvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonht.springmvc.dao.FollowCompanyDAO;
import com.sonht.springmvc.entity.FollowCompany;

@Service
public class FollowCompanyServiceImpl implements FollowCompanyService {
	
	@Autowired
	FollowCompanyDAO followCompanyDAO;
	
	@Override
	@Transactional
	public void save(FollowCompany fc) {
		followCompanyDAO.save(fc);
	}

	@Override
	@Transactional
	public FollowCompany findByCompanyIdAndUserId(int companyId, int userId) {
		return followCompanyDAO.findByCompanyIdAndUserId(companyId, userId);
	}

	@Override
	@Transactional
	public void delete(FollowCompany fc) {
		followCompanyDAO.delete(fc);
	}

	@Override
	@Transactional
	public List<FollowCompany> getListFollowCompaniesByUserId(int userId) {
		return followCompanyDAO.getListFollowCompaniesByUserId(userId);
	}

	@Override
	@Transactional
	public FollowCompany getFollowCompany(String followCompanyId) {
		return followCompanyDAO.getFollowCompany(followCompanyId);
	}

}
