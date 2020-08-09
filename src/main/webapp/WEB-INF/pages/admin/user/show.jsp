<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="../layout/_header.jsp"></jsp:include>






<div
	class="mdk-header-layout__content mdk-header-layout__content--fullbleed mdk-header-layout__content--scrollable page"
	style="padding-top: 60px;">
	<div class="page__heading border-bottom">
		<div class="container-fluid page__container d-flex align-items-center">
			<h1 class="mb-0">Sửa thông tin</h1>
			<!-- 	<a href="quiz-edit.html" class="btn btn-success ml-auto"><i
				class="material-icons">add</i>Viết bài</a> -->


			<form action="${pageContext.request.contextPath}/user/list-user"
				method="get">
				<div class="d-flex" style="margin-left: 700px;">
					<div class="search-form mr-3 search-form--light">
						<input type="text" class="form-control"
							placeholder="Search courses" id="searchSample02">
					</div>

					<div class="form-inline ml-auto">

						<div class="form-group">
							<button class="btn btn-success ml-auto" type="submit">
								<i class="material-icons">search</i>
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>


	</div>

	<div class="container page__container">

		<div class="card-header card-header-large bg-white "
			style="width: 100%; margin: 16px 0px; height: 50px;">

			<div class="role" style="margin-top: -17px; text-align: center;">
				<h3 class="mb-0" style="font-weight: 800;">Phân quyền người
					dùng :</h3>
			</div>

			<form
				action="${pageContext.request.contextPath}/admin/user/edit/${user_detail.getId()}"
				method="post" id="form_role">
				<div class="role" style="margin-top: -12px;">

					<input style="margin-top: 7px" type="radio" id="rd_user"
						value="1" name="role"> <span
						class="badge badge-secondary center user_role">User</span>
						<input style="margin-top: 7px" type="radio" id="rd_user"
						value="5" name="role"> <span
						class="badge badge-warning center user_role">Mod</span>
						 <input
						style="margin-left: 10px" type="radio" value="10" id="rd_admin"
						name="role"> <span class="badge badge-primary center user_role">Admin</span>
					<button style="margin-top: -6px; margin-left: 133px;"
						class="btn btn-success" data-toggle="modal"
						data-target="#confirm-delete">
						<span class="menu-icon"><i class="fa fa-fw fa-check"></i></span>
						Cập nhập
					</button>
				</div>

			</form>
			
			<script type="text/javascript">
							$(document).ready(function() {
								var role = ${ user_detail.getRole()};	
								role == 10?  $("#rd_admin").prop("checked", true) : $("#rd_user").prop("checked", true); 
							});
							</script>


			<script type="text/javascript">
				$(document).ready(function() {
							
						var role_name = $("input[type='radio'][name='role']:checked").val() == 1 ? 'User' : 'Admin'	
						var message =  $('#fullname').val() + ' : '+ role_name+ ' ?'
					$('#modal_name').text(message );


					$("#form_role").submit(function(event) {
						event.preventDefault();
						$(".save-change").click(function() {
							$("#form_role")[0].submit();
						});

						$(".save-close-pass").click(function() {
							$(".show-password").css("display", "none");

						});
					});
				});
			</script>




			<div class="modal fade" id="confirm-delete" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div style="top: 25%;" class="modal-dialog">
					<div style="border-radius: 10px" class="modal-content">

						<div
							style="padding: 10px 40px 10px 20px; background-color: #1367c9; border-top-left-radius: 10px; border-top-right-radius: 10px;"
							class="modal-header">

							<h2
								style="font-size: 28px; color: #fff; margin-left: 30%; text-align: center;"
								class="modal-title" id="myModalLabel">Xác phân quyền</h2>
 
						</div>


						<div class="modal-body"> 

							<p style="text-align: center; font-size: 19px;">Đặt quyền người dùng </p>
							<p
								style="text-align: center; font-style: italic; font-weight: bold;"
								id="modal_name"></p>
							<p class="debug-url"></p>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-basic" data-dismiss="modal">Huỷ</button>
							<button type="submit" id="confirm_url" style="margin-right: 40%"
								class="btn btn-danger save-change">Xác nhận</button>
						</div>
					</div>
				</div>
			</div>



		</div>

			<div class="card card-form" style="margin-top: 10px;">
				<div class="row no-gutters">
					<div class="col-lg-4 card-body">

						<div style="height: 100%; width: 49%; float: left;">
							<img alt="example image"
								src="${pageContext.request.contextPath }/resources/${user_detail.getImage()}"
								style="height: 157px; width: 170px;"> <br> <input
								style="margin-left: 25px; margin-top: 5px; width: 110px; border-radius: 10px;"
								class="btn btn-sm  dz-clickable" name="image" type="file" />


						</div>
						<div style="height: 100%; width: 49%; float: right;">
							<table class="table table-striped table-hover"
								style="margin-top: 25px;">
								<tbody>
									<tr>
										<td>Trạng thái</td>

										<c:choose>
											<c:when test="${user_detail.status=='1'}">
												<td><span class="span_table ">Active</span></td>
											</c:when>
											<c:otherwise>
												<td><span class="span_table btn-danger">Inactive</span></td>
											</c:otherwise>
										</c:choose>

									</tr>

									<tr>
										<td>Bài viết</td>
										<td>0000</td>
									</tr>

									<tr>
										<td>Ngày tham gia</td>
										<td>Jan 07, 2014</td>
									</tr>
								</tbody>
							</table>


						</div>

					</div>

					<div class="col-lg-8 card-form__body card-body">
						<div class="row">
							<div class="col">
								<div class="form-group">
									<label for="fname">Email </label> <input id="fname"
										name="email" type="text" class="form-control"
										placeholder="Email" value="${user_detail.getEmail() }">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="lname">Số điện thoại </label> <input id="lname"
										type="text" class="form-control" name="phone"
										placeholder="Số điện thoại" value="${user_detail.getPhone() }">
								</div>
							</div>


						</div>



						<div class="row">
							<div class="col">
								<div class="form-group">
									<label for="fname">Họ tên </label> <input 
										type="text" id="fullname" name="fullname" class="form-control"
										placeholder="Họ tên " value="${user_detail.getFullname() }">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="lname">Ngày sinh </label> <input id="lname"
										type="date" name="birthday" class="form-control"
										placeholder="Ngày sinh " value="${user_detail.getBirthday().trim() }">
								</div>
							</div>


						</div>


					</div>
				</div>
			</div>

			<hr>
			<div class="card card-form" style="height: 323px;">
				<div class="row no-gutters">
					<div class="col-lg-4 card-body">
						<p>
							<strong class="headings-color">Bài Viết </strong>
						</p>
						<div class="alert alert-dismissible bg-light border-0 fade show"
							role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<strong>Light - </strong> A simple light alert - check it out!
						</div>
						<div class="alert alert-dismissible bg-light border-0 fade show"
							role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<strong>Light - </strong> A simple light alert - check it out!
						</div>



					</div>
					<div class="col-lg-8 card-form__body card-body">

						<div class="row">
							<div class="col">
								<div class="form-group">
									<label for="fname">Địa chỉ </label> <input id="fname"
										type="text" name="address" class="form-control"
										placeholder="Địa chỉ " value="${user_detail.getCountry() }">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="lname">Tuổi </label> <input id="lname" type="text"
										class="form-control" name="age" placeholder="Tuổi "
										value="${user_detail.getAge() }">
								</div>
							</div>


							<script type="text/javascript">
							$(document).ready(function() {
								var gender = ${ user_detail.getGender()};	
								gender == 0?  $("#rd_nu").prop("checked", true) : $("#rd_nam").prop("checked", true); 
							});
							</script>


							<div class="col">
								<div class="form-group">



									<label for="lname">Giới tính </label> <br> <input
										style="margin-top: 7px" type="radio" id="rd_nam"
										value="option3" name="optionsRadios2"> <label>
										Nam </label> <input style="margin-left: 10px" type="radio"
										value="option4" id="rd_nu" name="optionsRadios2"> <label>Nữ
									</label>


								</div>
							</div>




						</div>


						<div class="form-group">
							<div class="form-group">
								<label for="desc">Mô tả - giới thiệu bản thân </label>
								<textarea name="bio" id="desc" rows="4" class="form-control"
									placeholder="Mô tả / giới thiệu bản thân ..."> ${ user_detail.getBio() } </textarea>
							</div>
						</div>







					</div>
				</div>
			</div>


		<hr>











		<%-- 


		<div class="card card-form">
			<div class="row no-gutters">
				<div class="col-lg-4 card-body">
					<p>
						<strong class="headings-color">Bình luận </strong>
					</p>

					<div class="alert alert-dismissible bg-light border-0 fade show"
						role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<strong>Light - </strong> A simple light alert - check it out!
					</div>
					<div class="alert alert-dismissible bg-light border-0 fade show"
						role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<strong>Light - </strong> A simple light alert - check it out!
					</div>



				</div>

					<div class="col-lg-8 card-form__body card-body">
						<div class="row">
							<h3
								style="margin-bottom: 24px; font-weight: 600; text-align: center; margin-left: 298px;"
								class="headings-color">Đổi mật khẩu</h3>
						</div>
						<div class="row">

							<hr>
							<div class="col">
											<form action="${pageContext.request.contextPath}/list-user">
							
								<div class="form-group">
									<label for="fname">Mật khẩu mới  </label> <input id="fname"
										type="text" class="form-control" placeholder="Mật khẩu mới"
										>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="lname">Xác nhận mật khẩu </label> <input id="lname"
										type="text" class="form-control" placeholder="Xác nhận mật khẩu "
										>
								</div>
							</div>
						</div>

						<button style="margin-right: 14px;"
							class="btn btn-primary vd_bg-green col-md-offset-7">
							<span class="menu-icon"><i class="fa fa-fw fa-check"></i></span>
							Cập nhập
						</button>
						</form>




					</div>
				
			</div>
		</div> 

 --%>




		<hr>










	</div>
</div>




<jsp:include page="../layout/_footer.jsp"></jsp:include>