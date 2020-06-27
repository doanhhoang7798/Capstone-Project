package com.fpt.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fpt.model.Reactions;

@Transactional
@Repository
public class ReactionDao {

	private final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

	@SuppressWarnings("unchecked")
	public List<Reactions> counter(int post_id) {
		Session session = sessionFactory.openSession();
		List<Reactions> list = session.createQuery("FROM Reactions WHERE post_id = '" + post_id + "'").list();
		return list;
	}

//	@Override
	public Boolean Create(Reactions reactions) {
		Session session = sessionFactory.openSession();
		try {
			session.getTransaction().begin();
			session.save(reactions);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			System.out.println(e);
			if (session.getTransaction() != null) {
				session.getTransaction().rollback();
			}
			return false;
		} finally {
			session.close();
		}
	}

//	@Override
	public Boolean Delete(int user_id, int post_id) {
		Session session = sessionFactory.openSession();
		Reactions reaction = isLike(user_id, post_id);
		try {
			session.getTransaction().begin();
			session.delete(reaction);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			System.out.println(e);
			if (session.getTransaction() != null) {
				session.getTransaction().rollback();
			}
			return false;
		} finally {
			session.close();
		}
	}

//	@Override
	@SuppressWarnings("unchecked")
	public Reactions isLike(int user_id, int post_id) {
		Session session = sessionFactory.openSession();
		Reactions reactions = (Reactions) session
				.createQuery("FROM Reactions WHERE user_id = '" + user_id + "'" + "and post_id = '" + post_id + "'")
				.uniqueResult();

		return reactions;

	}

}
