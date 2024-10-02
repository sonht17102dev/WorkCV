package com.sonht.springmvc.service;

import java.util.List;

import com.sonht.springmvc.entity.Recruitment;

public interface RecruitmentService {
	
	public List<Recruitment> getRecruitments();

	public void saveRecruitment(Recruitment recruitment);
	
	public Recruitment getRecruitment(int id);

	public void deleteRecruitment(String id);
	
	public List<Recruitment> findPaginated(int page, int pageSize);
	
	public long count();
	
	public int getTotalPages(int pageSize);

	public List<Recruitment> getRecruitmentsByCategory(String category);

	public List<Recruitment> searchByKeyword(String keyword);

	public List<Recruitment> searchByAddress(String keyword);

	public List<Recruitment> getRecruitmentsByCompany(String companyId);

}
