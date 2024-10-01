package com.sonht.springmvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonht.springmvc.dao.SaveJobDAO;
import com.sonht.springmvc.entity.SaveJob;

@Service
public class SaveJobServiceImpl implements SaveJobService {

	@Autowired
	SaveJobDAO saveJobDAO;
	
	@Override
	@Transactional
	public List<SaveJob> getListSaveJobsByUserId(int id) {
		return saveJobDAO.getListSaveJobsByUserId(id);
	}

	@Override
	@Transactional
	public void deleteSaveJob(int saveJobId) {
		saveJobDAO.deleteSaveJob(saveJobId);
	}

	@Override
	@Transactional
	public void saveSaveJob(SaveJob saveJob) {
		saveJobDAO.saveSaveJob(saveJob);
	}

	@Override
	@Transactional
	public SaveJob findSaveJobByUserIdAndRecruitmentId(int userId, int recruitmentId) {
		return saveJobDAO.findSaveJobByUserIdAndRecruitmentId(userId, recruitmentId);
	}

}
