package  controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import  dao.CommentDao;
import  dao.PostDao;
import  dao.ReactionDao;
import  dao.UserDao;
import  model.Posts;
import  service.CurrentUser;

@Controller

public class PostController {

	@Autowired
	PostDao postDaoimpl;

	@Autowired
	CurrentUser user;

	@Autowired
	UserDao userDaoimpl;

	@Autowired
	ReactionDao reactionDaoimpl;

	@Autowired
	CommentDao commentDaoimpl;

	Timestamp timestamp = new Timestamp(System.currentTimeMillis());

	@GetMapping(value = "/post-show/{id}")
	public String show(ModelMap model, @PathVariable("id") int id) {
		try {
			//////////////////////////////////////////
			postDaoimpl.viewCount(id);
			boolean checkLike = user.exist() ? reactionDaoimpl.isLike(user.userID(), id) == null ? false : true : false;
			model.addAttribute("isLike", checkLike);
			model.addAttribute("post", postDaoimpl.findByID(id));
			model.addAttribute("refer", postDaoimpl.refer(postDaoimpl.findByID(id).getKind()));
			return "static/post/show";

		} catch (Exception e) {
			return "auth/404";
		}

	}

	@GetMapping(value = "post-edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") int id) {

		if (user.isAdminOrMod() | user.getCurrentUsers().getId() == postDaoimpl.findByID(id).getUser().getId()) {
			model.addAttribute("post", postDaoimpl.findByID(id));
			return "static/post/edit";
		} else {
			return "auth/401";

		}

	}

	@GetMapping(value = "/post-create")
	public String nEw(ModelMap model) {

		if (user.exist()) {
			return "static/post/create";
		} else {
			return "auth/401";
		}

	}

	@PostMapping(value = "/post-edit/{id}")
	public String update(ModelMap model, @PathVariable("id") int post_id, @RequestParam("video_url") String video_url,
			@RequestParam("title") String title, @RequestParam("overview") String overview,
			@RequestParam("making") String making, @RequestParam("ration") int ration,
			@RequestParam("kind") String kind, @RequestParam("level") String level,
			@RequestParam("nation") String nation, @RequestParam("holiday") String holiday,
			@RequestParam("category") String category, @RequestParam("suitable") String suitable,
			@RequestParam("price") int price, @RequestParam("material") String material, @RequestParam("time") int time,
			@RequestParam("user_id") int user_id, HttpServletRequest request) {

		try {
			if (user.isAdminOrMod() | user.getCurrentUsers().getId() == user_id) {
				String parent = "https://www.youtube.com/v/";
				String url = video_url.contains(parent) ? video_url : parent + video_url.split("v=")[1];
				postDaoimpl.Update(
						new Posts(post_id, userDaoimpl.findByID(user_id), url, title, overview, making, material, time,
								ration, kind, level, price, nation, holiday, category, suitable, timestamp, "NULL"));

				return "redirect: " + request.getContextPath() + "/post-show/" + post_id + "";

			} else {
				return "auth/401";

			}
		} catch (Exception e) {
			return "auth/500";
		}

	}

	@PostMapping(value = "/post-create")
	public String create(ModelMap model, @RequestParam("video_url") String video_url,
			@RequestParam("title") String title, @RequestParam("overview") String overview,
			@RequestParam("making") String making, @RequestParam("ration") int ration,
			@RequestParam("kind") String kind, @RequestParam("level") String level,
			@RequestParam("nation") String nation, @RequestParam("holiday") String holiday,
			@RequestParam("category") String category, @RequestParam("suitable") String suitable,
			@RequestParam("price") int price, @RequestParam("material") String material,
			@RequestParam("time") int time) {

		try {

			if (user.exist()) {

				String url = "https://www.youtube.com/v/" + video_url.split("v=")[1];

				int id = postDaoimpl.Create(new Posts(userDaoimpl.findByID(user.getCurrentUsers().getId()), url, title,
						overview, making, material, time, ration, kind, level, price, nation, holiday, category,
						suitable, timestamp, "NULL"));

				return "redirect: post-show/" + id + "";
			} else {
				return "auth/401";
			}
		} catch (Exception e) {
			return "auth/500";
		}

	}

	@GetMapping(value = "/admin/post/list")
	public String list(ModelMap model) {

		if (user.isAdminOrMod()) {
			model.addAttribute("posts", postDaoimpl.list("= 'NULL'"));
			return "admin/post/list";
		} else {
			return "auth/401";
		}
	}

	@GetMapping(value = "/admin/post/block")
	public String block(ModelMap model) {

		if (user.isAdminOrMod()) {
			model.addAttribute("posts", postDaoimpl.list("!= 'NULL'"));
			return "admin/post/block";
		} else {
			return "auth/401";
		}

	}

	@GetMapping(value = "/admin/post/list/{id}")
	public String block(ModelMap model, @PathVariable("id") int id) {

		try {
			if (user.isAdminOrMod()) {
				if (postDaoimpl.setStatus(id, timestamp.toString())) {

					model.addAttribute("posts", postDaoimpl.list("!= 'NULL'"));
					model.addAttribute("msg", "Khoá bài viết thành công.");
					model.addAttribute("class_name", "msg_success");

					return "admin/post/block";

				} else {
					model.addAttribute("msg", "Khoá bài viết thất bại.");
					model.addAttribute("class_name", "msg_error");

					return "admin/post/list";
				}
			} else {
				return "auth/401";
			}
		} catch (Exception e) {
			return "auth/500";		}

	}

	@GetMapping(value = "/admin/post/block/{id}")
	public String unblock(ModelMap model, @PathVariable("id") int id) {

		try {
			if (user.isAdminOrMod()) {
				if (postDaoimpl.setStatus(id, "NULL")) {
					model.addAttribute("posts", postDaoimpl.list("= 'NULL'"));
					model.addAttribute("msg", "Huỷ k hoá bài viết thành công.");
					model.addAttribute("class_name", "msg_success");

					return "admin/post/list";

				} else {
					model.addAttribute("msg", "Huỷ khoá bài viết thất bại.");
					model.addAttribute("class_name", "msg_error");

					return "admin/post/block";
				}
			} else {
				return "auth/401";
			}
		} catch (Exception e) {
			return "auth/500";		}

	}

}
