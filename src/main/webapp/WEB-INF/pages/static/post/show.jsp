<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.rate-box {
	width: 100%;
	height: 22%;
	padding: 5px 20px 0 30px;
	margin: 0 0 25px;
	background:
		url(${pageContext.request.contextPath}/resources/static/images/rate-box-bg.png)
		no-repeat;
}

pre {
	white-space: pre-wrap;
}
</style>
<jsp:include page="../layout/_header.jsp"></jsp:include>
<div class="container">
	<div id=" modal fade" class="report-dialog" role="dialog">
		<div class="modal-dialog" id="modal-dialog-report" style="top: 15px;">
			<div style="padding: 8px;" class="modal-content">
				<div style="padding: 8px;" class="modal-body">
					<h3 style="text-align: center; color: black;" id="r_msg"></h3>
				</div>
				<div class="modal-footer dialog-center">
					<button type="button" class="btn btn-default r-close"
						data-dismiss="modal">Thoát</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="content" class="clearfix ">
	<div id="left-area" style="width: 600px;" class="clearfix">
		<!-- Starting Default Loop -->
		<script>
		
		debugger
		</script>
		<h1 class="title fn">${post.title }</h1>
		<span class="published">2013-02-06</span>
		<!-- Recipe Categorization Information -->
		<ul class="recipe-cat-info clearfix">
			<li>Xuất xứ: <a
				href="${pageContext.request.contextPath}/filter?condition=${ post.nation }&category=nation"
				rel="tag">${ post.nation } </a>
			</li>
			<li>Nguyên liệu: <a
				href="${pageContext.request.contextPath}/filter?condition=${ post.main_material }&category=main_material"
				rel="tag">${ post.main_material} </a>
			</li>
			<li>Thể loại: <a
				href="${pageContext.request.contextPath}/filter?condition=${ post.category }&category=category"
				rel="tag">${ post.category }</a>
			</li>
			<li>Giá thành: <a style="color: #5b5b5b" rel="tag">${ post.price }k</a>
			</li>
		</ul>
		<!-- Recipe Single Image -->
		<div class="single-img-box ">
			<div class="single-slider cycle-slideshow "
				data-cycle-pager=".cycle-pager" style="position: relative;">
				<a title="Best Bread pairing for Barbeque?"> <embed id="video"
						src="${ post.video_url }" type="application/x-shockwave-flash"
						style="margin-left: 0.5%; border-radius: 5px;" width="99%"
						height="40%" autostart="true" loop="true"
						title="Adobe Flash Player"></embed>
				</a>
			</div>
		</div>
		<!-- Recipe Information -->
		<ul class="recipe-info clearfix">
			<li class="yield"><strong style="color: #5b5b5b" class="name">Cách
					thức :</strong> <a class="value"
				href="${pageContext.request.contextPath}/filter?condition=${ post.kind }&category=kind">
					${ post.kind } </a></li>
			<li class="servings"><strong style="color: #5b5b5b" class="name">Khẩu
					phần :</strong> <span class="value">${ post.ration } </span></li>
			<li class="prep-time"><strong style="color: #5b5b5b"
				class="name">Thời gian :</strong> <span class="value">${ post.time }
					h</span></li>
		</ul>
		<ul class="recipe-info clearfix">
			<li class="cook-time"><strong style="color: #5b5b5b"
				class="name">Phù hợp :</strong> <a class="value"
				href="${pageContext.request.contextPath}/filter?condition=${ post.suitable }&category=suitable">${ post.suitable }</a>
			</li>
			<li class="ready-in"><strong style="color: #5b5b5b" class="name">Ngày
					lễ/Kỉ niệm: </strong> <a class="value"
				href="${pageContext.request.contextPath}/filter?condition=${ post.holiday }&category=holiday">${ post.holiday }
			</a></li>
			<c:choose>
				<c:when test="${user.getFullname()  == null}">
					<a href="${pageContext.request.contextPath}/authorized/SignIn">
						<i
						style="position: absolute; margin-left: 110px; margin-top: -27px;"
						class="fa fa-heart fa-3x icon-inline" aria-hidden="true"></i>
					</a>
				</c:when>
				<c:otherwise>
					<a id="send-like" style="background: white; border: aliceblue;"
						type="submit"> <i
						style="position: absolute; margin-left: 110px; margin-top: -27px;"
						class="fa fa-heart fa-3x icon-inline" aria-hidden="true"></i>
					</a>
				</c:otherwise>
			</c:choose>
		</ul>
		<span class="w-pet-border"></span>
		<div class="info-left instructions" style="width: 100%;">
			<div itemprop="description">
				<h1 class="w-bot-border">
					<span> Giới thiệu</span>
				</h1>
				<pre>${ post.overview }</pre>
				<h1 class="w-bot-border">
					<span>Cách làm </span>
				</h1>
				<pre>${ post.making }</pre>
				<h1 class="w-bot-border">
					<span>Nguyên liệu & thành phần </span>
				</h1>
				<pre>${ post.material_detail }</pre>
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
							<div class="col-md-6">
								<div class="panel panel-info">
									<div class="panel-body">
										<form class="form-inline" id="f-c-c" method="POST">
											<textarea id="c-c-content" name="content" class="col-md-12"
												placeholder="Viết bình luận của bạn!"
												class="pb-cmnt-textarea"></textarea>
											<div class="btn-group">
												<div class="btn"
													style="background-color: #EFEFEFEF; margin-left: -20px; margin-left: -120px; margin-top: 8px;">
													<input onchange="readURL2(this);"
														style="width: 17px; height: 24px;"
														class="fas fa-cloud-upload-alt" id="c-c-image" type="file" />
													<button class="btn btn-primary pull-right"
														style="margin-left: 65%; position: absolute; margin-top: -76.5%; height: 38px;"
														id="comment-create" type="submit">
														<i class="fas fa-paper-plane"></i>
													</button>
												</div>
											</div>
											<c:choose>
												<c:when test="${ comment.image_url == null}">
													<img class="blah2"
														style="margin-top: 10px; margin-left: 42px;" src="">
												</c:when>
											</c:choose>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${post.comments.size() == 0 }">
					<div id="refresh">
						<ol id="comment-list" class="comment-list">
							<h4 style="font-size: 23px; text-align: center;">Chưa có
								bình luận cho bài viết này.</h4>
						</ol>
					</div>
				</c:when>
				<c:otherwise>
					<div id="refresh">
						<c:forEach items="${ post.comments }" var="comment">
							<ol class="comment-list">
								<li style="width: 98%;"
									class="comment byuser comment-author-admin bypostauthor even thread-even depth-1">
									<div style="" class="img-box">
										<a href="#"> <img style=""
											src="${pageContext.request.contextPath}/resources/${ comment.user.image }"
											class="avatar avatar-67 photo" alt="">
										</a>
									</div>
									<div class="comment-body"
										style="position: relative; width: 100%;">
										<a style="margin-left: 0%; font-size: 15px; font-weight: 600;"
											class="meta"> ${ comment.user.fullname } <span> </span>
										</a>
										<div style="margin-left: 12%;" class="comment">
											<p class="show_content_${comment.id }"
												style="display: display: block">${comment.content }</p>
											<c:choose>
												<c:when test="${ comment.image_url.isEmpty() }">
													<img class="show_content_${comment.id }"
														style="display: none;" src="">
												</c:when>
												<c:otherwise>
													<img class="show_content_${comment.id }"
														style="margin-top: 10px;"
														src="${pageContext.request.contextPath}/resources/${ comment.image_url }">
												</c:otherwise>
											</c:choose>
											<div
												class="container pb-cmnt-container open-update_${comment.id }"
												style="display: none;">
												<input type=hidden id="c_user_${comment.id }"
													value="${comment.user.id }">
												<div class="row">
													<div class="col col-lg-5">
														<div class="panel panel-info">
															<div class="panel-body">
																<!-- ============================================== Edit comment  ======================================================== -->
																<form class="form-inline" method="POST"
																	enctype="multipart/form-data">
																	<textarea id="c-e-content-${comment.id}"
																		style="height: 10%;" name="content" class="col-md-12"
																		placeholder="Viết bình luận của bạn!"
																		class="pb-cmnt-textarea">${comment.content }</textarea>
																	<div class="btn-group">
																		<div class="btn"
																			style="background-color: #EFEFEFEF; margin-left: -110px; margin-top: 10px;">
																			<input style="width: 17px; height: 24px;"
																				id="c-e-image-${comment.id }"
																				class="fas fa-cloud-upload-alt"
																				onchange="readURL(this);" type="file" />
																		</div>
																	</div>
																	<button class="btn btn-info pull-right"
																		style="right: 11%; position: absolute; margin-top: -12%; height: 38px;"
																		id="c-e-${comment.id }" data-toggle="modal"
																		data-target="#c-e-modal" type="submit">
																		<i class="fa fa-edit"></i>
																	</button>
																	<c:choose>
																		<c:when test="${ comment.image_url == null}">
                                       HAHAH
                                    </c:when>
																		<c:otherwise>
																			<img class="blah" style="margin-top: 10px;"
																				src="${pageContext.request.contextPath}/resources/${ comment.image_url }">
																		</c:otherwise>
																	</c:choose>


																</form>
																<!-- ============================================== Edit comment  ======================================================== -->
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<input type="hidden" class="comment_id" id="comment"
											value="${comment.id }"> <input type="hidden"
											class="comment_author" value="${comment.user.id }">
										<div class="reply">
											<c:choose>
												<c:when test="${ comment.user.id == user.id }">
													<a class="comment_edit cmt-inline"> | Sửa | </a>
													<a class="comment_delete cmt-inline" data-toggle="modal"
														data-target="#c-d-modal">Xoá |</a>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${ user.getFullname() == null}">

															<a class="comment_report cmt-inline"
																href="${pageContext.request.contextPath}/authorized/SignIn">|Report|</a>
														</c:when>
														<c:otherwise>
															<a class="comment_report cmt-inline" data-toggle="modal"
																data-target="#c-r-modal">|Report|</a>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</li>
								<!-- #comment-## -->
							</ol>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="bot-ads-area">
			<div class="ads-642x79">
				<a href="#"><img
					src="${pageContext.request.contextPath}/resources/static//images/top.png"
					alt="Recipe Ads"></a>
			</div>
		</div>
		<!-- end of info-left div -->
		<!-- Default Comments -->
	</div>
	<!-- end of left-area -->
	<!-- LEFT AREA ENDS HERE -->
	<div id="sidebar" style="width: 288px;">
		<div class="widget fav-recipes nostylewt">
			<h3 class="w-bot-border">
				<span> Món liên quan</span> 
			</h3>
			<div class="tabed">
				<ul class="tabs clearfix">
					<li class="current">${post.kind }<span></span></li>
				</ul>
				<div class="block current">
					<ul class="highest">
						<c:forEach items="${ refer }" var="item">
							<li><a href="" class="img-box"> <embed id="video"
										src="${ post.video_url }" type="application/x-shockwave-flash"
										style="border-radius: 5px;" width="99%" height="100%"
										autostart="true" loop="true" title="Adobe Flash Player"></embed>
							</a>
								<h5>
									<a
										href="${pageContext.request.contextPath}/post-show/${ item.id}">${ item.title}</a>
								</h5>
								<p class="rate">
								<p>
									${item.reactions.size()  } lượt thích <span>//</span> ${ item.view_conter }
									lượt xem
								</p></li>
						</c:forEach>
					</ul>
				</div>
				<!-- end of block div -->
				<!-- end of block div -->
				<!-- end of block div -->
				<div class="bot-border"></div>
			</div>
			<!-- end of tabed div -->
		</div>
		<div id="recipes-from-recipe-type-2"
			class="widget nostylewt Recipes_from_Recipe_Type clearfix">
			<div class="recipes-slider-widget rt">
				<h3 class="w-bot-border">
					<span>Thông tin &amp; bài viết</span>
				</h3>
				<div style="" class="rate-box">
					<h6>Lượt thích</h6>
					<p id="output"></p>
					<p class="status">
						<i class="fa fa-heart " aria-hidden="true"></i>&nbsp;&nbsp;<span
							id="couter_like">${ post.reactions.size()} lượt thích </span>
					</p>
					<h6>Lượt xem</h6>
					<p class="status">
						<i class="fa fa-eye" aria-hidden="true"></i>&nbsp; &nbsp;<span>${post.view_conter }
							lượt xem </span>
					</p>
					<h6>Bình luận</h6>
					<p class="status">
						<i class="fa fa-comment" aria-hidden="true"></i>&nbsp;&nbsp;<span
							id="sub-comment">${post.comments.size() } bình luận </span>
					</p>
				</div>
			</div>
		</div>

		<div
			class="widget nostylewt Weekly_Special_Widget wk-special clearfix">
			<h2 class="w-bot-border">
				<span>Bài viết mới</span> 
			</h2>
			<c:forEach items="${ news }" var="item">
				<div class="img-box for-all">
					<a href="" class="img-box"> <embed id="video"
							src="${ item.video_url }" type="application/x-shockwave-flash"
							style="border-radius: 5px;" width="100%" height="15%"
							autostart="true" loop="true" title="Adobe Flash Player"></embed>
					</a>
				</div>
				<div class="for-res"></div>
				<h4>
					<a href="${pageContext.request.contextPath}/post-show/${item.id }">${ item.title }</a>
				</h4>
				<p class="split-text">${ item.overview }
					<a href="${pageContext.request.contextPath}/post-show/${item.id }">
						Xem thêm...</a>
				</p>
			</c:forEach>
		</div>
	</div>
