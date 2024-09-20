package com.sonht.springmvc.dao;

import java.util.List;

import com.sonht.springmvc.entity.Recruitment;

public interface RecruitmentDAO {

	public List<Recruitment> getRecruitments();

	public void saveRecruitment(Recruitment recruitment);
	
	public Recruitment getRecruitment(int id);

	public void deleteRecruitment(String id);

	public List<Recruitment> findPaginated(int page, int pageSize);

	public long count();

	public List<Recruitment> getRecruitmentsByCategory(String category);

}
