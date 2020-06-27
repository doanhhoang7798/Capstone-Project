package com.fpt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.fpt.dao.PostDao;
import com.fpt.dao.ReactionDao;
import com.fpt.model.Reactions;

public class TestController {

	public static void main(String[] args) {
		
	

	
		
		ReactionDao reactionDaoimpl = new ReactionDao();
		
		PostDao post = new PostDao();

//		Reactions reaction = reactionDaoimpl.isLike(1,24).get(0);

		
			System.out.println("================= run reaction contrller" + post.filter4Hight());

			
			
			
	


	}

}
