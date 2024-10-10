package com.sonht.springmvc.dao;

import java.util.List;

import com.sonht.springmvc.entity.Recruitment;

public interface RecruitmentDAO {

	public List<Recruitment> getRecruitments();

	public void saveRecruitment(Recruitment recruitment);
	
	public Recruitment getRecruitment(int id);

	public void deleteRecruitment(String id);

	public List<Recruitment> findPaginated(int page, int pageSize, int companyId);

	public long count();

	public List<Recruitment> getRecruitmentsByCategory(String category);

	public List<Recruitment> searchByKeyword(String keyword);

	public List<Recruitment> searchByAddress(String keyword);

	public List<Recruitment> getRecruitmentsByCompany(String companyId);

	public List<Recruitment> findPaginated(int page, int size);

}
