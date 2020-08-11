package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.Reports;
import model.Users;

@Transactional
@Repository
public class ReportDao {
	private final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

	@SuppressWarnings("unchecked")
	public List<Object> list() {
		Session session = sessionFactory.openSession();
		List<Object> list = session.createQuery(
				"SELECT r.id, c.content, r.type, u.fullname, r.created_at, r.report_author   from Reports as r, Users as u, Comments as c  WHERE r.report_author = u.id AND r.cmt_id = c.id")
				.list();
		return list;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Object> reported(int user_id, int cmt_id) {
		Session session = sessionFactory.openSession();
		List<Object> list = session.createQuery(
				"from Reports r WHERE r.user = "+user_id+" AND r.cmt_id = "+cmt_id+ "")
				.list();
		return list;
	}
	
	
//	@SuppressWarnings("unchecked")
//	public List<Users> waring() {
//		Session session = sessionFactory.openSession();
//		List<Users> list = session.createSQLQuery(
//				"select * from Users u join (select count(reportable_author) as totals, reportable_author as r_user, group_concat(type) as type from Reports group by reportable_author ) r  on u.id =  r .r_user where r.totals >= 5")
//				.list();
//		return list;
//	}
	
	
	@SuppressWarnings("unchecked")
	public List<Users> waring() {
		Session session = sessionFactory.openSession();
		List<Users> list = session.createSQLQuery(
				"select u.id, u.fullname, u.phone, u.image, r.totals , r.type, r.c_id, u.status from Users u join ( select report_author as r_user,ANY_VALUE(cmt_id) as c_id, count(*) as totals,group_concat(type) as type from Reports group by report_author) r  on u.id =  r .r_user  where r.totals >= 5 and u.status = 1")
				.list();
		return list;
	}

	public boolean deleteMany(int user_id) {
		Session session = sessionFactory.openSession();

		try {
			session.getTransaction().begin();
			Query query = session.createQuery("delete from Reports where report_author= '" + user_id + "'");
			query.executeUpdate();
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			return false;
		}
	}

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
