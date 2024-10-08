package com.sonht.springmvc.dao;

import java.util.List;

import com.sonht.springmvc.entity.ApplyPost;

public interface ApplyPostDAO {

	List<ApplyPost> getApplyPostsByRecruitmentId(int recruitmentId);

	void approveCV(String id);

	Long countCandidate();

	List<ApplyPost> getAlls();

	void updateTextByRecruitmentId(int recruitmentId, int userLoginId, String text);

	boolean checkUserApplied(int recruitmentId, int userLoginId, String text);

	List<ApplyPost> getApplyPostsByUserId(int userId);

	ApplyPost getApplyPostByRecruitmentIdAndUserId(int recruitmentId, int userId);

	void save(ApplyPost aPost);

	void deleteApplyJob(int applyJobId);
}
