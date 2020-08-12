<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="layout/_header.jsp"></jsp:include>
<!-- ============= CONTENT AREA STARTS HERE ============== -->
<style>
.active {
	background: #c33 !important;
}
</style>
<div id="content" class="clearfix homepage">
	<!-- SLIDER STARTS HERE -->
	<div id="slider" class="nivo-container" style="position: relative">


		<section class="carousel-default">



			<div id="carousel-default" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators" style="bottom: -41px;">

					<c:forEach items="${slides}" var="post">
						<li data-target="#carousel-default" data-slide-to="${post.id }"
							style="background: darkgray; width: 50px;"
							class="${slides.get(1).getId() ==  post.id ? 'active' : '' }"></li>
					</c:forEach>


				</ol>


				<div class="carousel-inner" role="listbox">


					<c:forEach items="${slides}" var="post">
						<div
							class="item ${slides.get(1).getId() ==  post.id ? 'active' : '' }">

							<embed id="video" wmode="transparent"
								title="#caption_${post.id }" src="${post.video_url }"
								width="920" height="380px" title="Adobe Flash Player"></embed>


							<div class="carousel-caption">
								<h3 class="split-text">
									<a
										href="${pageContext.request.contextPath}/post-show/${post.id }">${post.title}</a>
								</h3>
							</div>
						</div>
					</c:forEach>




				</div>


				<a class="left carousel-control" href="#carousel-default"
					role="button" data-slide="prev"> <span> <i
						style="margin-top: 171px; margin-left: -58px;"
						class="fa fa-angle-left fa-3x" aria-hidden="true"></i></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-default"
					role="button" data-slide="next"> <span><i
						style="margin-top: 171px; margin-right: -58px;"
						class="fa fa-angle-right fa-3x" aria-hidden="true"></i></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</section>



	</div>
	<!-- SLIDER AREA ENDS HERE -->
	<div id="whats-hot">
		<h3 class="boder_title">
			Có thể bạn quan tâm 
		</h3>
		<ul class="cat-list clearfix">
			<c:forEach items="${ suggestions }" var="post">
				<li>
					<h4 style="margin-bottom: -2px;">
						<a style="margin-bottom: -6px; color: #cc3333;" href="${pageContext.request.contextPath}/filter?condition=${post.category }&category=category">${post.category }</a>
						<i class="d-f-r">${ post.created_at.toString().split(" ")[0] }</i >
					</h4> <a href="${pageContext.request.contextPath}/post-show/${post.id }"
					class="img-box"> <embed id="video" wmode="transparent"
							title="#caption_${post.id }" src="${post.video_url }"
							type="application/x-shockwave-flash" width="216" height="135"
							loop="true" title="Adobe Flash Player"></embed>
				</a>
					<h5>
						<a class="split-text"
							href="${pageContext.request.contextPath}/post-show/${post.id }">
							${ post.title } </a>

					</h5>
					<p class="split-text">
						${ post.overview }, <a
							href="${pageContext.request.contextPath}/post-show/${post.id }">
						</a>
					</p>
				</li>
			</c:forEach>
		</ul>
	</div>
	<!-- end of whats-hot div -->
</div>
<jsp:include page="layout/_footer.jsp"></jsp:include>