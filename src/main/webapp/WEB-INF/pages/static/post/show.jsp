<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="../layout/_header.jsp"></jsp:include>



<style>
	.img-box-2 {
		width: 210px !important;
	}
</style>



<div id="content" class="clearfix " style="width: 100%;">
	<div id="left-area" class="clearfix" style="width: 91%;">

		<div class="post-53 post category-barbeque" id="post-53">


			<h3 style="font-size: 30px; text-align: center; margin: 30px 0px;" class="single-post-title">${ post.title }
			</h3>


			<div class="post-53 post category-barbeque" style="width: 100%;">
				<div class="blog-div with20">
					<h3 style="text-align: center;">Thời gian</h3>
					<h5 style="text-align: center;">${ post.time }Phút</h5>
				</div>
				<div class="blog-div with20">
					<h3 style="text-align: center;">Khẩu phần</h3>
					<h5 style="text-align: center;">${ post.ration }người</h5>

				</div>

				<div class="blog-div with20">
					<h3 style="text-align: center;">Cách thức</h3>
					<h5 style="text-align: center;">${ post.kind }</h5>

				</div>

				<div class="blog-div with20">
					<h3 style="text-align: center;">Mức độ</h3>
					<h5 style="text-align: center;">${ post.level }</h5>


				</div>

				<div class="blog-div with20">
					<h3 style="text-align: center;">Giá thành</h3>
					<h4 style="text-align: center;">${ post.price }K</h4>

				</div>



			</div>



			<div class="post-thumb single-img-box" style="width: 100%;">
				<a title="Best Bread pairing for Barbeque?"> <embed id="video" src="${ post.video_url }"
						type="application/x-shockwave-flash" width="889" height="400" autostart="true" loop="true"
						title="Adobe Flash Player"></embed>

				</a>
			</div>


			<div style="width: 100%; height: 60px;">
				<div id="show_view" style="width: 50%; float: left; height: 40px;">

					<c:choose>
						<c:when test="${user.getFullname()  == null}">
							<a href="${pageContext.request.contextPath}/authorized/SignIn">
								<i class="fa fa-heart fa-3x icon-inline" aria-hidden="true"></i>
							</a>

						</c:when>
						<c:otherwise>

							<a id="send-like" style="background: white; border: aliceblue;" type="submit">
								<i class="fa fa-heart fa-3x icon-inline" aria-hidden="true"></i>


							</a>
						</c:otherwise>
					</c:choose>

					<span id="like-data" class="span-inline">${ reaction }
						&nbsp; Lượt thích </span>
				</div>



				<div style="width: 50%; float: left; height: 40px;">

					<i class="fa fa-eye fa-3x icon-inline-left" aria-hidden="true"></i>
					<span class="span-inline"> &nbsp; ${ post.view_conter }
						&nbsp; Lượt xem </span>
				</div>


				<script>
					var isLike = '${ isLike }'

					isLike == 'true' ? $(".icon-inline").css("color", "firebrick ") : $(".icon-inline").css("color", "black ");

					$("#send-like").click(function () {
						isLike == 'true' ? isLike = 'false' : isLike = "true";
						isLike == 'false' ? $(".icon-inline").css("color", "black ") : $(".icon-inline").css("color", "firebrick ");

						$.ajax({
							type: "POST",
							contentType: "application/json; charset=utf-8",
							data: JSON.stringify("Create-Reaction"),
							dataType: "json",
							url: "${pageContext.request.contextPath}/reaction/${post.id}",
							success: function (data) {
								console.log("Server Excute", data);
								$("#like-data").html(data + "&nbsp; Lượt thích");

							},
							error: function (data) {
								console.log("Server Error");
							},
						});
					});
				</script>


			</div>


			<div class="blog-div with30">
				<h3 style="text-align: center;">Xuất xứ</h3>
				<h5 style="text-align: center;">${ post.nation }</h5>
			</div>
			<div class="blog-div with30">
				<h3 style="text-align: center;">Ngày lễ/Kỉ</h3>
				<h5 style="text-align: center;">${ post.holiday }</h5>

			</div>

			<div class="blog-div with30">
				<h3 style="text-align: center;">Thể loại</h3>
				<h5 style="text-align: center;">${ post.category }</h5>

			</div>

			<div class="blog-div with30">
				<h3 style="text-align: center;">Phù hợp</h3>
				<h5 style="text-align: center;">${ post.suitable }</h5>


			</div>

			<h1 class="w-bot-border">
				Giới <span> thiệu</span>
			</h1>
			<p style="text-align: justify">${ post.overview }</p>
			<h1 class="w-bot-border">
				Cách <span>làm </span>
			</h1>
			<p style="text-align: justify">${ post.making }</p>
			<h1 class="w-bot-border">
				Nguyên <span>liệu </span>
			</h1>
			<p style="text-align: justify">${ post.material }</p>

		</div>
		<!-- end of post div -->


		<div class="comments">
			<div id="whats-hot">
				<h1 style="margin: 20px 0px">
					Các món liên quan <span> ${user.role } </span>
				</h1>

				<a style="float: right; left: 1169px;; top: 203px; line-height: 16px; font-size: 12px; height: 29px; position: absolute;"
					class="btn btn btn-info" id="edit-button"
					href="${pageContext.request.contextPath}/post-edit/${post.id}"><i class="fa fa-edit"
						aria-hidden="true"></i> Sửa </a> <span class="w-pet-border"></span>
				
				
				<script>
				
				c
				// Check user login and return button edit post
				var user_role = '${user.role }';
				var user_id = '${user.id }';

				var post_user = 'post.user.id'
				
				console.log("hello", '${user.role }')

				if (user_role == 10 || user_role == 5 || user_id == post_user) {

					$("#edit-button").css("display", "block");
				} else {
					$("#edit-button").css("display", "none");

				}
				
				
				
				</script>
				
				<div style="height: 259px;">
					<ul class="cat-list">
						<c:forEach items="${ refer }" var="item">
							<li class="img-box-2">
								<h3>
									<a href="recipe-single-1.html">${ item.price } + ${ item.kind }</a>
								</h3> <a href="recipe-single-1.html" class="img-box img-box-2"> <img
										src="${pageContext.request.contextPath}/resources/static/images/demo/Goat-Cheese-Chorizo-Rolls2-222x144.jpg"
										class="attachment-recipe-4column-thumb wp-post-image"
										alt="Goat-Cheese-Chorizo-Rolls2" />
								</a>
								<h4>
									<a class="split-text"> ${ item.title } </a>
								</h4>
								<p class="split-text">
									${ item.overview } <a href="recipe-single-1.html">...more </a>
								</p>
							</li>
						</c:forEach>
					</ul>


				</div>

			</div>

			<!-- You can start editing here. -->



			<div>
				<h1 id="comments">
					Comment <span>${user.role }</span>
				</h1>
			</div>

		



			<span class="w-pet-border"></span>




			<c:choose>
				<c:when test="${user.getStatus()  == null}">

					<h1>Vui lòng đăng nhập để bình luận .</h1>
				</c:when>
				<c:when test="${user.getStatus()  == 5}">

					<h1>Tài khoản của bạn đã bị khoá chức năng bình luận.</h1>

				</c:when>
				<c:otherwise>

					<div id="comment-box-display" class="container pb-cmnt-container">
						<div class="row">
							<div class="col-md-9">
								<div class="panel panel-info">
									<div class="panel-body">
										<textarea cols=111 placeholder="Write your comment here!"
											class="pb-cmnt-textarea"></textarea>
										<form class="form-inline">
											<div class="btn-group">
												<button class="btn" type="button">
													<span class="fa fa-picture-o fa-lg"></span>
												</button>
												<button class="btn" type="button">
													<span class="fa fa-video-camera fa-lg"></span>
												</button>
												<button class="btn" type="button">
													<span class="fa fa-microphone fa-lg"></span>
												</button>
												<button class="btn" type="button">
													<span class="fa fa-music fa-lg"></span>
												</button>
											</div>
											<button class="btn btn-primary pull-right" type="button">Share</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>





				</c:otherwise>
			</c:choose>



			<ol class="comment-list">
				<li class="comment byuser comment-author-admin bypostauthor even thread-even depth-1" id="comment-7">

					<div class="img-box">
						<a href="#"> <img
								src="http://0.gravatar.com/avatar/66a10cd6fc9b85636291aa4fe7c32c7f?s=67&amp;d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D67&amp;r=G"
								class="avatar avatar-67 photo" alt="">
						</a>
					</div>
					<div class="comment-body" style="width: 91%;">
						<a style="font-size: 15px; font-weight: 600;" class="meta">posted
							by admin on <span> March 24, 2015 </span>
						</a>

						<div class="comment">
							<p>Habitasse egestas pulvinar? Ac? A egestas est sit augue!
								Ac est nunc mauris turpis, augue eu nisi vut et! Pulvinar!
								Scelerisque est parturient in,</p>
						</div>

						<div class="reply">
							<button class="btn btn btn-danger comment-reply-link" href="#"
								aria-label="Reply to admin">Báo cáo</button>
						</div>

					</div>

				</li>
				<!-- #comment-## -->
			</ol>



		</div>
		<!-- end of comments div -->


	</div>


</div>






<jsp:include page="../layout/_footer.jsp"></jsp:include>