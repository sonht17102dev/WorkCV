package com.sonht.springmvc.service;

import java.util.List;

import com.sonht.springmvc.entity.ApplyPost;

public interface ApplyPostService {

	List<ApplyPost> getApplyPostsByRecruitmentId(int recruitmentId);

	void approveCV(String id);

	Long countCandidate();

	List<ApplyPost> getAlls();

}
