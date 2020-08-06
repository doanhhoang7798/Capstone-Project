package service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import dao.UserDao;
import model.Users;


@Service
public class CurrentUser {
	public Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	public Date now = new Date();
	public Random random = new Random();
	public SimpleDateFormat fomart = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);


	@Autowired
	UserDao userDaoimpl;

	public Users current() {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		String key = auth.getName().contains("@") ? "email" : "phone";

		Users CurrentUser = userDaoimpl.setCurrent(auth.getName(), key);

		return CurrentUser;

	}

	public boolean exist() {

		if (current() == null) {
			return false;
		} else {
			return true;
		}

	}

	public boolean isAdminOrMod() {

		if (current().getRole() == 10 | current().getRole() == 5) {
			return true;
		} else {
			return false;
		}

	}

	public int userID() {
		return current().getId();

	}
	
	public int userRole() {
		return current().getRole();

	}
	


}
