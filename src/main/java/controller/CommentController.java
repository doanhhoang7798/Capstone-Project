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
import utils.UploadConfig;


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
	public Integer create(ModelMap mode, @PathVariable("id") int p_id, @RequestParam("image") MultipartFile image,
			@RequestParam("content") String content) {
		String image_path = upload.uploadImage(mode, image);
		try {
			commentDaoimpl.Create(new Comments(postDaoimpl.findByID(p_id), user.getCurrentUsers(), content, image_path,
					"NULL", timestamp.toString()));

			return size(p_id, "Post");
		} catch (Exception e) {
			return size(p_id, "Post");
		}
	}
	
	@PostMapping(value = "comment/edit/{id}")
	@ResponseBody
	public Integer update(ModelMap mode, @PathVariable("id") int id, @RequestParam("image") MultipartFile image,
			@RequestParam("content") String content, @RequestParam("c_id") int c_id,
			@RequestParam("c_user") int c_user) {
		if (user.userID() == c_user) {
			String url = upload.uploadImage(mode, image);
			String image_path = url.equals("") ? commentDaoimpl.findByID(c_id).getImage_url() : url;
			commentDaoimpl.Update(new Comments(c_id, postDaoimpl.findByID(id), user.getCurrentUsers(), content,
					image_path, "NULL", timestamp.toString()));
			return size(c_id, "Comment");
		} else {
			return size(c_id, "Comment");
		}

	}

	
	public int size(int p_id, String type) {
		int rls = type.equals("Comment")
				? postDaoimpl.findByID(commentDaoimpl.findByID(p_id).post.getId()).comments.size()
				: postDaoimpl.findByID(p_id).comments.size();
		return rls;
	}

}
