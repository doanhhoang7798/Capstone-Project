package  controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import  dao.CommentDao;
import  dao.PostDao;
import  model.Comments;
import  service.CurrentUser;
import  service.UploadConfig;

@Controller
public class CommentController {

	@Autowired
	UploadConfig upload;

	@Autowired
	CommentDao commentDaoimpl;

	@Autowired
	CurrentUser user;

	@Autowired
	PostDao postDaoimpl;

	Timestamp timestamp = new Timestamp(System.currentTimeMillis());

	@PostMapping(value = "comment/create/{id}")
	@ResponseBody
	public Integer create(ModelMap mode, @PathVariable("id") int id, @RequestParam("image") MultipartFile image,
			@RequestParam("content") String content) {
		String image_path = upload.uploadImage(mode, image);

		try {
			commentDaoimpl.Create(new Comments(postDaoimpl.findByID(id), user.getCurrentUsers(), content, image_path,
					"NULL", timestamp.toString()));

			return commentDaoimpl.list().size();
		} catch (Exception e) {
			return commentDaoimpl.list().size();
		}
	}

	@PostMapping(value = "comment/edit/{id}")
	@ResponseBody
	public Integer update(ModelMap mode, @PathVariable("id") int id, @RequestParam("image") MultipartFile image,
			@RequestParam("content") String content, @RequestParam("c_id") int c_id,
			@RequestParam("c_user") int c_user) {

		if (user.userID() == c_user) {
			String image_path = upload.uploadImage(mode, image);

			commentDaoimpl.Update(new Comments(c_id, postDaoimpl.findByID(id), user.getCurrentUsers(), content,
					image_path, "NULL", timestamp.toString()));
			return commentDaoimpl.list().size();
		} else {
			return commentDaoimpl.list().size();
		}

	}

	@PostMapping(value = "comment/delete/{id}")
	@ResponseBody
	public Integer Delete(ModelMap mode, @PathVariable("id") int id, @RequestParam("c_user") int c_user) {

		if (user.userID() == c_user) {
			commentDaoimpl.Delete(id);
			return commentDaoimpl.list().size();
		} else {
			return commentDaoimpl.list().size();
		}

	}

	@GetMapping(value = "admin/comment/list")
	public String list(ModelMap model) {

		if (user.isAdminOrMod()) {
			model.addAttribute("comments", commentDaoimpl.list());
			return "admin/comment/list";
		} else {
			return "auth/401";
		}
	}

	@GetMapping(value = "admin/comment/delete/{id}")
	public String DeleteAdmin(ModelMap mode, @PathVariable("id") int id) {

		if (user.isAdminOrMod()) {
			if (commentDaoimpl.Delete(id)) {
				mode.addAttribute("msg", "Xoá thành công.");
				mode.addAttribute("class_name", "msg_success");
			} else {
				mode.addAttribute("msg", "Xoá thất bại.");
				mode.addAttribute("class_name", "msg_error");
			}
			mode.addAttribute("comments", commentDaoimpl.list());
			return "admin/comment/list";
		} else {
			return "auth/401";
		}

	}

}
