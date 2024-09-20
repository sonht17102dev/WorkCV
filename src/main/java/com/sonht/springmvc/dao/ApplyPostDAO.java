package com.sonht.springmvc.dao;

import java.util.List;

import com.sonht.springmvc.entity.ApplyPost;

public interface ApplyPostDAO {

	List<ApplyPost> getApplyPostsByRecruitmentId(int recruitmentId);

	void approveCV(String id);

	Long countCandidate();

	List<ApplyPost> getAlls();

}
