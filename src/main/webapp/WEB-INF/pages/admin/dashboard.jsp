<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="layout/_header.jsp"></jsp:include>

				<!-- // END Header -->

				<div
					class="mdk-header-layout__content mdk-header-layout__content--fullbleed mdk-header-layout__content--scrollable page"
					style="padding-top: 60px;">
					<div class="page__heading border-bottom">
						<div
							class="container-fluid page__container d-flex align-items-center">
							<h1 class="mb-0">Yummy Admin</h1>
							<a href="${pageContext.request.contextPath}/admin/common/create" class="btn btn-success ml-auto"><i
								class="material-icons">add</i>Viết bài</a>
						</div>
					</div>

					<div class="container-fluid page__container">
				

						<div class="row">
						
							
									<div class="col-md-6">
								<div class="card">
									<div class="card-body media">
										<div style="margin: auto;" class="media-left">
											<a href="#" class="avatar avatar-lg mr-1"> <img
												style="display: inline;"
												src="https://www.flaticon.com/premium-icon/icons/svg/787/787744.svg"
												alt="Card image cap" class="avatar-course-img" />
											</a>
											<h1 style="display: inline;" class="card-title mb-0">
												<a href="#">${ total_post }</a>
											</h1>
											<h4 class="card-title mb-0">
												<a href="#">Quản lý bài viết</a>
											</h4>
										</div>
									</div>
								</div>
							</div>
							
							
									<div class="col-md-6">
								<div class="card">
									<div class="card-body media">
										<div style="margin: auto;" class="media-left">
											<a href="#" class="avatar avatar-lg mr-1"> <img
												style="display: inline;"
												src="https://www.flaticon.com/premium-icon/icons/svg/3031/3031113.svg"
												alt="Card image cap" class="avatar-course-img" />
											</a>
											<h1 style="display: inline;" class="card-title mb-0">
												<a href="#">${ total_user }</a>
											</h1>
											<h4 class="card-title mb-0">
												<a href="#">Quản lý thành viên</a>
											</h4>
										</div>
									</div>
								</div>
							</div>
						
						
							<div class="col-md-6">
								<div class="card">
									<div class="card-body media">
										<div style="margin: auto;" class="media-left">
											<a href="#" class="avatar avatar-lg mr-1"> <img
												style="display: inline;"
												src="https://image.flaticon.com/icons/svg/214/214309.svg"
												alt="Card image cap" class="avatar-course-img" />
											</a>
											<h1 style="display: inline;" class="card-title mb-0">
												<a href="#">${ total_reaction }</a>
											</h1>
											<h4 class="card-title mb-0">
												<a href="#">Thông kê tương tác</a>
											</h4>
										</div>
									</div>
								</div>
							</div>
							
						

							<div class="col-md-6">
								<div class="card">
									<div class="card-body media">
										<div style="margin: auto;" class="media-left">
											<a href="#" class="avatar avatar-lg mr-1"> <img
												style="display: inline;"
												src="https://image.flaticon.com/icons/svg/2190/2190552.svg"
												alt="Card image cap" class="avatar-course-img" />
											</a>
											<h1 style="display: inline;" class="card-title mb-0">
												<a href="#">${ total_comment}</a>
											</h1>
											<h4 class="card-title mb-0">
												<a href="#">Quản lý bình luận</a>
											</h4>
										</div>
									</div>
								</div>
							</div>

					

							<div class="col-md-6">
								<div class="card">
									<div class="card-body media">
										<div style="margin: auto;" class="media-left">
											<a href="#" class="avatar avatar-lg mr-1"> <img
												style="display: inline;"
												src="https://image.flaticon.com/icons/svg/3026/3026023.svg"
												alt="Card image cap" class="avatar-course-img" />
											</a>
											<h1 style="display: inline;" class="card-title mb-0">
												<a href="#">${ total_view[0] }</a>
											</h1>
											<h4 class="card-title mb-0">
												<a href="#">Quản lý lượt xem</a>
											</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		

	
	
	<jsp:include page="layout/_footer.jsp"></jsp:include>