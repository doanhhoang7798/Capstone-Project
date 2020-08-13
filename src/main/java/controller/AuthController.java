package  controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import  dao.*;
import  model.*;
import  service.*;
import utils.TwilioMessageCreator;

@Controller

@RequestMapping("/authorized/")
public class AuthController {

	@Autowired
	UserDao userDaoimpl;//

	@Autowired
	TwilioMessageCreator twilioMessageCreator;
	
	@Autowired
	CurrentUser user;

	@GetMapping(value = "SignIn")
	public String SignIn(ModelMap model) {
		return "auth/sign-in";
	}

	@GetMapping(value = "SignUp")
	public String SignUp(ModelMap model) {
		return "auth/sign-up";
	}

	@PostMapping(value = "SignUp")
	public String SignUpProcess(Model model, @RequestParam("fullname") String name, @RequestParam("phone") String phone,
			@RequestParam("password") String password) {

		if (userDaoimpl.Create(new Users(name, userDaoimpl.encode(password), phone, user.timestamp, 1, 1, 1,
				"null_img.png"))) {

			try {
				twilioMessageCreator.sendSMS("Đăng ký tài khoản thành công. Chào mừng bạn tham gia cùng Yummy. ",
						phone);

				model.addAttribute("Msg", "Đăng ký thành công. ");
				model.addAttribute("class_name", "msg_success");
			} catch (Exception e) {
				model.addAttribute("class_name", "msg_success");
				model.addAttribute("Msg", "Đăng ký thành công, không thể gửi SMS do số điện thoại chưa xác thực. ");
			}

		} else {
			model.addAttribute("Msg", "Đăng ký thất bại, tài khoản đã tồn tại . ");
			model.addAttribute("class_name", "msg_error");

		}
		return "auth/sign-in";

	}

	@GetMapping(value = "/user-signin")
	public String forgot(ModelMap model) {
		
		
		return "auth/sign-in";
	}
	
	
	@GetMapping(value = "/forgot-password")
	public String LoginPor(ModelMap model) {
		return "auth/forgot";
	}
	
	@PostMapping(value = "/forgot-password")
	public String genarate_code(ModelMap model, @RequestParam("phone") String phone, HttpServletRequest request,
			HttpSession session) {

//		try {
			int number = user.random.nextInt(900000) + 100000;
			String code_exp = String.valueOf(number) + "--" + user.fomart.format(user.now);
			userDaoimpl.setConfirmCode(userDaoimpl.findByPhone(phone).getId(), code_exp);
			String smString = "Bạn vừa kích hoạt tính năng quên mật khẩu,: " + String.valueOf(number)
					+ " là mã thức của bạn. LƯU Ý: Thời gian hiệu lực là 4 phút";
			twilioMessageCreator.sendSMS(smString, phone);
			session.setAttribute("send_phone", phone);
			return "redirect: " + request.getContextPath() + "/authorized/verification?phone="
					+ userDaoimpl.findByPhone(phone).getPhone() + "";

//		} catch (Exception e) {
//			model.addAttribute("class_name", "msg_error");
//			model.addAttribute("Msg", "Tài khoản không tồn tại. ");
//			return "auth/forgot";
//
//		}

	}
	
	@GetMapping(value = "/verification")
	public String verification() {
		return "auth/confirm";
	}

	@PostMapping(value = "/verification")
	public String verified(ModelMap model, @RequestParam("password") String password, @RequestParam("code") String code,
			HttpServletRequest request, HttpSession session) throws ParseException {
		String phone = (String) session.getAttribute("send_phone");

		String full_code = userDaoimpl.findByPhone(phone).getConfirm_code();
		String expired_code = full_code.split("--")[1];
		String code_ = full_code.split("--")[0];
		Date created_at_ = user.fomart.parse(expired_code);
		Date expired = new Date(created_at_.getTime() + (1000 * 60 * 4));

		if (expired.after(user.now) && code_.equals(code)) {
			userDaoimpl.ChangePassword(userDaoimpl.findByPhone(phone).getId(), userDaoimpl.encode(password), null);
			model.addAttribute("class_name", "msg_success");
			model.addAttribute("Msg", "Khôi phục mật khẩu thành công. ");
			return "auth/sign-in";

		} else {
			model.addAttribute("class_name", "msg_error");
			model.addAttribute("Msg", " Mã xác thực không đúng hoặc đã hết hiếu lực. ");
			return "auth/confirm";

		}

	}

	@GetMapping(value = "/not-found")
	public String notFound(ModelMap model) {
		return "auth/404";
	}
	
	@GetMapping(value = "/authenticated")
	public String authenticated(ModelMap model) {
		return "auth/401";
	}

	@GetMapping(value = "login-error")
	public String lOut(ModelMap model) {
		model.addAttribute("class_name", "msg_error");

		model.addAttribute("Msg", "Mật khẩu hoặc tài khoản không chính xác. ");
		return "auth/sign-in";
	}

}
