<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
<<<<<<<
HEAD
 ======= .rate-box {
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
>>>>>>>
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


<div id="content" class="clearfix " style="width: 100%;">
	<div id="left-area" class="clearfix" style="width: 60%;">
		<div class="post-53 post category-barbeque" id="post-53">
			<!-- Starting Default Loop -->
			<h1 class="title fn">${post.title }</h1>
			<span class="published">2013-02-06</span>
			<!-- Recipe Categorization Information -->
			<ul class="recipe-cat-info clearfix">
				<li>Xuất xứ: <a
					href="${pageContext.request.contextPath}/filter?condition=${ post.nation }&category=nation"
					rel="tag">${ post.nation } </a>
				</li>
				<li>Nguyên liệu: <a
					href="${pageContext.request.contextPath}/filter?condition=${ post.main_meterial }&category=main_meterial"
					rel="tag">${ post.main_meterial } </a>
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
				<li class="servings"><strong style="color: #5b5b5b"
					class="name">Khẩu phần :</strong> <span class="value">${ post.ration }
				</span></li>
				<li class="prep-time"><strong style="color: #5b5b5b"
					class="name">Thời gian :</strong> <span class="value">${ post.time }
						h</span></li>
			</ul>
			<ul class="recipe-info clearfix">
				<li class="cook-time"><strong style="color: #5b5b5b"
					class="name">Phù hợp :</strong> <a class="value"
					href="${pageContext.request.contextPath}/filter?condition=${ post.suitable }&category=suitable">${ post.suitable }</a>
				</li>
				<li class="ready-in"><strong style="color: #5b5b5b"
					class="name">Ngày lễ/Kỉ niệm: </strong> <a class="value"
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
						 <span>Giới thiệu</span>
					</h1>
					<pre>${ post.overview }</pre>
					<h1 class="w-bot-border">
						<span>Cách làm </span>
					</h1>
					<pre>${ post.making }</pre>
					<h1 class="w-bot-border">
						<span>Nguyên liệu & thành phần </span>
					</h1>
					<pre>${ post.main_meterial }</pre>
				</div>
				<div>
					<h1 style="float: left;">
						 <span id="c-count">Comment </span>( ${ post.comments.size() } ) 
					</h1>
					<a class="btn btn btn-info"
						style="float: right; margin-top: 1%; margin-right: 13%;"
						id="p-e-button"
						href="${pageContext.request.contextPath}/post-edit/${post.id}"><i
						class="fa fa-edit" aria-hidden="true"></i> Sửa </a>
				</div>
				<span class="w-pet-border"></span>
				<c:choose>
					<c:when test="${user.getStatus()  == null}">
						<h1>Vui lòng đăng nhập để bình luận.</h1>
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
															class="fas fa-cloud-upload-alt" id="c-c-image"
															type="file" />
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
				<!-- ============================================== Ref Post ======================================================== -->
				<div>
					<h1>
						<span id="c-count"> Comment </span>( ${ post.comments.size() } )
					</h1>
				</div>
				<!-- ============================================== Create Comment ======================================================== -->
				<span class="w-pet-border"></span>
				<c:choose>
					<c:when test="${user.getStatus()  == null}">
						<h1>Vui lòng đăng nhập để bình luận.</h1>
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
											<form class="form-inline" method="POST">
												<textarea id="c-c-content" name="content" class="col-md-12"
													placeholder="Write your comment here!"
													class="pb-cmnt-textarea"></textarea>
												<div class="btn-group">
													<div class="btn"
														style="background-color: #EFEFEFEF; margin-left: -20px; margin-left: -120px; margin-top: 8px;">
														<input style="width: 20px; height: 24px;"
															class="fa fa-picture-o fa-lg" id="c-c-image" type="file" />
													</div>
												</div>
												<button class="btn btn-primary pull-right"
													style="margin-left: -65px; position: absolute; margin-top: 9px; height: 38px;"
													id="comment-create" type="submit">Gửi</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<!-- ============================================== Create Comment ======================================================== -->
				<!-- ============================================== Create list ======================================================== -->
				<c:choose>
					<c:when test="${post.comments.size() == 0 }">
						<div id="refresh">
							<ol id="comment-list" class="comment-list">
								<h1 style="font-size: 41px; text-align: center;">Chưa có
									bình luận cho bài viết này.</h1>
							</ol>
						</div>
					</c:when>
					<c:otherwise>
						<div id="refresh">
							<c:forEach items="${ post.comments }" var="comment">
								<ol class="comment-list">
									<li
										class="comment byuser comment-author-admin bypostauthor even thread-even depth-1">
										<div class="img-box">
											<a href="#"> <img
												src="${pageContext.request.contextPath}/resources/${ comment.user.image }"
												class="avatar avatar-67 photo" alt="">
											</a>
										</div>
										<div class="comment-body"
											style="position: relative; width: 91%;">
											<a style="font-size: 15px; font-weight: 600;" class="meta">
												${ comment.user.fullname } <span> </span>
											</a>
											<div class="comment">
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
														<div class="col-md-8">
															<div class="panel panel-info">
																<div class="panel-body">
																	<!-- ============================================== Edit comment  ======================================================== -->
																	<form class="form-inline" method="POST"
																		enctype="multipart/form-data">
																		<textarea id="c-e-content-${comment.id}"
																			style="height: 6%;" name="content" class="col-md-12"
																			placeholder="Viết bình luận của bạn!"
																			class="pb-cmnt-textarea">${comment.content }</textarea>
																		<div class="btn-group">
																			<div class="btn"
																				style="background-color: #EFEFEFEF; margin-left: -20px; margin-left: -103px; margin-top: 10px;">
																				<input style="width: 17px; height: 24px;"
																					id="c-e-image-${comment.id }"
																					class="fas fa-cloud-upload-alt"
																					onchange="readURL(this);" type="file" />
																			</div>
																		</div>
																		<button class="btn btn-info pull-right"
																			style="right: 9%; position: absolute; margin-top: -9.3%; height: 38px;"
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

											<div style="float: right !important;" class="reply">
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
				<!-- ============================================== comment list ======================================================== -->
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
									<!--                 /// -->
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
					<span>Thông tin  &amp; bài viết</span>
				</h3>
				<div class="cookname">
					<div class="img-box">
						<a class="imgc" href="#"> <img class="auth-photo"
							src="${pageContext.request.contextPath}/resources/${ post.user.image }"
							alt="admin" style="opacity: 1;">
						</a>
						<div class="share"></div>
					</div>
					<div class="cook-info author vcard">
						<h5 class="fn given-name url">
							<a href="#" title="Posts by admin" rel="author">${ post.user.fullname }</a>
						</h5>
						<p></p>
						<a class="url"
							href="${pageContext.request.contextPath}/filter?condition=${ post.user.id }&category=user_id">Bài
							khác của ${ post.user.fullname.split(' ')[0] } &nbsp; »</a>
					</div>
				</div>
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

<!-- ============================================== Comfirm diaglog ======================================================== -->
<div class="container">
	<div class="modal fade" id="c-e-modal" role="dialog">
		<div class="modal-dialog" style="top: 246px;">
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
		<div class="modal-dialog" style="top: 246px;">
			<div style="padding: 8px;" class="modal-content">

				<div style="padding: 8px;" class="modal-body">
					<h3 style="text-align: center; color: black;">Bạn có chắc chắn
						muốn xoá bình luận này ?</h3>
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
		<div class="modal-dialog" style="top: 246px;">
			<div style="padding: 8px;" class="modal-content">
				<form
					action="${pageContext.request.contextPath}/report/create/${post.id}"
					method="post">
					<div style="padding: 8px;" class="modal-body">
						<input type="hidden" name="reportable_id" id="reportable_id">
						<input type="hidden" name="report_author"
							id="report_author">
						<ul class="ks-cboxtags">
							<li><input type="checkbox" id="checkboxFive"
								name="type" value="1" /><label for="checkboxFive">Spam</label></li>
							<li><input type="checkbox" id="checkboxSix"
								name="type" value="2" /><label for="checkboxSix">Bạo
									lực</label></li>
							<li><input type="checkbox" id="checkboxSeven"
								name="type" value="3" /><label for="checkboxSeven">Nội
									dung đồi truỵ</label></li>
							<li><input type="checkbox" id="checkboxEight"
								name="type" value="4" /><label for="checkboxEight">Nội
									dung khiếm nhã </label></li>
							<li><input type="checkbox" id="checkboxNine"
								name="type" value="5" /><label for="checkboxNine">
									Gây hiểu nhầm hoặc lừa đảo</label></li>
						</ul>
					</div>
					<div class="modal-footer dialog-center">
						<button type="button" class="btn btn-default" data-dismiss="modal">Huỷ</button>
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
				$(".blah").attr("src", e.target.result).width(200).height(174);
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

	if (report_mgs == "") {
		console.log("MSG2", "Nothing");
		$(".report-dialog").css("display", "none");
	} else {
		console.log("MSG2", report_mgs);
		$("#r_msg").val(report_mgs);
		$(".report-dialog").css({
			margin : "166px",
			"position" : "fixed",
			display : "block",
			"z-index" : " 999"
		});
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
		$(".report-dialog").css("display", "none");
	});
	setInterval(function() {
		$(".report-dialog").delay(2000);
	});

	$(".comment_edit")
			.click(
					function() {
						console.log("CLICK EDIT")
						var $row = $(this).closest("ol");
						var id = $row.find(".comment_id").val();
						var afterId = $('#afterId').val();
						if (afterId == id) {
							$(".open-update_" + id).css("display", "block");
							$(".show_content_" + id).css("display", "none");
							$('#afterId').val(id);

						} else {
							$(".open-update_" + afterId).css("display", "none");
							$(".show_content_" + afterId).css("display",
									"block");
							$(".open-update_" + id).css("display", "block");
							$(".show_content_" + id).css("display", "none");
							$('#afterId').val(id);
						}

						$("#c-e-" + id)
								.click(
										function(evt) {
											console.log("CLICK SEND DATA", id)
											evt.preventDefault();
											var fileNull = new File([ "" ],
													"filename");
											var file = $("#c-e-image-" + id)
													.prop("files")[0] == undefined ? fileNull
													: $("#c-e-image-" + id)
															.prop("files")[0];
											var content = $(
													"#c-e-content-" + id).val();
											var c_user = $("#c_user_" + id)
													.val();

											var formData = new FormData();

											formData.append("c_user", c_user);
											formData.append("c_id", id);
											formData.append("image", file);
											formData.append("content", content);

											$("#c-e-confirm")
													.click(
															function() {
																console
																		.log("CLICK CONFIRM CHANGE")
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
																						.log("EDIT SUCCESS")
																				isLike == "true" ? (isLike = "false")
																						: (isLike = "true")
																				$(
																						"#refresh")
																						.load(
																								location.href
																										+ " #refresh");
																			},
																			error : function(
																					data) {
																				alert(" Lỗi hệ thống, vui lòng thử lại sau!");
																			},
																		});
															});
										});
					});

	$(".comment_delete")
			.click(
					function() {
						var $row = $(this).closest("ol"); // Find the row
						var id = $row.find(".comment_id").val(); // Find the text
						console.log("ID", id);
						var c_user = $("#c_user_" + id).val();

						var c_user = $("#c_user_" + id).val();

						var formData = new FormData();

						formData.append("c_user", c_user);

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
														success : function(data) {
															$("#c-count")
																	.html(
																			"( "
																					+ data
																					+ " )");
															$("#refresh")
																	.load(
																			location.href
																					+ " #refresh");
														},
														error : function(data) {
															alert(" Lỗi hệ thống, vui lòng thử lại sau!");
														},
													});
										});
					});

	$("#comment-create")
			.click(
					function(evt) {

						evt.preventDefault();

						if ($("#c-c-image").prop("files")[0] == null
								&& $('#c-c-content').text() == "") {
							document.getElementById('c-c-content')
									.setCustomValidity(
											"This field cannot be left blank");
						} else {
							console.log("PASSS VALIDATE")
							var fileNull = new File([ "" ], "filename");
							var file = $("#c-c-image").prop("files")[0] == undefined ? fileNull
									: $("#c-c-image").prop("files")[0];

							var content = $("#c-c-content").val();
							var formData = new FormData();
							formData.append("image", file);
							formData.append("content", content);
							$
									.ajax({
										type : "POST",
										url : "${pageContext.request.contextPath}/comment/create/${post.id}",
										data : formData,
										cache : false,
										contentType : false,
										processData : false,
										success : function(data) {
											$("#c-c-content").val("");
											$("#c-count").html(
													"( " + data + " )");
											$("#refresh")
													.load(
															location.href
																	+ " #refresh");
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
									data : JSON.stringify("Create-Reaction"),
									dataType : "json",
									url : "${pageContext.request.contextPath}/reaction/${post.id}",
									success : function(data) {
										$("#like-data").html(
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