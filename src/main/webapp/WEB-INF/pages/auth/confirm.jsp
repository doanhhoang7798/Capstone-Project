<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Khôi phục mật khẩu</title>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_images_1.jpg');">
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form class="login100-form validate-form flex-sb flex-w"
					accept-charset="UTF-8"
					action="${pageContext.request.contextPath}/authorized/verification"
					method="post">
					<span style="padding-bottom: 20px;" class="login100-form-title ">Đặt
						mật khẩu mới </span> <input type="hidden" id="phone_param" name="phone"
						value="${ phone }" />

					<div class="p-b-10 p-l-20">
						<span class="txt1">Mật Khẩu </span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Username is required">
						<input id="password" class="input100" type="password" type="email"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" maxlength="20"
							required name="password"> <span class="focus-input100"></span>
					</div>

					<div class="p-b-10 p-l-20">
						<span class="txt1">Xác nhận mật khẩu </span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Username is required">
						<input id="confirm_password" class="input100" type="password"
							type="email" maxlength="20" required name="cf_password">
						<span class="focus-input100"></span>
					</div>


					<div class="p-b-10 p-l-20">
						<span class="txt1">Mã xác thực</span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Username is required">
						<input class="input100" type="number" min="000000" max="999999"
							required name="code"> <span class="focus-input100"></span>
					</div>


					<div style="text-align: center; width: 100%; margin-top: 12px;">

						<span id="hideMe" class="${class_name}"
							style="font-family: initial; font-size: larger;">${Msg}</span>

					</div>


					<script>
						var password = document.getElementById("password"), confirm_password = document
								.getElementById("confirm_password");

						function validatePassword() {
							if (password.value != confirm_password.value) {
								confirm_password
										.setCustomValidity("Mật khẩu không trùng khớp.");
							} else {
								confirm_password.setCustomValidity('');
							}
						}

						password.onchange = validatePassword;
						confirm_password.onkeyup = validatePassword;
					</script>




					<div class="container-login100-form-btn m-t-17">
						<button type="submit" class="login100-form-btn">Hoàn tất
						</button>
					</div>

					<div class="w-full text-center p-t-30">
						<span class="txt2">Bạn đã có tài khoản? </span> <a
							href="${pageContext.request.contextPath}/authorized/SignIn"
							class="txt2 bo1"> Đăng nhập ngay! </a> </br> <a
							href="${pageContext.request.contextPath}/" class="txt2 bo1">
							Quay lại trang chủ! </a>

					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

</body>
</html>