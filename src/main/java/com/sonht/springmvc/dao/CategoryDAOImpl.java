package com.sonht.springmvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sonht.springmvc.entity.Category;

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

}
