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
			<h1 class="mb-0">Bình luận</h1>
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
						class="modal-title" id="myModalLabel">Xác nhận</h2>
				</div>


				<div class="modal-body">

					<p id="c_content" style="text-align: center; font-size: 19px;">
					</p>
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
			$(".use-block").click(function() {
				var $row = $(this).closest("tr"); // Find the row
				var name = $row.find(".full_name").text(); // Find the text
				var c_post = $row.find(".c_post").text();
				thisdata = $(this).attr('data-href');
				$("#confirm_url").attr("href", thisdata);
				$('#c_content').text("Xoá bình luận: " + name + "?");

				$('#modal_name').text("Trên bài viết:  " + c_post);

			});
		});
	</script>

	<div class="container-fluid page__container">


		<div class="row">



			<table id="example" class="table table-striped">
				<thead>
					<tr>
						<th class="table-th" scope="col">#</th>
						<th class="table-th" scope="col">Nội dung</th>
						<th class="table-th" scope="col">Thời gian</th>
						<th class="table-th" scope="col">Bài viết</th>
						<th class="table-th" scope="col">Hình ảnh</th>
						<th class="table-th" scope="col">Thao tác</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${comments}" var="comment">
						<tr>

							<td scope="row">${ comment.id }</td>
							<td class="full_name">${ comment.content }</td>
							<td>${ comment.created_at.toString().split(" ")[0] }</td>
							<td class="c_post">${ comment.post.title }</td>
							<td><img
								src="${pageContext.request.contextPath}/resources/${ comment.image_url }"></td>
							<td>

								<button class="btn btn-danger use-block" id="test"
									data-href="${pageContext.request.contextPath}/admin/comment/delete/${ comment.id }"
									data-toggle="modal" data-target="#confirm-delete">
									<i class="fa fa-trash"></i>
								</button> <a class="btn btn-info"
								href="${pageContext.request.contextPath}/admin/"> <span
									class="menu-icon"><i class="fa fa-eye"></i></span>
							</a>
							</td>

						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>
	</div>
</div>




<jsp:include page="../layout/_footer.jsp"></jsp:include>
