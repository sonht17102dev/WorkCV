package com.sonht.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sonht.springmvc.entity.Company;
import com.sonht.springmvc.entity.Recruitment;

@Repository
public class RecruitmentDAOImpl implements RecruitmentDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Recruitment> getRecruitments() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Recruitment> query = currentSession.createQuery("from Recruitment", Recruitment.class);
		
		return query.getResultList();
	}

	@Override
	public void saveRecruitment(Recruitment recruitment) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(recruitment);

	}

	@Override
	public Recruitment getRecruitment(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Recruitment recruitment = currentSession.get(Recruitment.class, id);
		
		return recruitment;
	}

	@Override
	public void deleteRecruitment(String id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Recruitment recruitment = currentSession.get(Recruitment.class, Integer.parseInt(id));
		if(recruitment != null) {
			currentSession.delete(recruitment);
			System.out.println("Bài đăng đã được xoá.");
		}
	}

	@Override
	public List<Recruitment> findPaginated(int page, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
        Query<Recruitment> query = session.createQuery("FROM Recruitment", Recruitment.class);
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
	}

	@Override
	public long count() {
		Session session = sessionFactory.getCurrentSession();
        Query<Long> query = session.createQuery("SELECT COUNT(*) FROM Recruitment", Long.class);
        return query.getSingleResult();
	}

	@Override
	public List<Recruitment> getRecruitmentsByCategory(String category) {
		Session session = sessionFactory.getCurrentSession();
		Query<Recruitment> query = session.createQuery("from Recruitment where category=:theCategory", Recruitment.class);
		query.setParameter("theCategory", category);
		return query.getResultList();
	}

}
