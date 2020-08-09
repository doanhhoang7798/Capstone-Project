package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ReportDao;
import dao.UserDao;
import model.Reports;
import service.CurrentUser;

@Controller
public class ReportController {

	@Autowired
	CurrentUser user;

	@Autowired
	ReportDao reportDaoimpl;

	@Autowired
	UserDao userDaoimplDao;


	@GetMapping(value = "admin/report/list")
	public String list(ModelMap model) {
		if (user.isAdminOrMod()) {
			model.addAttribute("reports", reportDaoimpl.list());
			return "admin/report/list";
		} else {
			return "auth/401";
		}
	}

	@GetMapping(value = "admin/report/warning")
	public String warning(ModelMap model) {

		if (user.isAdminOrMod()) {
			model.addAttribute("users", reportDaoimpl.waring());
			return "admin/report/warning";
		} else {
			return "auth/401";
		}
	}

	@GetMapping(value = "admin/report/delete/{id}")
	public String list(ModelMap model, @PathVariable("id") int id) {

		try {
			if (user.isAdminOrMod()) {
				if (reportDaoimpl.Delete(id)) {
					model.addAttribute("msg", " Xoá báo cáo thành công..");
					model.addAttribute("class_name", "msg_success");
				} else {
					model.addAttribute("msg", " Xoá báo cáo thất bại ..");
					model.addAttribute("class_name", "msg_error");
				}
				model.addAttribute("reports", reportDaoimpl.list());
				return "admin/report/list";
			} else {
				return "auth/401";
			}
		} catch (Exception e) {
			return "auth/500";
		}
	}

	@PostMapping(value = "report/create/{id}")
	public String reportComment(ModelMap model, HttpServletRequest request, @PathVariable("id") int post_id,
			@RequestParam("report_type") int report_type, @RequestParam("reportable_id") int reportable_id, @RequestParam("reportable_author") int reportable_author) {
		try {
			
			if (user.exist() && reportDaoimpl.reported(user.userID(), reportable_id).size() == 0) {
				if (reportDaoimpl.Create(
						new Reports("Comment", reportable_id, report_type, user.current(), user.timestamp.toString(),reportable_author))) {
					model.addAttribute("report_msg", "Báo cáo được gửi thành công..");
				}
				return "redirect: " + request.getContextPath() + "/post-show/" + post_id + "";
			} else {
				model.addAttribute("report_msg", "Bạn đã báo cáo bình luận này trước đây");

				return "redirect: " + request.getContextPath() + "/post-show/" + post_id + "";
			}
		} catch (Exception e) {
			return "auth/500";		
			}
	}
}
	
