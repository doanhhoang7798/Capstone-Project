package  controller;

import java.sql.Timestamp;

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

@Controller

@RequestMapping("/authorized/")
public class AuthController {

	@Autowired
	UserDao userDaoimpl;

	@Autowired
	TwilioMessageCreator twilioMessageCreator;

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
			@RequestParam("password") String password, @RequestParam("address") String address,
			@RequestParam("email") String email) {

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		if (userDaoimpl.Create(new Users(email, name, password, phone, address, timestamp, 1, 1, 1))) {

			try {
				twilioMessageCreator.sendSMS("Đăng ký tài khoản thành công. Chào mừng bạn tham gia cùng Yummy. ", phone);

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

	@GetMapping(value = "/not-found")
	public String notFound(ModelMap model) {
		return "auth/404";
	}

	@GetMapping(value = "login-error")
	public String lOut(ModelMap model) {
		model.addAttribute("class_name", "msg_error");

		model.addAttribute("Msg", "Mật khẩu hoặc tài khoản không chính xác. ");
		return "auth/sign-in";
	}

}
