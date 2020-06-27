package com.fpt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fpt.dao.ReactionDao;
import com.fpt.model.Reactions;
import com.fpt.service.CurrentUser;

//@Controller
@RestController

public class ReactionController {

	@Autowired
	CurrentUser user;

	@Autowired
	ReactionDao reactionDaoimpl;

	@PostMapping(value = "reaction/{id}")
	public Integer reactionString(ModelMap model, @PathVariable("id") int id, HttpServletRequest request) {

		if (reactionDaoimpl.isLike(user.getCurrentUsers().getId(),id) == null) {
			reactionDaoimpl.Create(new Reactions(id, user.getCurrentUsers().getId()));
			
		} else {
			reactionDaoimpl.Delete(user.getCurrentUsers().getId(), id );
		}

		return reactionDaoimpl.counter(id).size();

	}

}
