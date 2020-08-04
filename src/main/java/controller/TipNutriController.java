package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.*;
import model.*;
import service.*;
import utils.*;

@Controller
public class TipNutriController {

	@Autowired
	TipNutriDao TipNutriDaoimpl;

	@Autowired
	CurrentUser user;

	@Autowired
	UploadConfig UploadConfig;
	
	private int ofset = 0;
	private int limit  = 8 ;
	


	@GetMapping(value = "/nutrition")
	public String nutrition(ModelMap model) {
		model.addAttribute("children", TipNutriDaoimpl.findByTypeKind("Dinh Dưỡng", "Dinh dưỡng cho trẻ",ofset,limit));
		model.addAttribute("older", TipNutriDaoimpl.findByTypeKind("Dinh Dưỡng", "Dinh dưỡng cho người cao tuổi",ofset,limit));
		model.addAttribute("sick", TipNutriDaoimpl.findByTypeKind("Dinh Dưỡng", "Chế độ ăn cho người bệnh",ofset,limit));
		return "static/nutri";
	}

	@GetMapping(value = "/tips")
	public String tips(ModelMap model) {
		model.addAttribute("tips1", TipNutriDaoimpl.findByTypeKind("Mẹo hay", "Mẹo hay chế biến nguyên liệu",ofset,limit));
		model.addAttribute("tips2", TipNutriDaoimpl.findByTypeKind("Mẹo hay", "Bí quyết nấu nướng",ofset,limit));
		model.addAttribute("tips3", TipNutriDaoimpl.findByTypeKind("Mẹo hay", "Các thực phẩm kị nhau",ofset,limit));
		return "static/tips";
	}

	@GetMapping(value = "/readmore/{id}")
	public String read(ModelMap model, @PathVariable("id") int id) {
		try {
			model.addAttribute("record", TipNutriDaoimpl.findByID(id));

			if (TipNutriDaoimpl.findByID(id).getType().equals("Mẹo hay")) {
				model.addAttribute("refer", TipNutriDaoimpl.filterByType("Mẹo hay"));
			} else {
				model.addAttribute("refer", TipNutriDaoimpl.filterByType("Dinh dưỡng"));
			}
			
			
			return "static/read";
		} catch (Exception e) {
			return "auth/500";
		}

	}
	
	@GetMapping(value = "admin/tipNutri/create")
	public String create(ModelMap model) {

		if (user.isAdminOrMod()) {
			return "admin/tipNutri/create";
		} else {
			return "auth/401";
		}
	}
	

	@PostMapping(value = "admin/tipNutri/create")
	public String created(ModelMap model, @RequestParam("author") String author, @RequestParam("title") String title,
			@RequestParam("content") String content, @RequestParam("type") String type,
			@RequestParam("kind") String kind, @RequestParam("image") MultipartFile image) {

		String path_img = UploadConfig.uploadImage(model, image);

		try {
			if (user.isAdminOrMod()) {
				if (TipNutriDaoimpl
						.Create(new TipNutri(title, content, type, author, user.timestamp.toString(), kind, path_img, user.current()))) {
					model.addAttribute("msg", "Thao tác thành công.");
					model.addAttribute("class_name", "msg_success");

				} else {
					model.addAttribute("msg", "Thao tác thất bại.");
					model.addAttribute("class_name", "msg_error");

				}
				model.addAttribute("tipNutri", TipNutriDaoimpl.list());
				return "admin/tipNutri/list";
			} else {
				return "auth/401";
			}
		} catch (Exception e) {
			return "auth/500";
		}

	}

	@GetMapping(value = "admin/tipNutri/list")
	public String list(ModelMap model) {
		if (user.isAdminOrMod()) {
			model.addAttribute("tipNutri", TipNutriDaoimpl.list());
			return "admin/tipNutri/list";
		} else {
			return "auth/401";
		}
	}
	
	@GetMapping(value = "admin/tipNutri/edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") int id) {

		try {
			if (user.isAdminOrMod()) {
				model.addAttribute("record", TipNutriDaoimpl.findByID(id));
				return "admin/tipNutri/edit";
			} else {
				return "auth/401"; 
			}
		} catch (Exception e) {
			return "auth/500";
		}

	}
	
	@PostMapping(value = "admin/tipNutri/edit/{id}")
	public String editProcess(ModelMap model, @PathVariable("id") int id, @RequestParam("author") String author,
			@RequestParam("title") String title, @RequestParam("content") String content,
			@RequestParam("type") String type, @RequestParam("kind") String kind,
			@RequestParam("image") MultipartFile image) {
		String path = UploadConfig.uploadImage(model, image);
		String path_img = path.equals("") ? TipNutriDaoimpl.findByID(id).getImage() : path;


		try {
			if (user.isAdminOrMod()) {
				if (TipNutriDaoimpl
						.Update(new TipNutri(id, title, content, type, author, user.timestamp.toString(), kind, path_img, user.current()))) {
					model.addAttribute("msg", "Thao tác thành công.");
					model.addAttribute("class_name", "msg_success");

				} else {
					model.addAttribute("msg", "Thao tác thất bại.");
					model.addAttribute("class_name", "msg_error");

				}
				model.addAttribute("commons", TipNutriDaoimpl.list());
				return "admin/tipNutri/list";
			} else {
				return "auth/401";
			}
		} catch (Exception e) {
			return "auth/500";
		}

	}


}
