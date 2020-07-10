package com.fpt.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fpt.model.Posts;

@Transactional
@Repository

public class PostDao {

	private final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

	@SuppressWarnings("unchecked")
	public List<Posts> filterHomePage(String condition) {
		Session session = sessionFactory.openSession();
		List<Posts> list = session.createQuery("FROM Posts where deleted_at = 'NULL' ORDER BY " + condition + " desc")
				.setMaxResults(4).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Posts> all() {
		Session session = sessionFactory.openSession();
		List<Posts> list = session.createQuery("From Posts").list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Posts> filterOderByLike() {
		Session session = this.sessionFactory.openSession();

		try {
			String sql = "select * from Posts join (SELECT count(post_id) as totals, post_id as postID From Reactions GROUP BY post_id  ORDER BY totals DESC limit 2 ) as able on Posts.Id  = able.postID where deleted_at != 'NULL'";
			List<Posts> list = session.createSQLQuery(sql).list();
			return list;

		} catch (Exception e) {
			System.out.println(e);
			session.close();
			return null;

		}

	}

	@SuppressWarnings("unchecked")
	public List<Posts> list(String condition) {
		Session session = sessionFactory.openSession();
		List<Posts> list = session.createQuery("From Posts where deleted_at" + condition).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Object> viewCountAll() {
		Session session = sessionFactory.openSession();
		List<Object> list = session.createQuery("SELECT SUM(view_conter) as total  FROM Posts").list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Posts> refer(String kind) {
		Session session = sessionFactory.openSession();
		List<Posts> list = session.createQuery("From Posts where deleted_at='NULL' and kind ='" + kind + "'")
				.setMaxResults(4).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Posts> pagination(String category, String condition, int ofset, int limit) {
		Session session = sessionFactory.openSession();
		List<Posts> list = session
				.createQuery("From Posts where  deleted_at = 'NULL' and " + category + " = '" + condition + "'")
				.setFirstResult(ofset).setMaxResults(limit).list();
		return list;
	}

	public boolean viewCount(Integer id) {
		Session ses = sessionFactory.openSession();
		try {
			ses.getTransaction().begin();
			Query query = (Query) ses
					.createQuery("update Posts set view_conter = (view_conter + 1) where id = '" + id + "'");
			query.executeUpdate();
			ses.getTransaction().commit();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			ses.close();
		}
		return true;
	}

//	@Override
	public Posts findByID(int id) {
		try {
			Session session = sessionFactory.openSession();
			Posts post = (Posts) session.get(Posts.class, id);
			return post;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	public boolean setStatus(Integer id, String value) {
		Session ses = sessionFactory.openSession();
		try {
			ses.getTransaction().begin();
			Query query = (Query) ses
					.createQuery("update Posts set deleted_at ='" + value + "' where id = '" + id + "'");
			query.executeUpdate();
			ses.getTransaction().commit();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			ses.close();
		}
		return true;
	}

//	@Override
	public Integer Create(Posts post) {
		Session session = sessionFactory.openSession();
		try {
			session.getTransaction().begin();
			session.save(post);
			session.getTransaction().commit();

			return post.getId();
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

//	@Override
	public boolean Update(Posts post) {
		Session session = sessionFactory.openSession();
		try {
			session.getTransaction().begin();
			session.update(post);
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

}
