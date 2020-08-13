package  controller;

import java.util.ArrayList;
import java.util.List;

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
import  dao.TipNutriDao;
import  dao.UserDao;
import  model.Users;
import  model.Posts;
import  model.Reactions;
import  service.CurrentUser;
import utils.UploadConfig;

@Controller
public class StaticController {

	@Autowired
	UserDao userDaoimpl;

	@Autowired
	PostDao postDao;
	
	@Autowired
	TipNutriDao TipNutriDaoimpl;

	@Autowired
	UploadConfig UploadConfig;

	@Autowired
	ServletContext context;

	@Autowired
	CurrentUser user;

	@GetMapping(value = "/")
	public String index(Model model, HttpSession session) {
		try {
			session.setAttribute("user", user.current());
			model.addAttribute("slides", postDao.filterHomePage("view_conter"));
			model.addAttribute("suggestions", postDao.filterHomePage("created_at"));
			return "static/index";
		} catch (Exception e) {
			return "auth/500";
		}
	}

	@GetMapping(value = "/menu")
	public String list(ModelMap model) {
		try {
			return "static/menu";
		} catch (Exception e) {
			return "auth/500";
		}
	}
	
	@GetMapping(value = "/contact")
	public String contact(ModelMap model) {

		try {
			return "static/contact";
		} catch (Exception e) {
			return "auth/500";
		}
	}

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
			@RequestParam("gender") int gender, @RequestParam("name") String name,
			@RequestParam("birthday") String birthday, @RequestParam("address") String address,
			@RequestParam("email") String email,
			@RequestParam("bio") String bio) {
		String photo = UploadConfig.uploadImage(model, image);
		String photo2 = photo.equals("") ? user.current().getImage() : photo;
		try {
			if (userDaoimpl.Update(new Users(user.current().getId(), email , name,
					user.current().getPassword(), user.current().getPhone(), 20, gender,
					user.current().getRole(), birthday, address, bio, photo2,
					user.current().getCreated_at(), user.current().getStatus(),
					user.current().getBlock_date()))) {
				model.addAttribute("message2", "Cập nhập thông tin thành công.");
				model.addAttribute("class_name", "msg_success");
			} else {
				model.addAttribute("message2", "Cập nhập thông tin thất bại.");
				model.addAttribute("class_name", "msg_success");
			}

			session.setAttribute("user", user.current());
			return "static/profile";
		} catch (Exception e) {
			return "auth/500";

		}

	}

	@PostMapping(value = "/change-password")
	public String changepassword(ModelMap model, @RequestParam("password") String password) {

		try {
			if (userDaoimpl.ChangePassword(user.userID(), userDaoimpl.encode(password), null)) {
				model.addAttribute("message", "Thay đổi mật khẩu thành công. ");
				model.addAttribute("class_name", "msg_success");
				return "static/profile";
			} else {
				model.addAttribute("message", "Thay đổi mật khẩu không thành công, vui lòng thử lại . ");
				model.addAttribute("class_name", "msg_error");
				return "static/profile";
			}
		} catch (Exception e) {
			return "auth/500";
		}

	}

	@GetMapping(value = "filter")
	public String filter(ModelMap model, HttpServletRequest request, @RequestParam("condition") String cond,
			@RequestParam(value = "category", defaultValue = "search") String category,
			@RequestParam(name = "page", defaultValue = "1") int page) {

		int limit = 12;
		int ofset = (limit * page) - limit;
		model.addAttribute("path", request.getRequestURL() + "?condition=" + cond + "&category=" + category);
		model.addAttribute("current_page", page);
		try {
			switch (category) {
			case "search":
				model.addAttribute("title", "Có " + postDao.seacrhFull(cond, 0, 10000000).size()
						+ " kết quả cho: ``" + cond + " ``");

				model.addAttribute("posts", postDao.seacrhFull(cond, ofset, limit));
				model.addAttribute("page_size", page_size(postDao.seacrhFull(cond, 0, 10000000).size(), limit));
				break;
			case "likes":
				model.addAttribute("title", " Bài viết đã thích");
				int begin = ofset ;
				int end = (begin + limit) < mapping().size() ? (begin + limit) : ((mapping().size() - ofset) + begin );
				if (mapping().size() == 0) {
					model.addAttribute("posts", mapping());
					model.addAttribute("page_size", 0);

				} else {
					model.addAttribute("posts", mapping().subList(ofset, end));
					model.addAttribute("page_size", page_size(mapping().size(), limit));
				}

				break;

			case "new":
				model.addAttribute("title", "Các bài viết mới nhất");
				model.addAttribute("posts", postDao.filterDes(cond, ofset, limit));
				model.addAttribute("page_size", page_size(postDao.filterDes(cond, 0, 10000000).size(), limit));
				break;
			case "main_material":
				model.addAttribute("title", "Món ăn từ " + cond + " ");
				break;
			case "holiday":
				model.addAttribute("title", "Các món dùng trong " + cond + " ");
				break;
			case "category":
				model.addAttribute("title", "Các món " + cond + " ");
				break;
			case "kind":
				model.addAttribute("title", "Các món " + cond + "");
				break;
			case "nation":
				model.addAttribute("title", "Món ăn " + cond + "");
				break;
			case "suitable":
				model.addAttribute("title", "Món ăn dành cho " + cond + " ");
				break;
			default:
				model.addAttribute("title", cond );
				model.addAttribute("check", true );
			}
			
			if (category.equals("Mẹo hay") || category.equals("Dinh dưỡng") ) {
				model.addAttribute("posts", TipNutriDaoimpl.findByTypeKind(category, cond, ofset, limit));
				model.addAttribute("page_size",
						page_size(TipNutriDaoimpl.findByTypeKind(category, cond, 0, 10000000).size(), limit));
			}
			
			else if (!category.equals("likes") && !category.equals("search") && !category.equals("new")) {
				model.addAttribute("posts", postDao.pagination(category, cond, ofset, limit));
				model.addAttribute("page_size",
						page_size(postDao.pagination(category, cond, 0, 10000000).size(), limit));
			}

			String page_return =  "static/filter";
			return page_return;
		} catch (Exception e) {
			return "auth/500";
		}
	}

	@GetMapping(value = "undefined")
	public String handle() {
		return "auth/404";
	}
	

	public int page_size(int totals, int limit) {
		int page_size = totals / limit + (totals % limit == 0 ? 0 : 1);
		return page_size;
	}

	public List<Posts> mapping() {

		List<Posts> posts = new ArrayList<Posts>();

		for (Reactions rc : userDaoimpl.findByID(user.userID()).reactions) {
			Posts post = new Posts();
			post.setId(rc.getPost().getId());
			post.setVideo_url(rc.getPost().getVideo_url());
			post.setTitle(rc.getPost().getTitle());
			post.setOverview(rc.getPost().getOverview());
			post.setCreated_at(rc.getPost().getCreated_at());
			post.setCategory(rc.getPost().getCategory());
			posts.add(post);
		}

		return posts;
	}


}
