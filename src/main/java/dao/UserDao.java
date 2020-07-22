package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Charsets;
import com.google.common.hash.HashCode;
import com.google.common.hash.Hashing;

import model.Users;

@Transactional
@Repository
public class UserDao {

	private final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

	@SuppressWarnings("unchecked")


//	@Override
	public List<Users> all() {
		Session session = sessionFactory.openSession();
		List<Users> list = session.createQuery("select count(*) from Users").list();
		return list;
	}

	@SuppressWarnings("unchecked")
//	@Override
	public List<Users> filterByStatus(int value) {
		Session session = sessionFactory.openSession();
		List<Users> list = session.createQuery("From Users where status ='" + value + "'").list();
		return list;
	}

	public Users checkLogin(String username, String password, String key) {
		Session session = sessionFactory.openSession();
		Users user = (Users) session
				.createQuery("from Users where " + key + "='" + username + "' and password ='" + password + "'")
				.uniqueResult();
		return user;
	}

//	@Override
	public Users findByID(int id) {
		try {
			Session session = sessionFactory.openSession();
			Users user = (Users) session.get(Users.class, id);
			return user;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	public boolean setStatus(Integer id, int value, String time) {
		Session ses = sessionFactory.openSession();
		try {
			ses.getTransaction().begin();
			Query query = (Query) ses.createQuery(
					"update Users set status ='" + value + "', block_date ='" + time + "' where id = '" + id + "'");
			query.executeUpdate();
			ses.getTransaction().commit();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			ses.close();
		}
		return true;
	}

	public boolean changeRole(Integer id, int value) {
		Session ses = sessionFactory.openSession();
		try {
			ses.getTransaction().begin();
			Query query = (Query) ses.createQuery("update Users set role ='" + value + "' where id = '" + id + "'");
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
	public Boolean Update(Users user) {
		Session session = sessionFactory.openSession();
		try {
			session.getTransaction().begin();
			session.update(user);
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
	public Boolean Create(Users user) {
		Session session = sessionFactory.openSession();
		try {
			session.getTransaction().begin();
			session.save(user);
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
	public Users setCurrent(String phone, String key) {
		try {
			Session session = sessionFactory.openSession();
			Users user = (Users) session.createQuery("FROM Users WHERE " + key + " ='" + phone + "'").uniqueResult();
			return user;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public Users findByPhone(String phone) {
		try {
			Session session = sessionFactory.openSession();
			Users user = (Users) session.createQuery("FROM Users WHERE phone ='" + phone + "'").uniqueResult();
			return user;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	public Boolean ChangePassword(int id, String password, String code) {
		Session ses = sessionFactory.openSession();

		try {
			ses.getTransaction().begin();
			Query query = (Query) ses
					.createQuery("UPDATE Users SET password = '" + password + "', confirm_code = '"+ code+"' WHERE (id = '" + id + "')");
			query.executeUpdate();
			ses.getTransaction().commit();
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}

	public String encode(String clear_password) {   
		HashCode hash = Hashing.md5()
				.hashString(clear_password, Charsets.UTF_8);
		String password = hash.toString() + hash.toString() + hash.toString();
	        return password;
	}
}
