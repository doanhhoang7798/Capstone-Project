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
			<h1 class="mb-0">Sửa bài viết</h1>
			<span id="hideMe" class="${class_name}"
				style="font-size: larger; margin-left: 709px; font-weight: 900; margin-bottom: -8px;">${ msg }</span>
		</div>
	</div>
	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$("#blah").attr("src", e.target.result).width(358).height(
							160);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<div class="container-fluid page__container">
		<form
			action="${pageContext.request.contextPath}/admin/tipNutri/edit/${record.id}"
			enctype="multipart/form-data" method="post">
			<div class="col-lg-12 card-form__body card-body">
				<div class="row">
					<div class="col">
						<div class="form-group">
							<img style="width: 358; height: 160px;" id="blah"
								src="${pageContext.request.contextPath }/resources/${record.image }" />
						</div>
						<div class="form-group">
							<input onchange="readURL(this);" type="file"
								accept="image/x-png,image/gif,image/jpeg" name="image"
								style="margin-top: -19px; width: 101px;" />
						</div>
					</div>
					<div class="col">
						<div class="form-group type">
							<label for="lname"> Chuyên mục</label> <select id="type"
								name="type" data-toggle="select" class="form-control"
								data-select2-id="select05" tabindex="-1" aria-hidden="true">
								<option value="Mẹo hay">Mẹo hay</option>
								<option value="Dinh dưỡng">Dinh dưỡng</option>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Tác giả </label> <input maxlength="50" minlength="5"
								type="text" class="form-control" id="exampleInputEmail1"
								name="author" value="${record.author }"
								placeholder="nhập tác giả, nguồn bài viết ..." />
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="lname"> Thể loại</label> <select id="kind"
								name="kind" class="form-control"> 
								<option class="tip" value="Mẹo hay chế biến nguyên liệu">Mẹo
									hay chế biến nguyên liệu</option>
								<option class="tip" value="Bí quyết nấu nướng">Bí quyết
									nấu nướng</option>
								<option class="tip" value="Các thực phẩm kị nhau">Các
									thực phẩm kị nhau</option>
								<option class="nutri" value="Dinh dưỡng cho trẻ">Dinh
									dưỡng cho trẻ</option>
								<option class="nutri" value="Chế độ ăn cho người bệnh">Chế
									độ ăn cho người bệnh</option>
								<option class="nutri" value="Dinh dưỡng cho người cao tuổi">Dinh
									dưỡng cho người cao tuổi</option>
								<option class="nutri" value="Dinh dưỡng cho người tập Gym">Dinh
									dưỡng cho người tập Gym</option>

							</select>
						</div>
						<div class="form-group">
							<label for="fname">Tiêu đề</label> <input id="fname" type="text" maxlength="50" minlength="5"
								class="form-control" value="${record.title }" name="title" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="desc">Nội dung</label>
					<textarea id="desc" name="content" rows="15" class="form-control" minlength="50" maxlength="10000"
						placeholder="Bio / description ..."> ${record.content }</textarea>
				</div>
				<a href="${pageContext.request.contextPath}/admin/tipNutri/list"
					id="cancel" class="btn btn-secondary">Quay lại</a>
				<button type="submit" id="submit" name="Tipsubmit"
					class="btn btn-info">Cập nhật</button>
			</div>
						<script>
				function validatePost() {
					var title = document.getElementById("fname");
					var author = document.getElementById("exampleInputEmail1");
					var content = document.getElementById("desc");
					var image = document.getElementById("blah");
					var button = document.getElementById("image-chose");

					// Validate field Title 
					if (title.value.trim().length == 0) {
						title.setCustomValidity("Tiêu đề không được bỏ trống.");
					} else if (title.value.trim().length < 5) {
						title.setCustomValidity("Tiêu đề tối thiểu 5 kí tự.");

					} else if (title.value.trim().length > 50) {
						title.setCustomValidity("Tiêu đề tối đa 50 kí tự.");
					} else {
						title.setCustomValidity('');
					}

					// Validate field author 
					if (author.value.trim().length == 0) {
						author
								.setCustomValidity("Tên tác giả không được bỏ trống.");
					} else if (author.value.trim().length < 5) {
						author
								.setCustomValidity("Tên tác giả tối thiểu 5 kí tự.");

					} else if (author.value.trim().length > 50) {
						author
								.setCustomValidity("Tên tác giả tối đa 50 kí tự.");
					} else {
						author.setCustomValidity('');
					}

					// Validate field content 
					if (content.value.trim().length == 0) {
						content
								.setCustomValidity("Nội dung không được bỏ trống.");
					} else if (content.value.trim().length < 50) {
						content
								.setCustomValidity("Nội dung tối thiểu 50 kí tự.");

					} else if (content.value.trim().length > 10000) {
						content
								.setCustomValidity("Nội dung tối đa 10 000 kí tự.");
					} else {
						content.setCustomValidity('');
					}

					// Validate field image 
					if (image.value.trim().length == 0) {
						button.setCustomValidity("Vui lòng chọn 1 ảnh");
					} else {
						button.setCustomValidity('');
					}

				}

				document.getElementsByName("Tipsubmit")[0].onclick = validatePost;
			</script>
	</form>

		<script type="text/javascript">
			$(".type option").each(function() {
				if ($(this).val() == "${record.type}") {
					$(this).prop("selected", true);
				}
			});

			$(".kind option").each(function() {
				if ($(this).val() == "${record.kind}") {
					$(this).prop("selected", true);
				}
			});


			$("#type")
					.on(
							"change",
							function() {
								if (this.value == "Mẹo hay") {
									$("#kind")
											.empty()
											.append(
													'<option class="tip"  value="Mẹo hay chế biến nguyên liệu">Mẹo hay chế biến nguyên liệu </option>',
													'<option class="tip" value="Bí quyết nấu nướng">Bí quyết nấu nướng </option>',
													'<option class="tip" value="Các thực phẩm kị nhau">Các thực phẩm kị nhau </option>');
								} else {
									$("#kind")
											.empty()
											.append(
													'<option class="nutri" value="Dinh dưỡng cho trẻ">Dinh dưỡng cho trẻ </option>',
													' <option class="nutri" value="Chế độ ăn cho người bệnh">Chế độ ăn cho người bệnh </option>',
													'<option class="nutri" value="Dinh dưỡng cho người cao tuổi">Dinh dưỡng cho người cao tuổi </option>',
													'<option class="nutri" value="Dinh dưỡng cho người tập Gym">Dinh dưỡng cho người tập Gym</option>');
								}
							});
		</script>
		
	</div>
</div>
<jsp:include page="../layout/_footer.jsp"></jsp:include>
