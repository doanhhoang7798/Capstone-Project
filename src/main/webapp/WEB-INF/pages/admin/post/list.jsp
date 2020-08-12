<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="../layout/_header.jsp"></jsp:include>

<!-- // END Header -->


<div
	class="mdk-header-layout__content mdk-header-layout__content--fullbleed mdk-header-layout__content--scrollable page"
	style="padding-top: 60px;">
	<div class="page__heading border-bottom">
		<div class="container-fluid page__container d-flex align-items-center">
			<h1 class="mb-0">Danh sách bài viết</h1>
			<!-- 	<a href="quiz-edit.html" class="btn btn-success ml-auto"><i
				class="material-icons">add</i>Viết bài</a> -->


				<span id="hideMe" class="${class_name}">${ msg }</span>

		</div>


	</div>



	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div style="top: 25%;" class="modal-dialog">
			<div style="border-radius: 10px" class="modal-content">

				<div
					style="padding: 10px 40px 10px 20px; background-color: #212529; border-top-left-radius: 10px; border-top-right-radius: 10px;"
					class="modal-header">

					<h2
						style="font-size: 28px; color: #fff; margin-left: 30%; text-align: center;"
						class="modal-title" id="myModalLabel">Xác nhận xoá</h2>

				</div>


				<div class="modal-body">

					<p style="text-align: center; font-size: 19px;">Xoá bài viết ?</p>
					<p
						style="text-align: center; font-style: italic; font-weight: bold;"
						id="modal_name"></p>
					<p class="debug-url"></p>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-basic" data-dismiss="modal">Huỷ</button>
					<a id="confirm_url" href="" style="margin-right: 40%"
						class="btn btn-danger btn-ok">Xác nhận</a>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		$(document).ready(function() {
			$(".user-block").click(function() {
			    var $row = $(this).closest("tr");    // Find the row
			    var name = $row.find(".full_name").text(); // Find the text
				thisdata = $(this).attr('data-href');
				$("#confirm_url").attr("href", thisdata);
			    $('#modal_name').text(name);
			    
			});
		});
	</script>

	<div class="container-fluid page__container">


		<div class="row">



			<table id="example" class="table table-striped">
				<thead>
					<tr>
						<th class="table-th" scope="col">#</th>
						<th class="table-th" scope="col">Tiêu đề</th>
						<th class="table-th" scope="col">Lượt xem</th>
						<th class="table-th" scope="col">Tác giả</th>
						<th class="table-th" scope="col">Video</th>
						<th class="table-th" scope="col">Thao tác</th>



					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ posts }" var="post_detail">
						<tr>

							<td scope="row">${ post_detail.id }</td>
							<td style="width: 400px;" class="full_name">${ post_detail.title }</td>
							<td>${ post_detail.view_conter } đã xem</td>
							<td>${post_detail.user.fullname }</td>


							<td><embed id="video" src="${ post_detail.video_url }"
									type="application/x-shockwave-flash" width="200" height="100"
									autostart="true" loop="true" title="Adobe Flash Player"></embed>

							</td>


							<td><a class="btn btn-primary"
								href="${pageContext.request.contextPath}/post-edit/${post_detail.id}">
									<span class="menu-icon"><i class="fa fa-edit"></i></span>
							</a>

								<button class="btn btn-danger user-block" id="test"
									data-href="${pageContext.request.contextPath}/admin/post/list/${post_detail.id}"
									data-toggle="modal" data-target="#confirm-delete">
									<i class="fa fa-lock"></i>
								</button> <a class="btn btn-info"
								href="${pageContext.request.contextPath}/post-show/${post_detail.id}">
									<span class="menu-icon"><i class="fa fa-eye"></i></span>
							</a></td>

						</tr>
					</c:forEach>

				</tbody>
			</table>




		</div>
	</div>
</div>




<jsp:include page="../layout/_footer.jsp"></jsp:include>