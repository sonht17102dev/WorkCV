package com.sonht.springmvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sonht.springmvc.entity.Category;
import com.sonht.springmvc.entity.Recruitment;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Category> getAlls() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Category> query = currentSession.createQuery("From Category", Category.class);
		
		return query.getResultList();
	}

	@Override
	public List<Category> getTop4Categories() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Category> query = currentSession.createQuery("From Category c ORDER BY c.numberChoose DESC", Category.class);
		query.setMaxResults(4);
		return query.getResultList();
	}

	@Override
	public Category findByName(String name) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Category> query = currentSession.createQuery("From Category where name=:theName", Category.class);
		query.setParameter("theName", name);
		return query.getResultList().get(0);
	}

	@Override
	public List<Recruitment> findRecruitmentsByCategory(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Recruitment> query = currentSession.createQuery("From Recruitment where category_id=:theId", Recruitment.class);
		query.setParameter("theId", id);
		return query.getResultList();
	}

}
