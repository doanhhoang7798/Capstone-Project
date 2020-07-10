package com.fpt.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import org.springframework.social.facebook.api.Post;
import org.springframework.util.DigestUtils;

import com.fpt.dao.CommentDao;
import com.fpt.dao.PostDao;
import com.fpt.dao.ReactionDao;
import com.fpt.dao.ReportDao;
import com.fpt.dao.UserDao;
import com.fpt.model.Posts;
import com.fpt.model.Users;
import com.google.common.base.Charsets;
import com.google.common.hash.HashCode;
import com.google.common.hash.Hashing;

import javassist.bytecode.CodeAttribute;

public class TestController {

	public static void main(String[] args) throws ParseException {

//		ReactionDao reactionDaoimpl = new ReactionDao();
//
		PostDao postDao = new PostDao();
//
//		CommentDao comment = new CommentDao();
//
//		ReportDao reportDao = new ReportDao();
		Date now = new Date();

		SimpleDateFormat fomart = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);

		UserDao userDaoimpl = new UserDao();
		
	
		String say = "Helloo World dididi";
		say.split(" ");	
		int last = say.split(" ").length;
		String dataString = say.split(" ")[(say.split(" ").length-1)];
		System.out.println("================FULL_Code: " + dataString );
		
		



	}

}
