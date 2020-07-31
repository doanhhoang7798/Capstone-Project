package  controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import  dao.PostDao;
import  dao.ReactionDao;
import  model.Reactions;
import  service.CurrentUser;

@RestController

public class ReactionController {

	@Autowired
	CurrentUser user;

	@Autowired
	ReactionDao reactionDaoimpl;

	@Autowired
	PostDao postDaoimpl;

	@PostMapping(value = "reaction/{id}")
	public Integer reactionString(ModelMap model, @PathVariable("id") int id, HttpServletRequest request) {

		if (reactionDaoimpl.isLike(user.userID(), id) == null) {
			reactionDaoimpl.Create(new Reactions(postDaoimpl.findByID(id), user.current()));

		} else {
			reactionDaoimpl.Delete(user.current().getId(), id);
		}

		return reactionDaoimpl.counter(id).size();

	}

}