</div>




<div id="content" class=" " style="width: 100%;">
	<!-- ============================================== Comfirm diaglog ======================================================== -->
	<div class="container">
		<div class="modal fade" id="c-e-modal" role="dialog">
			<div class="modal-dialog" style="top: 30%;">
				<div style="padding: 8px;" class="modal-content">
					<div style="padding: 8px;" class="modal-body">
						<h3 style="text-align: center; color: black;">Xác nhận cập
							nhật bình luận?</h3>
					</div>
					<div class="modal-footer dialog-center">
						<button type="button" class="btn btn-default" data-dismiss="modal">Huỷ
						</button>
						<button type="submit" id="c-e-confirm" class="btn btn-info"
							data-dismiss="modal">Xác nhận</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="modal fade" id="c-d-modal" role="dialog">
			<div class="modal-dialog" style="top: 30%;">
				<div style="padding: 8px;" class="modal-content">
					<div style="padding: 8px;" class="modal-body">
						<h3 style="text-align: center; color: black;">Bạn có chắc
							chắn muốn xoá bình luận này ?</h3>
					</div>
					<div class="modal-footer dialog-center">
						<button type="button" class="btn btn-default" data-dismiss="modal">Huỷ
						</button>
						<button type="submit" id="c-d-confirm" class="btn btn-info"
							data-dismiss="modal">Xác nhận</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="modal fade" id="c-r-modal" role="dialog">
			<div class="modal-dialog" style="top: 30%;">
				<div style="padding: 8px;" class="modal-content">
					<form
						action="${pageContext.request.contextPath}/report/create/${post.id}"
						method="post">
						<div style="padding: 8px;" class="modal-body checked">
							<input type="hidden" name="cmt_id" id="cmt_id">
							<input type="hidden" name="report_author"
								id="report_author">
							<ul class="ks-cboxtags">
								<li><input type="checkbox" id="checkboxFive"
									name="report_type" value="1" checked /><label
									for="checkboxFive">Spam</label></li>
								<li><input type="checkbox" id="checkboxSix"
									name="report_type" value="2" /><label for="checkboxSix">Bạo
										lực</label></li>
								<li><input type="checkbox" id="checkboxSeven"
									name="report_type" value="3" /><label for="checkboxSeven">Nội
										dung đồi truỵ</label></li>
								<li><input type="checkbox" id="checkboxEight"
									name="report_type" value="4" /><label for="checkboxEight">Nội
										dung khiếm nhã </label></li>
								<li><input type="checkbox" id="checkboxNine"
									name="report_type" value="5" /><label for="checkboxNine">
										Gây hiểu nhầm hoặc lừa đảo</label></li>
							</ul>
						</div>
						<div class="modal-footer dialog-center">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Huỷ</button>
							<button type="submit" id="c-r-confirm" class="btn btn-info">Xác
								nhận</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" id="afterId">
	<!-- ============================================== Comfirm diaglog ======================================================== -->
	<script type="text/javascript">
		$(document).ready(function() {
			$("input:checkbox").click(function() {
				$("input:checkbox").not(this).prop("checked", false);
			});
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$(".blah").attr("src", e.target.result).width(200).height(
							174);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}

		function readURL2(input) {
			$(".blah2").show();
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$(".blah2").attr("src", e.target.result).width(200).height(
							174);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<script type="text/javascript">
		var isLike = "${ isLike }";
		isLike == "true" ? $(".icon-inline").css("color", "firebrick ") : $(
				".icon-inline").css("color", "black ");
		var report_mgs = "${ pageContext.request.getParameter('report_msg') }";
		var report_style = "${ pageContext.request.getParameter('r_class_name') }";

		var user_role = "${user.role }";
		var user_id = "${user.id }";
		var post_user = "${post.user.id}";

		console.log("hello", "${user.role }");

		$("#p-e-button").hide();
		if (user_role == 10 || user_role == 5 || user_id == post_user) {
			$("#p-e-button").show();
		}

		if (report_mgs == "") {
			$(".report-dialog").hide();
		} else {
			$("#r_msg").val(report_mgs);
			$(".report-dialog").show();
			$("#r_msg").text(report_mgs);
			setTimeout(function() {
				$(".report-dialog").hide();
			}, 4000);
		}
		$(".comment_report").click(function() {
			var $row = $(this).closest("ol"); // Find the row
			var id = $row.find(".comment_id").val(); // Find the text
			var author_id = $row.find(".comment_author").val(); // Find the text

			console.log("ID", author_id);
			$("#cmt_id").val(id);
			$("#report_author").val(author_id);
		});
		$(".r-close").click(function() {
			$(".report-dialog").hide("slow");
		});

		$("#refresh")
				.on(
						"click",
						".comment_edit",
						function() {
							console.log("CLICK EDIT");
							var $row = $(this).closest("ol");
							var id = $row.find(".comment_id").val();
							var afterId = $("#afterId").val();

							if (afterId == id) {
								$(".open-update_" + id).show();
								$(".show_content_" + id).hide();
								$("#afterId").val(id);
							} else {
								$(".open-update_" + afterId).hide();
								$(".show_content_" + afterId).show();
								$(".open-update_" + id).show();
								$(".show_content_" + id).hide();
								$("#afterId").val(id);
							}

							$("#c-e-" + id)
									.click(
											function(evt) {
												console.log("CLICK SEND DATA",
														id);
												evt.preventDefault();

												var fileNull = new File([ "" ],
														"filename");
												var file = $("#c-e-image-" + id)
														.prop("files")[0] == undefined ? fileNull
														: $("#c-e-image-" + id)
																.prop("files")[0];
												var content = $(
														"#c-e-content-" + id)
														.val();
												var c_user = $("#c_user_" + id)
														.val();

												var formData = new FormData();

												formData.append("c_user",
														c_user);
												formData.append("c_id", id);
												formData.append("image", file);
												formData.append("content",
														content);

												$("#c-e-confirm")
														.click(
																function(evt) {
																	console
																			.log("CLICK CONFIRM CHANGE");
																	$
																			.ajax({
																				type : "POST",
																				url : "${pageContext.request.contextPath}/comment/edit/${post.id}",
																				data : formData,
																				cache : false,
																				contentType : false,
																				processData : false,
																				success : function(
																						data) {
																					console
																							.log("EDIT SUCCESS");
																					isLike == "true" ? (isLike = "false")
																							: (isLike = "true");
																					$(
																							"#c-count")
																							.html(
																									"( "
																											+ data
																											+ " )");
																					$(
																							"#sub-comment")
																							.html(
																									data
																											+ " bình luận ");

																					setTimeout(
																							function() {
																								$(
																										"#refresh")
																										.load(
																												" #refresh");
																							},
																							800);
																				},
																				error : function(
																						data) {
																					alert(" Lỗi hệ thống, vui lòng thử lại sau!");
																				},
																			});
																});
											});
						});

		$("#refresh")
				.on(
						"click",
						".comment_delete",
						function() {
							var $row = $(this).closest("ol");
							var id = $row.find(".comment_id").val();
							var formData = new FormData();
							formData.append("c_user", $("#c_user_" + id).val());

							$("#c-d-confirm")
									.click(
											function() {
												$
														.ajax({
															type : "POST",
															data : formData,
															cache : false,
															contentType : false,
															processData : false,
															url : "${pageContext.request.contextPath}/comment/delete/"
																	+ id,
															success : function(
																	data) {
																$("#c-count")
																		.html(
																				"( "
																						+ data
																						+ " )");
																$(
																		"#sub-comment")
																		.html(
																				data
																						+ " bình luận ");

																setTimeout(
																		function() {
																			$(
																					"#refresh")
																					.load(
																							" #refresh");
																		}, 800);
															},
															error : function(
																	data) {
																console
																		.log(" Lỗi hệ thống, vui lòng thử lại sau!");
															},
														});
											});
						});

		$("#comment-create")
				.click(
						function(evt) {
							evt.preventDefault();

							if ($("#c-c-image").prop("files")[0] == null
									&& $("#c-c-content").val() == "") {
								document
										.getElementById("c-c-content")
										.setCustomValidity(
												"This field cannot be left blank");
							} else {
								console.log("PASSS VALIDATE");

								var formData = new FormData();
								formData.append("image", $("#c-c-image").prop(
										"files")[0] == undefined ? new File(
										[ "" ], "filename") : $("#c-c-image")
										.prop("files")[0]);
								formData.append("content", $("#c-c-content")
										.val());
								$
										.ajax({
											type : "POST",
											url : "${pageContext.request.contextPath}/comment/create/${post.id}",
											data : formData,
											cache : false,
											contentType : false,
											processData : false,
											success : function(data) {
												$("#c-c-content").val('');
												$('#c-c-image').val('');
												$(".blah2").val('');
												$("#c-count").html(
														"( " + data + " )");
												$("#sub-comment").html(
														data + " bình luận ");
												$(".blah2").hide();
												setTimeout(function() {
													$("#refresh").load(
															" #refresh");

												}, 200);
											},
											error : function(data) {
												alert(" Lỗi hệ thống, vui lòng thử lại sau!");
											},
										});
							}
						});

		$("#send-like")
				.click(
						function() {
							isLike == "true" ? (isLike = "false")
									: (isLike = "true");
							isLike == "false" ? $(".icon-inline").css("color",
									"black ") : $(".icon-inline").css("color",
									"firebrick ");

							$
									.ajax({
										type : "POST",
										contentType : "application/json; charset=utf-8",
										data : JSON
												.stringify("Create-Reaction"),
										dataType : "json",
										url : "${pageContext.request.contextPath}/reaction/${post.id}",
										success : function(data) {
											$("#like-data").html(
													data + "&nbsp; Lượt thích");
											$("#couter_like").html(
													data + "&nbsp; Lượt thích");
										},
										error : function(data) {
											alert(" Lỗi hệ thống, vui lòng thử lại sau!");
										},
									});
						});
	</script>
</div>
<jsp:include page="../layout/_footer.jsp"></jsp:include>