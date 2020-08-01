package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.*;


@Transactional
@Repository

public class TipNutriDao {

	private final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

	@SuppressWarnings("unchecked")
	public List<TipNutri> list() {
		Session session = sessionFactory.openSession();
		List<TipNutri> list = session.createQuery("From TipNutri").list();
		return list;
	}


	@SuppressWarnings("unchecked")
	public List<TipNutri> findByTypeKind(String type, String kind, int ofset, int limit) {
		Session session = sessionFactory.openSession();
		List<TipNutri> list = session.createQuery("From TipNutri where type= '" + type + "' and kind= '" + kind + "'")
				.setFirstResult(ofset).setMaxResults(limit).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Posts> filterByType(String type) {
		Session session = sessionFactory.openSession();
		List<Posts> list = session.createQuery("FROM Commons where  type= '" + type + "' ORDER BY created_at desc")
				.setMaxResults(6).list();
		return list;
	}

	public TipNutri findByID(int id) {
		try {
			Session session = sessionFactory.openSession();
			TipNutri TipNutri = (TipNutri) session.get(TipNutri.class, id);
			return TipNutri;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public boolean Create(TipNutri TipNutri) {
		Session session = sessionFactory.openSession();
		try {
			session.getTransaction().begin();
			session.save(TipNutri);
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
