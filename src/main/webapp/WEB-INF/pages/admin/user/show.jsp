<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="../../static/layout/_header.jsp"></jsp:include>

<div class="vd_content clearfix">
	<div class="vd_content-section clearfix">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel widget light-widget form-horizontal"
					style="border: outset">
					<div class="panel-heading no-title"></div>

					<div class="panel-body " style="padding: 30px 65px;">
						<!-- <form action="${pageContext.request.contextPath }/edit-profile"
							enctype="multipart/form-data" method="POST" id="form_profile"> -->
						<div class="row">
							<div class="col-sm-3 mgbt-xs-20">

								<div class="form-group">

									<br>
									<script type="text/javascript">
										function readURL(input) {
											if (input.files && input.files[0]) {
												var reader = new FileReader();

												reader.onload = function(e) {
													$('#blah').attr('src',
															e.target.result)
															.width(200).height(
																	174);
												};

												reader
														.readAsDataURL(input.files[0]);
											}
										}
									</script>


									<div class="col-xs-12" style="margin-top: 70px">
										<div class="form-img text-aacenter mgbt-xs-15">
											<img style="width: 200px; height: 174px; margin-bottom: 10px"
												id="blah" alt="example image"
												src="${pageContext.request.contextPath }/resources/${user_detail.getImage()}" />
										</div>
										<br />
										<div>
											<table class="table table-striped table-hover">
												<tbody>
													<tr>
														<td style="width: 60%;">Trạng thái</td>

														<c:choose>
															<c:when test="${user_detail.status=='1'}">
																<td><span class="label label-success">Active</span>
																</td>
															</c:when>
															<c:otherwise>
																<td><span class="label label-danger">Inactive</span>
																</td>
															</c:otherwise>
														</c:choose>
													</tr>
													<tr>
														<td>Bình luận</td>
														<td>${user_detail.comments.size()}</td>
													</tr>
													<tr>
														<td>Tương tác</td>
														<td>${user_detail.reactions.size()}</td>
													</tr>
													<tr>
														<td>Báo cáo</td>
														<td>${user_detail.reports.size()  }</td>
													</tr>
													<tr>
														<td>Ngày tham gia</td>
														<td>${ user_detail.created_at.toString().split(" ")[0] }</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-9">

								<h3 class="mgbt-xs-15">Thông tin người dùng</h3>
								<span id="hideMe" class="${class_name}"
									style="font-family: Arial, sans-serif; font-size: larger; margin: 168px; font-weight: normal; margin-top: -10px; margin-bottom: 13px;">${ message2 }</span>
								<div class="form-group">
									<label class="col-sm-3 control-label font">Họ tên</label>
									<div class="col-sm-9 controls">
										<div class="row mgbt-xs-0">
											<div class="col-xs-9">
												<input readonly value="${ user_detail.getFullname() }"
													name="name" type="text" placeholder="Họ tên " />
											</div>
											<!-- col-xs-9 -->

										</div>
										<!-- row -->
									</div>
									<!-- col-sm-10 -->
								</div>


								<script type="text/javascript">
										$(document)
												.ready(
														function() {
															'${ user_detail.getGender() }' == 0 ? $(
																	"#rd_nu")
																	.prop(
																			"checked",
																			true)
																	: $(
																			"#rd_name")
																			.prop(
																					"checked",
																					true);
														});
									</script>




									<div class="form-group">
										<label class="col-sm-3 control-label font">Giới tính</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div style="width: 27%; float: left; margin-left: 15px;">


													<span class="vd_radio radio-info"> <input
														type="radio" value="1" id="rd_name" name="gender" /> <label
														for="optionsRadios3"> Nam </label>
													</span> <span class="vd_radio radio-danger"> <input
														type="radio" value="0" id="rd_nu" name="gender" /> <label
														for="optionsRadios4"> Nữ </label>
													</span>

												</div>
											<div>
												<label class="col-sm-3 control-label font"
													style="margin-left: -13px;">Tuổi </label>
											</div>
											<div style="float: left; width: 28%;"></div>
											<input readonly value="${ user_detail.getAge() }"
												style="width: 173px;" name="age" type="number"
												placeholder="Tuổi" />

										</div>
										<!-- row -->
									</div>
									<!-- col-sm-10 -->
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label font">Ngày sinh</label>
									<div class="col-sm-9 controls">
										<div class="row mgbt-xs-0">
											<div class="col-xs-9">
												<input readonly type="date"
													value="${user_detail.getBirthday().trim() }"
													id="datepicker-normal" name="birthday"
													class="width-40 hasDatepicker" />
											</div>
											<!-- col-xs-12 -->

										</div>
										<!-- row -->
									</div>
									<!-- col-sm-10 -->
								</div>
								<!-- form-group -->
								<div class="form-group" style="margin-top: 19px">
									<label class="col-sm-3 control-label font">Số điện
										thoại</label>
									<div class="col-sm-9 controls">
										<div class="row mgbt-xs-0">
											<div class="col-xs-9">
												<input readonly type="text" name="email"
													placeholder="${ user_detail.getPhone() }" />
											</div>
										</div>
										<!-- row -->
									</div>
									<!-- col-sm-10 -->
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label font">Email</label>
									<div class="col-sm-9 controls">
										<div class="row mgbt-xs-0">
											<div class="col-xs-9">
												<input readonly type="email"
													value="${ user_detail.getEmail() }" name="email"
													placeholder="Email" />
											</div>
											<!-- col-xs-9 -->

										</div>
										<!-- row -->
									</div>
									<!-- col-sm-10 -->
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label font">Địa chỉ</label>
									<div class="col-sm-9 controls">
										<div class="row mgbt-xs-0">
											<div class="col-xs-9">
												<input readonly type="text"
													value="${ user_detail.getCountry() }" name="address"
													placeholder=" Địa chỉ " />
											</div>
											<!-- col-xs-9 -->
										</div>
										<!-- row -->
									</div>
									<!-- col-sm-10 -->
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label font"> Mô tả </label>
									<div class="col-sm-9 controls">
										<div class="row mgbt-xs-0">
											<div class="col-xs-9">
												<textarea readonly name="bio"
													placeholder=" Mô tả-
													Giới thiệu bản thân "
													style="width: 125%" rows="4">${ user_detail.getBio() }</textarea>
											</div>
											<!-- col-xs-12 -->

										</div>
										<!-- row -->
									</div>
									<!-- col-sm-10 -->
								</div>
								<!-- 			</form> -->
								<br />
								<hr>
							</div>
							<!-- col-sm-12 -->
						</div>
						<!-- row -->
					</div>
					<!-- panel-body -->
					<div class="pd-20"></div>
				</div>
				<!-- Panel Widget -->
			</div>
			<!-- col-sm-12-->
		</div>
		<!-- row -->
	</div>
	<!-- .vd_content-section -->
</div>

<jsp:include page="../../static/layout/_footer.jsp"></jsp:include>