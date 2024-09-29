package com.sonht.springmvc.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sonht.springmvc.entity.ApplyPost;

@Repository
public class ApplyPostDAOImpl implements ApplyPostDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<ApplyPost> getApplyPostsByRecruitmentId(int recruitmentId) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<ApplyPost> query = currentSession.createQuery("From ApplyPost where recruitment_id=:id", ApplyPost.class);
		query.setParameter("id", recruitmentId);
		return query.getResultList();
	}

	@Override
	public void approveCV(String id) {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql = "update ApplyPost set status=1 where id=:theId";
		Query query = currentSession.createQuery(hql);
		query.setParameter("theId", Integer.parseInt(id));
		query.executeUpdate();
	}

	@Override
	public Long countCandidate() {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql = "Select count(*) from ApplyPost";
		Query<Long> query = currentSession.createQuery(hql, Long.class);
		
		return query.getSingleResult();
	}

	@Override
	public List<ApplyPost> getAlls() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<ApplyPost> query = currentSession.createQuery("From ApplyPost", ApplyPost.class);
		return query.getResultList();
	}

	@Override
	public void updateTextByRecruitmentId(int recruitmentId, int userLoginId, String text) {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql = "update ApplyPost set text=:theText where recruitment_id=:theReId and user_id=:theUserId";
		Query query = currentSession.createQuery(hql);
		query.setParameter("theText", text);
		query.setParameter("theReId", recruitmentId);
		query.setParameter("theUserId", userLoginId);
		query.executeUpdate();
		
	}

	@Override
	public boolean checkUserApplied(int recruitmentId, int userLoginId, String text) {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql = "from ApplyPost where recruitment_id=:theReId and user_id=:theUserId";
		Query query = currentSession.createQuery(hql);
		query.setParameter("theReId", recruitmentId);
		query.setParameter("theUserId", userLoginId);
		if(query.getResultList().isEmpty()) {
			return false;
		}
		return true;
	}


}
