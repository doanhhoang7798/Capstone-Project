package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.Comments;

@Transactional
@Repository

public class CommentDao {

	private final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

	@SuppressWarnings("unchecked")
	public List<Comments> list() {
		Session session = sessionFactory.openSession();
		List<Comments> list = session.createQuery("From Comments" ).list();
		return list;
	}
	
	
//	@Override
	public Comments findByID(int id) {
		try {
			Session session = sessionFactory.openSession();
			Comments comment = (Comments) session.get(Comments.class, id);
			return comment;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
//	@Override
		public Boolean Delete(int id) {
		Session session = sessionFactory.openSession();
		Comments comment = (Comments) session.get(Comments.class, id);
		try {
			session.getTransaction().begin();
			session.delete(comment);
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
		
		
//		@Override
		public Comments Update(Comments comment) {
			Session session = sessionFactory.openSession();
			try {
				session.getTransaction().begin();
				session.update(comment);
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
