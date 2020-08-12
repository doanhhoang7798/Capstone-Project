<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US">



<head>
<title>Yummy</title>
<style>
.flaticon {
	width: 35px;
	margin-top: -6px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/style.css"
	type="text/css" media="all" />

<!-- version 3.4 -->
<link
	href="${pageContext.request.contextPath}/resources/static/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<link
	href="${pageContext.request.contextPath}/resources/static/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">


</head>




<body>
	<!-- ============= HEADER STARTS HERE ============== -->
	<div id="header-wrapper" class="clearfix">
		<div id="header" class="clearfix">
			<!-- WEBSITE LOGO -->
			<a class="responsive_logo" href="${pageContext.request.contextPath}/"><img
				src="${pageContext.request.contextPath}/resources/static/images/yummyy.png"
				alt="" class="logo" /></a> <a href="index.html">
		</div>
		<!-- end of header div -->
		<span class="w-pet-border"></span>
		<!-- NAVIGATION BAR STARTS HERE -->
		<div id="nav-wrap">
			<div class="inn-nav clerfix">
				<!-- MAIN NAVIGATION STARTS HERE -->
				<ul id="" class="nav" style="width: 100%;">
					<li style="background: none;"><a
						href="${pageContext.request.contextPath}/"
						style="color: rgb(255, 255, 255);">Trang chủ </a></li>
					<li><a href="${pageContext.request.contextPath}/menu"
						style="color: rgb(255, 255, 255);">Mục lục</a></li>
					<li><a href="${pageContext.request.contextPath}/nutrition"
						style="color: rgb(255, 255, 255);"> Dinh dưỡng</a></li>
					<li><a href="${pageContext.request.contextPath}/tips"
						style="color: rgb(255, 255, 255);">Mẹo hay </a></li>
					<li><a href="${pageContext.request.contextPath}/contact"
						style="color: rgb(255, 255, 255);">Giới thiệu - Liên hệ</a></li>

					<c:choose>
						<c:when test="${user == null}">
							<li style="margin-left: 200px;" class="facebook"><a
								href="${pageContext.request.contextPath}/authorized/SignIn"
								style="color: rgb(255, 255, 255);">Đăng nhập </a>
							<li><a
								href="${pageContext.request.contextPath}/authorized/SignUp"
								style="color: rgb(255, 255, 255);">Đăng ký </a>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${user.getImage()  == null}">
									<li style="margin-left: 250px;"><img class="image_profile"
										style="margin-top: 3px; width: 35px; height: 35px;"
										src="${pageContext.request.contextPath}/resources/images/heart.png" />
									</li>
								</c:when>
								<c:otherwise>
									<li style="margin-left: 250px;"><img class="image_profile"
										style="margin-top: 3px; width: 35px; height: 35px;"
										src="${pageContext.request.contextPath }/resources/${user.getImage()}" />
									</li>
								</c:otherwise>
							</c:choose>
							<li><a style="color: rgb(255, 255, 255);">${ user.getFullname().split(" ")[0] }</a>
								<ul class="sub-menu" style="display: none;">
									<li style="background: none;"><a
										href="${pageContext.request.contextPath}/profile"
										style="color: rgb(255, 255, 255);">Cá nhân</a></li>
									<li><a
										href="${pageContext.request.contextPath}/filter?condition=${user.email }&category=likes">Bài
											viết yêu thích</a></li>
									<c:choose>
										<c:when test="${ user.getRole() == 10 }">
											<li><a
												href="${pageContext.request.contextPath}/admin/Dashboard"
												style="color: rgb(255, 255, 255);">Admin</a></li>
										</c:when>
										<c:otherwise>
											<li></li>
										</c:otherwise>
									</c:choose>
									<li><a href="${pageContext.request.contextPath}/SignOut"
										style="color: rgb(255, 255, 255);">Đăng xuất</a></li>
								</ul></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
		<!-- end of nav-wrap -->
		<!-- NAVIGATION BAR ENDS HERE -->
	</div>
	<!-- end of header-wrapper div -->
	<!-- ============= HEADER ENDS HERE ============== -->
	<!-- ============= CONTAINER STARTS HERE ============== -->
	<div class="main-wrap">
		<div id="container">
			<!-- WEBSITE SEARCH STARTS HERE -->
			<div class="top-search  clearfix">
				<h3 class="head-pet">
					<span>Yummy Tìm Kiếm </span>
				</h3>
				<form
					action="${pageContext.request.contextPath}/filter?category=likes&condition"
					id="searchform">
					<p>
						<input type="text" name="condition" id="s" class="field"
							placeholder="Từ khóa" /> <input type="submit" id="s-submit"
							value="" />
					</p>
				</form>
				<p class="statement">
					<span class="fireRed">Một số gợi ý:</span> <a href="#">Thịt bò</a>
					, <a href="#">Thịt gà</a> , <a href="#">Bánh ngọt</a> , <a href="#">Cá</a>
					, <a href="#">Mẹo hay</a> , <a href="#">Pizzas</a>, <a href="#">Khoai
						tây</a>, <a href="#">Phở</a>

				</p>
			</div>