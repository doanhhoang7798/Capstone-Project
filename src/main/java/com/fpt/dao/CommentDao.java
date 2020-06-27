package com.fpt.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fpt.model.Comments;

@Transactional
@Repository

public class CommentDao {

	private final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

//	@Override
	public Comments Create(Comments comment) {
		Session session = sessionFactory.openSession();
		try {
			session.getTransaction().begin();
			session.save(comment);
			session.getTransaction().commit();

			return comment;
		} catch (Exception e) {
			System.out.println(e);
			if (session.getTransaction() != null) {
				session.getTransaction().rollback();
			}
			return null;
		} finally {
			session.close();
		}
	}
}
