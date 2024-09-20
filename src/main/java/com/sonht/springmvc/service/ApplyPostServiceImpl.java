package com.sonht.springmvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonht.springmvc.dao.ApplyPostDAO;
import com.sonht.springmvc.entity.ApplyPost;

@Service
public class ApplyPostServiceImpl implements ApplyPostService {

	@Autowired
	ApplyPostDAO applyPostDAO;
	
	@Override
	@Transactional
	public List<ApplyPost> getApplyPostsByRecruitmentId(int recruitmentId) {
		return applyPostDAO.getApplyPostsByRecruitmentId(recruitmentId);
	}

	@Override
	@Transactional
	public void approveCV(String id) {
		applyPostDAO.approveCV(id);
		
	}

	@Override
	@Transactional
	public Long countCandidate() {
		// TODO Auto-generated method stub
		return applyPostDAO.countCandidate();
	}

	@Override
	@Transactional
	public List<ApplyPost> getAlls() {
		// TODO Auto-generated method stub
		return applyPostDAO.getAlls();
	}

}
