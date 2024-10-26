package com.sonht.springmvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sonht.springmvc.entity.FollowCompany;

@Repository
public class FollowCompanyDAOImpl implements FollowCompanyDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(FollowCompany fc) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(fc);
	}

	@Override
	public FollowCompany findByCompanyIdAndUserId(int companyId, int userId) {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql = "from FollowCompany where company_id=:companyId and user_id=:userId";
		Query<FollowCompany> query = currentSession.createQuery(hql, FollowCompany.class);
		query.setParameter("companyId", companyId);
		query.setParameter("userId", userId);
		if(!query.getResultList().isEmpty())
			return query.getResultList().get(0);
		return null;
	}

	@Override
	public void delete(FollowCompany fc) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(fc);
	}

	@Override
	public List<FollowCompany> getListFollowCompaniesByUserId(int userId) {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql = "from FollowCompany where user_id=:userId";
		Query<FollowCompany> query = currentSession.createQuery(hql, FollowCompany.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}

	@Override
	public FollowCompany getFollowCompany(String followCompanyId) {
		Session currentSession = sessionFactory.getCurrentSession();
		FollowCompany fc = currentSession.get(FollowCompany.class, Integer.parseInt(followCompanyId));
		return fc;
	}

}
