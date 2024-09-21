package com.sonht.springmvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sonht.springmvc.entity.Company;
import com.sonht.springmvc.entity.Recruitment;

@Repository
public class CompanyDAOImpl implements CompanyDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Company getCompany(int userId) {
		Session currentSession = sessionFactory.getCurrentSession();

		Query<Company> query = currentSession.createQuery("from Company where user_id=:theUserId", Company.class);
		query.setParameter("theUserId", userId);
		if(!query.getResultList().isEmpty()) {
			Company company = query.getResultList().get(0);
			return company;
		}
		
		return null;
	}

	@Override
	public void saveCompany(Company company) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(company);
	}

	@Override
	public void updateImage(String fileName, int userId) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		String hql = "Update Company c set c.logo=:logo where c.user.id = :theUserId ";
		Query query = currentSession.createQuery(hql);
		query.setParameter("logo", fileName);
		query.setParameter("theUserId", userId);
		query.executeUpdate();
	}

	@Override
	public Long countCompany() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		String hql = "SELECT COUNT(*) from Company";
		Query<Long> query = currentSession.createQuery(hql, Long.class);
		return query.getSingleResult();
	}

	@Override
	public List<Company> searchByName(String keyword) {
		Session session = sessionFactory.getCurrentSession();
		Query<Company> query = session.createQuery("from Company c where c.nameCompany LIKE :keyword", Company.class);
		query.setParameter("keyword", "%"+keyword+"%");
		return query.getResultList();
	}

}
