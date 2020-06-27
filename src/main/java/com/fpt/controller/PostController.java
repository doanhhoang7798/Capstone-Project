package com.fpt.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpt.dao.PostDao;
import com.fpt.dao.ReactionDao;
import com.fpt.dao.UserDao;
import com.fpt.model.Posts;
import com.fpt.service.CurrentUser;

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

	@GetMapping(value = "/post-show/{id}")
	public String show(ModelMap model, @PathVariable("id") int id) {
		postDaoimpl.viewCount(id);

		if (user.getCurrentUsers() == null) {
			model.addAttribute("isLike", false);
		} else {
			model.addAttribute("isLike",
					reactionDaoimpl.isLike(user.getCurrentUsers().getId(), id) == null ? false : true);
		}

		model.addAttribute("reaction", reactionDaoimpl.counter(id).size());
		model.addAttribute("post", postDaoimpl.findByID(id));
		model.addAttribute("refer", postDaoimpl.refer(postDaoimpl.findByID(id).getKind()));
		return "static/post/show";
	}

	@GetMapping(value = "post-edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") int id) {
		model.addAttribute("post", postDaoimpl.findByID(id));
		return "static/post/edit";
	}

	@GetMapping(value = "/post-create")
	public String nEw(ModelMap model) {
		return "static/post/create";
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

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		String parent = "https://www.youtube.com/v/";

		String url = video_url.contains(parent) ? video_url : parent + video_url.split("v=")[1];

		if (user.getCurrentUsers().getRole() == 10 | user.getCurrentUsers().getRole() == 5
				| user.getCurrentUsers().getId() == user_id) {
			postDaoimpl.Update(new Posts(post_id, userDaoimpl.findByID(user_id), url, title, overview, making, material,
					time, ration, kind, level, price, nation, holiday, category, suitable, timestamp, "NULL"));

			return "redirect: " + request.getContextPath() + "/post-show/" + post_id + "";

		} else {
			return "auth/401";

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

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		String url = "https://www.youtube.com/v/" + video_url.split("v=")[1];

		int id = postDaoimpl.Create(
				new Posts(userDaoimpl.findByID(user.getCurrentUsers().getId()), url, title, overview, making, material,
						time, ration, kind, level, price, nation, holiday, category, suitable, timestamp, "NULL"));

		return "redirect: post-show/" + id + "";
	}

	////////////////////////// ---------------- ADMIN //////////////////////////
	////////////////////////// ------------///////////////////

	@GetMapping(value = "/admin/list-post")
	public String list(ModelMap model) {
		model.addAttribute("posts", postDaoimpl.list("= 'NULL'"));
		return "admin/post/list";
	}

	@GetMapping(value = "/admin/list-post-block")
	public String block(ModelMap model) {
		model.addAttribute("posts", postDaoimpl.list("!= 'NULL'"));
		return "admin/post/block";
	}

	@GetMapping(value = "/admin/list-post/{id}")
	public String block(ModelMap model, @PathVariable("id") int id) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

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
	}

	@GetMapping(value = "/admin/list-post-block/{id}")
	public String unblock(ModelMap model, @PathVariable("id") int id) {

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
	}

}
