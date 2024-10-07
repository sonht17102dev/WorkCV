package com.sonht.springmvc.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sonht.springmvc.entity.VerificationToken;

@Repository
public class TokenDAOImpl implements TokenDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void save(VerificationToken verificationToken) {
		Session session = sessionFactory.getCurrentSession();
		session.save(verificationToken);
	}

	@Override
	public VerificationToken findByToken(String token) {
		Session session = sessionFactory.getCurrentSession();
		
		Query<VerificationToken> query = session.createQuery("from VerificationToken where token=:theToken", VerificationToken.class);
		query.setParameter("theToken", token);
		if(query.getResultList().isEmpty())
			return null;
		return query.getResultList().get(0);
	}

}
