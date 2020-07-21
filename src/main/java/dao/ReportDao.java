package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.Reports;

@Transactional
@Repository
public class ReportDao {
	private final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

	@SuppressWarnings("unchecked")
	public List<Object> list() {
		Session session = sessionFactory.openSession();
		List<Object> list = session.createQuery(
				"SELECT r.id, c.content, r.type, u.fullname, r.created_at from Reports as r, Users as u, Comments as c  WHERE r.user = u.id AND r.reportable_id = c.id")
				.list();
		return list;
	}

	public boolean deleteMany(int user_id) {
		Session session = sessionFactory.openSession();

		try {
			session.getTransaction().begin();
			Query query = session.createQuery("delete from Reports where reportable_author= '" + user_id + "'");
			query.executeUpdate();
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			return false;
		}
	}

	// @Override
	public boolean Create(Reports reports) {
		Session session = sessionFactory.openSession();
		try {
			session.getTransaction().begin();
			session.save(reports);
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
	public Boolean Delete(int id) {
		Session session = sessionFactory.openSession();
		Reports reports = (Reports) session.get(Reports.class, id);
		try {
			session.getTransaction().begin();
			session.delete(reports);
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
