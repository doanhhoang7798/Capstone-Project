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
						<form action="${pageContext.request.contextPath }/edit-profile"
							enctype="multipart/form-data" method="POST" id="form_profile">
							<div class="row">
								<div class="col-sm-3 mgbt-xs-20">

									<div class="form-group">

										<br>
										<script type="text/javascript">
											function readURL(input) {
												if (input.files
														&& input.files[0]) {
													var reader = new FileReader();

													reader.onload = function(e) {
														$('#blah')
																.attr(
																		'src',
																		e.target.result)
																.width(200)
																.height(174);
													};

													reader
															.readAsDataURL(input.files[0]);
												}
											}
										</script>


										<div class="col-xs-12" style="margin-top: 70px">
											<div class="form-img text-aacenter mgbt-xs-15">


												<c:choose>
													<c:when test="${user_detail.getImage()  == null}">

														<img
															style="width: 210px; height: 210px; margin-bottom: 10px"
															id="blah" alt="example image"
															src="${pageContext.request.contextPath }/resources/images/null_img.png" />
													</c:when>
													<c:otherwise>
														<img
															style="width: 210px; height: 210px; margin-bottom: 10px"
															id="blah" alt="example image"
															src="${pageContext.request.contextPath }/resources/${user_detail.getImage()}" />
													</c:otherwise>
												</c:choose>

											</div>
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

									<h3 class="mgbt-xs-15">Thông tin cá nhân</h3>
									<div class="form-group">
										<label class="col-sm-3 control-label font">Họ tên</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">
													<input readonly id="name" style="width: 132%; text-align: center;" required type="text"
														value="${ user_detail.getFullname() }" name="name"
														placeholder=" Họ tên " />
												</div>
												<!-- col-xs-9 -->

											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									
						<div class="form-group" style="margin-top: 19px">
							<label class="col-sm-3 control-label font">Số điện thoại</label>
							<div class="col-sm-9 controls">
								<div class="row mgbt-xs-0">
									<div class="col-xs-9">
										<input readonly type="text" name="phone" style="width: 132%;" 
											placeholder="${ user_detail.getPhone() }" />
									</div>
								</div>
								<!-- row -->
							</div>
							<!-- col-sm-10 -->
						</div>


									<script type="text/javascript">
										$(document)
												.ready(
														function() {
															'${ user.getGender() }' == 0 ? $(
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


													<span class="vd_radio radio-info"> <input readonly
														type="radio" value="1" id="rd_name" name="gender" /> <label
														for="optionsRadios3"> Nam </label>
													</span> <span class="vd_radio radio-danger"> <input readonly
														type="radio" value="0" id="rd_nu" name="gender" /> <label
														for="optionsRadios4"> Nữ </label>
													</span>

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
														<input type="date" readonly style="text-align: center;"
															value="${ user_detail.getBirthday().trim()}"
															max='2011-01-01' id="datepicker-normal" name="birthday"
															class="width-40 hasDatepicker" />
													</div>
													<!-- col-xs-12 -->

												</div>
												<!-- row -->
											</div>
											<!-- col-sm-10 -->
										</div>
										<!-- form-group -->


										<div class="form-group">
											<label class="col-sm-3 control-label font">Địa chỉ</label>
											<div class="col-sm-9 controls">
												<div class="row mgbt-xs-0">
													<div class="col-xs-9">
														<input type="text" value="${ user_detail.getCountry() }" readonly style="text-align: center;"
															id="address" name="address" placeholder=" Địa chỉ " />
													</div>
													<!-- col-xs-9 -->

												</div>
												<!-- row -->
											</div>
											<!-- col-sm-10 -->
										</div>
										<!-- form-group -->


										<div class="form-group">
											<label class="col-sm-3 control-label font">Email</label>
											<div class="col-sm-9 controls">
												<div class="row mgbt-xs-0">
													<div class="col-xs-9">
														<input type="email" value="${user_detail.getEmail()}" readonly style="text-align: center;"
															name="email" placeholder=" Email của bạn " />
													</div>
													<!-- col-xs-9 -->

												</div>
												<!-- row -->
											</div>
											<!-- col-sm-10 -->
										</div>
										<!-- form-group -->

										<div class="form-group">
											<label class="col-sm-3 control-label font"> Mô tả </label>
											<div class="col-sm-9 controls">
												<div class="row mgbt-xs-0">
													<div class="col-xs-9">
														<textarea name="bio" id="bio" readonly
															placeholder=" Mô tả - Giới thiệu bản thân "
															style="width: 125%" rows="6">${ user_detail.getBio() }</textarea>
													</div>
													<!-- col-xs-12 -->

												</div>
												<!-- row -->
											</div>
											<!-- col-sm-10 -->
										</div>
						</form>

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