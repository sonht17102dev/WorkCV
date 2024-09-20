package com.sonht.springmvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sonht.springmvc.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<User> getUsers() {
		// get the current hibernate session
//		Session currentSession = sessionFactory.getCurrentSession();

		return null;
	}

	@Override
	public void saveUser(User user) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(user);
	}

	@Override
	public User getUser(int id) {
		Session currentSession = sessionFactory.getCurrentSession();

		User user = currentSession.get(User.class, id);

		return user;
	}

	@Override
	public void deleteUser(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public User getUserByEmail(String email) {
		Session currentSession = sessionFactory.getCurrentSession();

		Query<User> query = currentSession.createQuery("from User where email=:theEmail", User.class);

		query.setParameter("theEmail", email);
		if (!query.getResultList().isEmpty()) {
			User user = query.getResultList().get(0);
			return user;
		}

		return null;
	}

	@Override
	public void updateImage(String photo, int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql = "UPDATE User u SET u.image = :image WHERE u.id = :id ";
		Query query = currentSession.createQuery(hql);
		query.setParameter("image", photo);
		query.setParameter("id", id);
		query.executeUpdate();
	}

}
