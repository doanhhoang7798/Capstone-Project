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


}
