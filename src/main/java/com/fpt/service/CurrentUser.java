package com.fpt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.fpt.dao.UserDao;
import com.fpt.model.Users;

@Service
public class CurrentUser {

	@Autowired
	UserDao userDaoimpl;

	public Users getCurrentUsers() {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String key =  auth.getName().contains("@") ? "email" : "phone";

		Users CurrentUser = userDaoimpl.setCurrent(auth.getName(), key);

		return CurrentUser;

	}

}
