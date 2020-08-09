<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.our-team {
	padding: 30px 0 40px;
	margin-bottom: 30px;
	background-color: #f7f5ec;
	text-align: center;
	overflow: hidden;
	position: relative;
}

.our-team .picture {
	display: inline-block;
	height: 130px;
	width: 130px;
	margin-bottom: 50px;
	z-index: 1;
	position: relative;
}

.our-team .picture::before {
	content: "";
	width: 100%;
	height: 0;
	border-radius: 50%;
	background-color: #1369ce;
	position: absolute;
	bottom: 135%;
	right: 0;
	left: 0;
	opacity: 0.9;
	transform: scale(3);
	transition: all 0.3s linear 0s;
}

.our-team:hover .picture::before {
	height: 100%;
}

.our-team .picture::after {
	content: "";
	width: 100%;
	height: 100%;
	border-radius: 50%;
	background-color: #1369ce;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
}

.our-team .picture img {
	width: 100%;
	height: auto;
	border-radius: 50%;
	transform: scale(1);
	transition: all 0.9s ease 0s;
}

.our-team:hover .picture img {
	box-shadow: 0 0 0 14px #f7f5ec;
	transform: scale(0.7);
}

.our-team .title {
	display: block;
	font-size: 15px;
	color: #4e5052;
	text-transform: capitalize;
}

.our-team .social {
	width: 100%;
	padding: 0;
	margin: 0;
	background-color: #1369ce;
	position: absolute;
	bottom: -100px;
	left: 0;
	transition: all 0.5s ease 0s;
}

.our-team:hover .social {
	bottom: 0;
}

.our-team .social li {
	display: inline-block;
}

.our-team .social li a {
	display: block;
	padding: 10px;
	font-size: 17px;
	color: white;
	transition: all 0.3s ease 0s;
	text-decoration: none;
}

.our-team .social li a:hover {
	color: #1369ce;
	background-color: #f7f5ec;
}
</style>
<jsp:include page="layout/_header.jsp"></jsp:include>

<div id="content" class="clearfix" style="width: 100%;">
	<div id="left-area" class="clearfix" style="width: 91%;">
		<div class="post-53 post category-barbeque" id="post-53">
			<h1 style="font-size: 40px; text-align: center; margin: 30px 0px;"
				class="single-post-title">- Yummy & Câu chuyện của chúng ta -</h1>
			<br>

			<h1 style="font-size: 30px; text-align: center; margin-bottom: 45px;"
				class="single-post-title">Câu chuyện của Yummy</h1>

			<!-- 			<div style="border: 5px double #565556; border-radius: 20px;">
 -->
			<p style="padding: 19px; text-align: justify;">Shirayuki bẩm sinh
				đã có mái tóc màu đỏ táo rất đẹp và hiếm.Cô bị một hoàng tử nổi
				tiếng ngu ngốc,Raji, bắt làm phi tần. Shirayuki bẩm sinh đã có mái
				tóc màu đỏ táo rất đẹp và hiếm.Cô bị một hoàng tử nổi tiếng ngu
				ngốc,Raji, bắt làm phi tần. Shirayuki bẩm sinh đã có mái tóc màu đỏ
				táo rất đẹp và hiếm.Cô bị một hoàng tử nổi tiếng ngu ngốc,Raji, bắt
				làm phi tần. Shirayuki bẩm sinh đã có mái tóc màu đỏ táo rất đẹp và
				hiếm.Cô bị một hoàng tử nổi tiếng ngu ngốc,Raji, bắt làm phi tần.</p>

			<!-- 			</div>
 -->






		</div>
	</div>




	<h1 style="font-size: 30px; text-align: center; margin-bottom: 45px;"
		class="single-post-title">Đồng sáng lập</h1>


	<div class="container" style="width: 100%;">
		<div class="row">

			<div class="col-12 col-sm-6 col-md-4 col-lg-3">
				<div class="our-team">
					<div class="picture">
						<img class="img-fluid"
							src="https://picsum.photos/130/130?image=839">
					</div>
					<div class="team-content">
						<h3 class="name">Trang Luna</h3>
						<h4 class="title">Web Developer</h4>
					</div>
					<ul class="social">
						<li><a href="" class="fab fa-facebook-f" aria-hidden="true"></a></li>
						<li><a href="" class="fab fa-twitter" aria-hidden="true"></a></li>
						<li><a href="mailto:trang@gmail.com?subject=Dear Trang"
							class="fab fa-google" aria-hidden="true"></a></li>
					</ul>
				</div>
			</div>

			<div class="col-12 col-sm-6 col-md-4 col-lg-3">
				<div class="our-team">
					<div class="picture">
						<img class="img-fluid"
							src="https://picsum.photos/130/130?image=839">
					</div>
					<div class="team-content">
						<h3 class="name">Hoang Web</h3>
						<h4 class="title">Web Developer</h4>
					</div>
					<ul class="social">
						<li><a href="" class="fab fa-facebook-f" aria-hidden="true"></a></li>
						<li><a href="" class="fab fa-twitter" aria-hidden="true"></a></li>
						<li><a href="mailto:hoang@gmail.com?subject=Dear Hoàng"
							class="fab fa-google" aria-hidden="true"></a></li>
					</ul>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-md-4 col-lg-3">
				<div class="our-team">
					<div class="picture">
						<img class="img-fluid"
							src="https://picsum.photos/130/130?image=856">
					</div>
					<div class="team-content">
						<h3 class="name">Justin Duc</h3>
						<h4 class="title">Web Developer</h4>
					</div>
					<ul class="social">
						<li><a href="" class="fab fa-facebook-f" aria-hidden="true"></a></li>
						<li><a href="" class="fab fa-twitter" aria-hidden="true"></a></li>
						<li><a href="mailto:duc@gmail.com?subject=Dear Đức"
							class="fab fa-google" aria-hidden="true"></a></li>
					</ul>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-md-4 col-lg-3">
				<div class="our-team">
					<div class="picture">
						<img class="img-fluid"
							src="https://picsum.photos/130/130?image=836">
					</div>
					<div class="team-content">
						<h3 class="name">Mary Ly</h3>
						<h4 class="title">Web Developer</h4>
					</div>
					<ul class="social">
						<li><a href="" class="fab fa-facebook-f" aria-hidden="true"></a></li>
						<li><a href="" class="fab fa-twitter" aria-hidden="true"></a></li>
						<li><a href="mailto:ly@gmail.com?subject=Dear Ly"
							class="fab fa-google" aria-hidden="true"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>




</div>
<jsp:include page="layout/_footer.jsp"></jsp:include>
