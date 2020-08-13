<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
   <head>
      <title>Đăng ký</title>
      <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" type="text/css"
         href="${pageContext.request.contextPath}/resources/css/util.css">
      <link rel="stylesheet" type="text/css"
         href="${pageContext.request.contextPath}/resources/css/main.css">
   </head>
   <body>
      <div class="limiter">
         <div class="container-login100"
            style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_images_1.jpg');">
            <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
               <form class="login100-form validate-form flex-sb flex-w"
                  accept-charset="UTF-8"
                  action="${pageContext.request.contextPath}/authorized/SignUp"
                  method="post">
                  <span style="padding-bottom: 20px;" class="login100-form-title ">Tham
                  gia cùng Yummy </span>
                  <div class="p-b-10 p-l-20">
                     <span class="txt1"> Họ tên </span>
                  </div>
                  <div class="wrap-input100 validate-input"
                     data-validate="Username is required">
                     <input id="fullname"  class="input100"
                        type="text" name="fullname"> <span class="focus-input100"></span>
                  </div>
               	
                     
                     <div class="p-b-10 p-l-20">
                     <span class="txt1">Số điện thoại </span>
                     </div>
                     <div class="wrap-input100 validate-input"
                     data-validate="Username is required">
                     <input class="input100" type="tel" pattern="^(03|05|07|08|09)+([0-9]{8})" required name="phone" id="phone">
                     <span class="focus-input100"></span>
                     </div>
                
                     
    
                  <div class="p-b-10 p-l-20"> 
                     <span class="txt1">Mật khẩu </span>
                  </div>
                  <div class="wrap-input100 validate-input"
                     data-validate="Username is required">
                     <input id="password" class="input100" type="password" type="email"
                        pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" maxlength="20" required name="password"> <span
                        class="focus-input100"></span>
                  </div>
                  <div class="p-b-10 p-l-20">
                     <span class="txt1">Xác nhận mật khẩu </span>
                  </div>
                  <div class="wrap-input100 validate-input"
                     data-validate="Username is required">
                     <input id="confirm_password" class="input100" type="password" 
                        type="email" maxlength="20" required
                        name="cf_password"> <span class="focus-input100"></span>
                  </div>
                  <span class="txt2" style="color: #c33;margin-left: 15%;" >Mật khẩu phải gồm ít nhất 1 chữ in hóa, 1 chữ in thường và 1 chữ số</span>
                  <div class="container-login100-form-btn m-t-17">
                     <input class="login100-form-btn" name="submit" type="submit" value="Đăng ký" >
                  </div>
                  <script>
                  function validatePassword() {
                	    var password = document.getElementById("password");
                  
                	    var confirm_password = document.getElementById("confirm_password");

                	    var fullname = document.getElementById("fullname");
                	    
                	    var phone = document.getElementById("phone");

                	    // Validate field Fullname 
                	    if (fullname.value.length == 0) {
                	        fullname.setCustomValidity("Họ tên không được bỏ trống.");
                	    } else if (fullname.value.length < 3) {
                	        fullname.setCustomValidity(" Họ và tên tối thiểu 3 kí tự.");

                	    } else if (fullname.value.length > 40) {
                	        fullname.setCustomValidity(" Họ và tên tối đa 40 kí tự.");
                	    } else {
                	        fullname.setCustomValidity('');
                	    }
                	  	console.log(fullname + 'full name');
                	  	console.log(phone);
                	    if (phone.value.length == 0) {
                	    	phone.setCustomValidity("Số điện thoại không được bỏ trống.");
                	    } else if (phone.value.length != 10) {
                	    	phone.setCustomValidity("Số điện thoại gồm 10 chữ số");
                	    } else {
                	    	phone.setCustomValidity('');
                	    }

                	    // Validate field Password 
                	    if (password.value.length == 0) {
                	        password.setCustomValidity("Mật khẩu không được bỏ trống.");
                	    } else if (password.value.length < 8) {
                	        password.setCustomValidity("Mật khẩu tối thiểu 8 kí tự.");

                	    } else if (password.value.length > 20) {
                	        password.setCustomValidity("Mật khẩu tối đa 20 kí tự.");
                	        
                	   
                	    } else {
                	        password.setCustomValidity('');
                	    }


                	   // Validate field Password, Confirm Password match.
                	    if (password.value != confirm_password.value) {
                	        confirm_password.setCustomValidity("Xác nhận mật khẩu không khớp ");
                	    } else {
                	        confirm_password.setCustomValidity('');
                	    }
                	}

                	document.getElementsByName("submit")[0].onclick = validatePassword;
                	
                	
                  </script>
                  
                  <div class="w-full text-center p-t-30">
                     <span class="txt2">Bạn đã có tài khoản ? </span> <a
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