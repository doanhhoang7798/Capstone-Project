<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#gradient {
	background: rgb(238, 174, 202);
	background: radial-gradient(circle, rgba(238, 174, 202, 1) 0%,
		rgba(148, 187, 233, 1) 100%);
	margin: 0 auto;
	margin-top: 1%;
	width: 100%;
	height: 150px;
	background: radial-gradient(circle, rgba(238, 174, 202, 1) 0%,
		rgba(148, 187, 233, 1) 100%);
}

#gradient:after {
	content: "";
	position: absolute;
	background: #E9E2D0;
	left: 50%;
	margin-top: -67.5px;
	margin-left: -270px;
	padding-left: 20px;
	border-radius: 5px;
	width: 520px;
	height: 275px;
	z-index: -1;
}

#card {
	padding: 13px;
	position: absolute;
	width: 450px;
	height: 225px;
	padding: 25px;
	padding-bottom: 0;
	left: 50%;
	top: -1%;
	margin-left: -250px;
	background: #E9E2D0;
	box-shadow: -20px 0 35px -25px black, 20px 0 35px -25px black;
	z-index: 5;
}

#card img {
	width: 150px;
	float: left;
	border-radius: 5px;
	margin-right: 20px;
	-webkit-filter: sepia(1);
	-moz-filter: sepia(1);
	filter: sepia(1);
}

#card h2 {
	font-family: courier;
	color: #333;
	margin: 0 auto;
	padding: 0;
	font-size: 15pt;
}

#card p {
	font-family: courier;
	color: #555;
	font-size: 13px;
	margin: 0 0 3px !important;
}

#card span {
	font-family: courier;
}
</style>

<jsp:include page="layout/_header.jsp"></jsp:include>





<div class="vd_content clearfix" style="width: 101%;">
	<div class="vd_content-section clearfix">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel widget light-widget form-horizontal">
					<div class="panel-heading no-title"></div>




					<div id="gradient"></div>
					<div id="card">
						<img style="height: 71%; width: 38%;"
							src="${pageContext.request.contextPath}/resources/${ s_user.image }" />
						<h2 style="margin-bottom: 1%;">${s_user.fullname }  </h2>  
						<p>Bình luận: ${s_user.comments.size()}</p>
						<p>Tương tác: ${s_user.reactions.size()}</p>
						<p>Báo cáo: ${s_user.reports.size()  }</p>
						<p>Bài viết: ${s_user.posts.size()  }</p>
						<p>Ngày gia nhập: ${s_user.created_at.toString().split(" ")[0]  }</p>
						<hr>
						<div style="margin-top: -4%;">
							<span class="left bottom">Liên hệ: ${s_user.phone }</span> <span
								class="right bottom">- ${s_user.email }</span>
						</div>
						
						
						
						<c:choose>
						    <c:when test="${s_user.id == user.id}">
						     <a href="${pageContext.request.contextPath}/profile"><i style="position: absolute; top: 11%; right: 7%;" class="fa fa-edit fa-3x" aria-hidden="true"></i></a>
. 
						    </c:when>    
						  
						</c:choose>
						
						
						
						
					</div>



					<c:choose>

						<c:when test="${posts.size() != 0}">
							<div style="margin-top: 8%;" id="whats-hot">
								<ul class="cat-list clearfix">
									<c:forEach items="${ posts }" var="post">
										<li>
											<h4 style="margin-bottom: -2px;">
												<a style="margin-bottom: -6px; color: #428bca;"
													href="${pageContext.request.contextPath}/filter?condition=${post.category }&category=category">${post.category }</a>
												<i class="d-f-r">${ post.created_at.toString().split(" ")[0] }</i>
											</h4> <a
											href="${pageContext.request.contextPath}/post-show/${post.id }"
											class="img-box"> <embed id="video" wmode="transparent"
													title="#caption_${post.id }" src="${post.video_url }"
													type="application/x-shockwave-flash" width="216"
													height="135" loop="true" title="Adobe Flash Player"></embed>
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
							<ul style="display: flex; justify-content: center;"
								class="pagination">
								<li><a href="${path}&page=1"> Trang đầu </a></li>
								<li><a
									href="${path}&page=${ current_page < 1 ? current_page - 1 : 1 }">
										&lt;&lt; </a></li>
								<c:forEach var="i" begin="1" end="${ page_size }">
									<li><a href="${path}&page=${ i }"> ${ i } </a></li>
								</c:forEach>
								<li><a
									href="${path}&page=${ current_page < page_size ? current_page + 1 : current_page }">
										&gt;&gt; </a></li>
								<li><a href="${path}&page=${ page_size }"> Trang cuối </a></li>
							</ul>
						</c:when>

						<c:otherwise>

							<div style="height: 320px;" id="whats-hot">
								<h1
									style="font-size: 41px; text-align: center; margin-top: 15%;">Chưa
									có bài viết nào cho mục này .</h1>

							</div>



						</c:otherwise>
					</c:choose>



				</div>
			</div>
			<div class="pd-20"></div>
		</div>
	</div>
</div>




<jsp:include page="layout/_footer.jsp"></jsp:include>
