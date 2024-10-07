package com.sonht.springmvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sonht.springmvc.entity.SaveJob;

@Repository
public class SaveJobDAOImpl implements SaveJobDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<SaveJob> getListSaveJobsByUserId(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<SaveJob> query = currentSession.createQuery("from SaveJob where user_id=:theId", SaveJob.class);

		query.setParameter("theId", id);
		return query.getResultList();
	}

	@Override
	public void deleteSaveJob(int saveJobId) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		SaveJob saveJob = currentSession.get(SaveJob.class, saveJobId);
		currentSession.delete(saveJob);
	}

	@Override
	public void saveSaveJob(SaveJob saveJob) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(saveJob);
	}

	@Override
	public SaveJob findSaveJobByUserIdAndRecruitmentId(int userId, int recruitmentId) {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql = "from SaveJob where user_id=:userId and recruitment_id=:recruitmentId";
		Query<SaveJob> query = currentSession.createQuery(hql, SaveJob.class);
		query.setParameter("userId", userId);
		query.setParameter("recruitmentId", recruitmentId);
		if (query.getResultList().isEmpty()) {
			return null;
		}
		return query.getResultList().get(0);
	}

}
