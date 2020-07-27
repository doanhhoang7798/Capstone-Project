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
			<h1 class="mb-0"> Báo cáo </h1>
			<!-- 	<a href="quiz-edit.html" class="btn btn-success ml-auto"><i
				class="material-icons">add</i>Viết bài</a> -->
			<span id="hideMe" class="${class_name}"
				style="font-size: larger; margin-left: 709px; font-weight: 900; margin-bottom: -8px;">${ msg }</span>
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

					<p id="c_report" style="text-align: center; font-size: 19px;"></p>
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
			    var $row = $(this).closest("tr");    // Find the row
			    var name = $row.find(".full_name").text(); // Find the text
			    var comment = $row.find(".c_comment").text(); // Find the text
				thisdata = $(this).attr('data-href');
				$("#confirm_url").attr("href", thisdata);
			    $('#c_report').text("Xoá báo cáo này: " +name+ " ?");
			    $('#modal_name').text("Bình luận: " + comment );			    
			});
		});
	</script>

	<div class="container-fluid page__container">
		<div class="row">
			<table id="example" class="table table-striped">
				<thead>
					<tr>
						<th class="table-th" scope="col">#</th>
						<th class="table-th" scope="col">Báo cáo</th>
						<th class="table-th" scope="col">Bình luận</th>
						<th class="table-th" scope="col">Loại báo cáo</th>
						<th class="table-th" scope="col">Ngày báo cáo</th>
						<th class="table-th" scope="col">Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reports}" var="report">
						<tr>

							<td scope="row">${ report[0] }</td>
							<td scope="row">${ report[3] }</td>
							<td class="c_comment" scope="row">${ report[1] }</td>
							<c:choose>
								<c:when test="${report[2] == 1}">
									<td class="full_name" scope="row"></td>
								</c:when>

								<c:when test="${report[2] == 2}">
									<td class="full_name" scope="row">Bạo lực</td>
								</c:when>

								<c:when test="${report[2] == 3}">
									<td class="full_name" scope="row">Nội dung đồi truỵ</td>
								</c:when>
								<c:when test="${report[2] == 4}">
									<td class="full_name" scope="row">Nội dung khiếm nhã</td>
								</c:when>


								<c:otherwise>
									<td class="full_name" scope="row">Gây hiểu nhâm, lừ đảo</td>
								</c:otherwise>
							</c:choose>
							<td scope="row">${ report[4].toString().split(" ")[0] }</td>
							
							<td>
								<button class="btn btn-danger use-block" id="test"
									data-href="${pageContext.request.contextPath}/admin/report/delete/${ report[0] }"
									data-toggle="modal" data-target="#confirm-delete">
									<i class="fa fa-trash"></i>
								</button>
							</td>

						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>
	</div>
</div>
<jsp:include page="../layout/_footer.jsp"></jsp:include>
