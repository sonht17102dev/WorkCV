package com.sonht.springmvc.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sonht.springmvc.entity.Cv;

@Repository
public class CvDAOImpl implements CvDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	@Override
	public Cv deleteCv(String id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Cv cv = currentSession.get(Cv.class, Integer.parseInt(id));
		currentSession.delete(cv);
		return cv;
	}

}
