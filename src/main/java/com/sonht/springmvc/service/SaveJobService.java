package com.sonht.springmvc.service;

import java.util.List;

import com.sonht.springmvc.entity.SaveJob;

public interface SaveJobService {

	List<SaveJob> getListSaveJobsByUserId(int id);

	void deleteSaveJob(int saveJobId);

	void saveSaveJob(SaveJob saveJob);

	SaveJob findSaveJobByUserIdAndRecruitmentId(int userId, int recruitmentId);

}
