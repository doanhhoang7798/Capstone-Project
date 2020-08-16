<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Đăng nhập</title>
<meta charset="UTF-8">


<style>
.msg_success {
	color: green;
}

.msg_error {
	color: red;
}
</style>


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

</head>
<body>


	<!-- firebase -->
	<script src="https://www.gstatic.com/firebasejs/6.2.4/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/6.2.4/firebase-auth.js"></script>
	<!-- firebaseUI -->
	<script
		src="https://cdn.firebase.com/libs/firebaseui/4.0.0/firebaseui.js"></script>

	<!--   
	<script src="https://www.gstatic.com/firebasejs/7.15.3/firebase-app.js"></script>

	TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries
	<script
		src="https://www.gstatic.com/firebasejs/7.15.3/firebase-analytics.js"></script>

 -->

	<script>

(function() {
    console.log('Start file login with firebase');
    // Initialize Firebase

    
    var config = {
    	    apiKey: "AIzaSyCdqbHnCt5DiJKaIQsG35fgMhHvjS-fEdQ",
    	    authDomain: "fpt-food.firebaseapp.com",
    	    databaseURL: "https://fpt-food.firebaseio.com",
    	    projectId: "fpt-food",
    	    storageBucket: "fpt-food.appspot.com",
    	    messagingSenderId: "278272388686",
    	    appId: "1:278272388686:web:7fc146d15290ca6a339d1f",
    	    measurementId: "G-KVX859E2GJ"
    	  };

    
    firebase.initializeApp(config);

 
    
    $('#btnFacebook').ready(function(){
			        var fbProvider = new firebase.auth.FacebookAuthProvider();
			
					const btnFaceBook = document.getElementById('btnFacebook');
			
			   			btnFaceBook.addEventListener('click', e => {
			     	   firebase.auth().signInWithPopup(fbProvider).then(function(result) {
			            // This gives you a Facebook Access Token. You can use it to access the Facebook API.
			            var token = result.credential.accessToken;
			            // The signed-in user info.
			            var user = result.user;
			            console.log('User>>Facebook>', user);
			            // ...
			            userId = user.uid;
			        
			        }).catch(function(error) {
			        
			            console.error('Error: hande error here>Facebook>>', error.code)
			        });
			    }, false)
    	});
    
    
    $('#btnGoogle').ready(function() { 
        //Google singin provider
        var ggProvider = new firebase.auth.GoogleAuthProvider();
       
        const btnGoogle = document.getElementById('btnGoogle');

        btnGoogle.addEventListener('click', e => {
            firebase.auth().signInWithPopup(ggProvider).then(function(result) {
                var token = result.credential.accessToken;
                var user = result.user;
                console.log('User>>Goole>>>>', user);
                userId = user.uid;

            }).catch(function(error) {
                console.error('Error: hande error here>>>', error.code)
            })
        }, false)
    	
    	
    	
    });

        
}())

</script>





	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('${pageContext.request.contextPath}/resources/images/banhmi.jpg');">
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">

				<span class="login100-form-title p-b-53"> Đăng nhập </span>

				<button style="float: left" id="btnFacebook" class="btn-face m-b-20">
					<i class="fa fa-facebook-official"></i> Facebook
				</button>

				<button id="btnGoogle" style="margin-left: auto;"
					class="btn-google m-b-20">
					<img
						src="${pageContext.request.contextPath}/resources/images/icons/icon-google.png"
						alt="GOOGLE"> Google
				</button>




				<form class="login100-form validate-form flex-sb flex-w"
					action="user-signin" method="post">

					<div class="p-b-10 p-l-20">
						<span class="txt1">Số điện thoại</span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Username is required">
						<input id="phone" class="input100" type="text" required
							name="txtphone"> <span class="focus-input100"></span>
					</div>

					<div class="p-b-10 p-l-20">
						<span class="txt1"> Mật khẩu </span> <a
							href="${pageContext.request.contextPath}/authorized/forgot-password"
							class="txt2 bo1 m-l-5"> Quên mật khẩu? </a>
					</div>


					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input id="password" class="input100"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" type="password"
							required name="txtpass"> <span class="focus-input100"></span>
					</div>

					<div id="Msg" style="margin-left: 100px; margin-top: 14px;"
						class="form-group">
						<div class="custom-control custom-checkbox ">
							<span id="hideMe" class="${class_name}"
								style="font-family: initial; font-size: larger;">${Msg}</span>

						</div>
					</div>
				
					<div class="container-login100-form-btn m-t-17">
						<button name="submit" class="login100-form-btn">Đăng nhập</button>
					</div>
					<script>
                  function validatePassword() {
                	    var password = document.getElementById("password");
               	    
                	    // Validate field Password 
                	    if (password.value.length == 0) {
                	        password.setCustomValidity("Mật khẩu không được bỏ trống.");
                	    } else if (password.value.length < 8) {
                	        password.setCustomValidity("Mật khẩu tối thiểu 8 kí tự.");

                	    } else if (password.value.length > 15) {
                	        password.setCustomValidity("Mật khẩu tối đa 15 kí tự.");    	        
                	    } else {
                	        password.setCustomValidity('');
                	    }


                	}

                	document.getElementsByName("submit")[0].onclick = validatePassword;
                    </script>
					<div class="w-full text-center p-t-30">
						<span class="txt2"> Bạn chưa có tài khoản? </span> <a
							href="${pageContext.request.contextPath}/authorized/SignUp"
							class="txt2 bo1"> Tạo tài khoản mới </a> </br> <a
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