package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import dao.UserDao;
import model.Users;
import com.google.common.base.Charsets;
import com.google.common.hash.HashCode;
import com.google.common.hash.Hashing;

@Service
public class CurrentUser {

	@Autowired
	UserDao userDaoimpl;

	public Users getCurrentUsers() {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		String key = auth.getName().contains("@") ? "email" : "phone";

		Users CurrentUser = userDaoimpl.setCurrent(auth.getName(), key);

		return CurrentUser;

	}

	public boolean exist() {

		if (getCurrentUsers() == null) {
			return false;
		} else {
			return true;
		}

	}

	public boolean isAdminOrMod() {

		if (getCurrentUsers().getRole() == 10 | getCurrentUsers().getRole() == 5) {
			return true;
		} else {
			return false;
		}

	}

	public int userID() {
		return getCurrentUsers().getId();

	}
	
	public int userRole() {
		return getCurrentUsers().getRole();

	}
	


}
