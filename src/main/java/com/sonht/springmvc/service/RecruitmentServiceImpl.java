package com.sonht.springmvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonht.springmvc.dao.RecruitmentDAO;
import com.sonht.springmvc.entity.Recruitment;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {

	@Autowired
	RecruitmentDAO recruitmentDAO;
	
	@Override
	@Transactional
	public List<Recruitment> getRecruitments() {
		return recruitmentDAO.getRecruitments();
	}

	@Override
	@Transactional
	public void saveRecruitment(Recruitment recruitment) {
		recruitmentDAO.saveRecruitment(recruitment);
	}

	@Override
	@Transactional
	public Recruitment getRecruitment(int id) {
		return recruitmentDAO.getRecruitment(id);
	}

	@Override
	@Transactional
	public void deleteRecruitment(String id) {
		recruitmentDAO.deleteRecruitment(id);
	}

	@Override
	@Transactional
	public List<Recruitment> findPaginated(int page, int pageSize, int companyId) {
		return recruitmentDAO.findPaginated(page, pageSize, companyId);
	}

	@Override
	@Transactional
	public long count() {
		return recruitmentDAO.count();
	}

	@Override
	@Transactional
	public int getTotalPages(int pageSize) {
		long totalItems = count();
        return (int) Math.ceil((double) totalItems / pageSize);
	}

	@Override
	@Transactional
	public List<Recruitment> getRecruitmentsByCategory(String category) {
		return recruitmentDAO.getRecruitmentsByCategory(category);
	}

	@Override
	@Transactional
	public List<Recruitment> searchByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return recruitmentDAO.searchByKeyword(keyword);
	}

	@Override
	@Transactional
	public List<Recruitment> searchByAddress(String keyword) {
		return recruitmentDAO.searchByAddress(keyword);
	}

	@Override
	@Transactional
	public List<Recruitment> getRecruitmentsByCompany(String companyId) {
		return recruitmentDAO.getRecruitmentsByCompany(companyId);
	}

	@Override
	@Transactional
	public List<Recruitment> findPaginated(int page, int size) {
		return recruitmentDAO.findPaginated(page, size);
	}



}
