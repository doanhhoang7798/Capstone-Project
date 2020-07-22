package  controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import  dao.PostDao;
import  dao.UserDao;
import  model.Users;
import  service.CurrentUser;
import  service.UploadConfig;

@Controller
public class StaticController {

	@Autowired
	UserDao userDaoimpl;

	@Autowired
	PostDao postDao;

	@Autowired
	UploadConfig UploadConfig;

	@Autowired
	ServletContext context;

	@Autowired
	CurrentUser user;

	@GetMapping(value = "/")
	public String index(Model model, HttpSession session) {
		try {
			session.setAttribute("user", user.getCurrentUsers());
			model.addAttribute("slides", postDao.filterHomePage("created_at"));
			model.addAttribute("suggestions", postDao.filterHomePage("view_conter"));
			return "static/index";
		} catch (Exception e) {
			return "auth/500";
		}
	}

	@GetMapping(value = "/menu")
	public String list(ModelMap model) {
		return "static/menu";
	}
	
	@GetMapping(value = "/contact")
	public String contact(ModelMap model) {
		return "static/contact";
	}

//////////////////////////////////
	@GetMapping(value = "/profile")
	public String profile(ModelMap model) {

		try {
			if (user.exist()) {
				return "static/profile";
			} else {
				return "auth/sign-in";
			}
		} catch (Exception e) {
			return "auth/500";
		}
	}

	@PostMapping(value = "/edit-profile")
	public String profileEditProcess(HttpSession session, ModelMap model, @RequestParam("image") MultipartFile image,
			@RequestParam("gender") int gender, @RequestParam("age") int age, @RequestParam("name") String name,
			@RequestParam("birthday") String birthday, @RequestParam("address") String address,
			@RequestParam("bio") String bio) {
		String photo = UploadConfig.uploadImage(model, image);
		String photo2 = photo.equals("") ? user.getCurrentUsers().getImage() : photo;
		try {
			if (userDaoimpl.Update(new Users(user.getCurrentUsers().getId(), user.getCurrentUsers().getEmail(), name,
					user.getCurrentUsers().getPassword(), user.getCurrentUsers().getPhone(), age, gender,
					user.getCurrentUsers().getRole(), birthday, address, user.getCurrentUsers().getProvider(), bio, photo2,
					user.getCurrentUsers().getCreated_at(), user.getCurrentUsers().getStatus(),
					user.getCurrentUsers().getBlock_date()))) {
				model.addAttribute("message2", "Cập nhập thông tin thành công.");
				model.addAttribute("class_name", "msg_success");
			} else {
				model.addAttribute("message2", "Cập nhập thông tin thất bại.");
				model.addAttribute("class_name", "msg_success");
			}

			session.setAttribute("user", user.getCurrentUsers());
			return "static/profile";
		} catch (Exception e) {
			return "auth/500";

		}

	}

	@PostMapping(value = "/change-password")
	public String changepassword(ModelMap model, @RequestParam("password") String password) {

		try {
			if (userDaoimpl.Update(new Users(user.getCurrentUsers().getId(), user.getCurrentUsers().getEmail(),
					user.getCurrentUsers().getFullname(), password, user.getCurrentUsers().getPhone(),
					user.getCurrentUsers().getAge(), user.getCurrentUsers().getGender(), user.getCurrentUsers().getRole(),
					user.getCurrentUsers().getBirthday(), user.getCurrentUsers().getCountry(),
					user.getCurrentUsers().getProvider(), user.getCurrentUsers().getBio(),
					user.getCurrentUsers().getImage(), user.getCurrentUsers().getCreated_at(),
					user.getCurrentUsers().getStatus(), user.getCurrentUsers().getBlock_date()))) {
				model.addAttribute("message", "Thay đổi mật khẩu thành công. ");
				model.addAttribute("class_name", "msg_success");
				return "static/profile";
			} else {
				model.addAttribute("message", "Thay đổi mật khẩu không thành công, vui lòng thử lại . ");
				model.addAttribute("class_name", "msg_error");
				return "static/profile";
			}
		} catch (Exception e) {
			return "auth/500";		}

	}

	@GetMapping(value = "filter")
	public String filter(ModelMap model, HttpServletRequest request, @RequestParam("condition") String cond,
			@RequestParam("category") String category, @RequestParam(name = "page", defaultValue = "1") int page) {

		int limit = 2;
		int ofset = (limit * page) - limit;
		model.addAttribute("path", request.getRequestURL() + "?condition=" + cond + "&category=" + category);
		model.addAttribute("current_page", page);
		model.addAttribute("title", cond);

		model.addAttribute("totals", postDao.pagination(category, cond, 0, 100000000).size());
		model.addAttribute("posts", postDao.pagination(category, cond, ofset, limit));

		return "static/filter";
	}

	@GetMapping(value = "undefined")
	public String handle() {
		return "auth/404";
	}

}
