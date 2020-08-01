<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
  pre {
  white-space: pre-wrap;
  }
</style>
<jsp:include page="layout/_header.jsp"></jsp:include>

<div id="content" class="clearfix" style="width: 100%;">



	<div id="content" class="clearfix ">
		<div id="left-area" class="clearfix">

			<div class="post-53 post category-barbeque" id="post-53">
				<h1 class="single-post-title">${ record.title }</h1>
				<p class="meta">
					<span>|</span> Ngày viết : ${ record.created_at.toString().split(' ')[0] }
					<span>|</span> Danh mục : <span class="cats"><a href="#"
						rel="category tag">${record.type}</a></span>
				</p>
				<div class="post-thumb single-img-box">
					<a title="Best Bread pairing for Barbeque?"> <img
						style="width: 100%;"
						src="${pageContext.request.contextPath }/resources/${record.image}"
						alt="accor_3" style="opacity: 1;">
					</a>
				</div>
				<pre style=" border: 0px;margin-left: -1%;">${record.content}</pre>
				<div class="blog-post-social">
					<div class="share">
						<h3 style="float: right">
			 Nguồn/Tác giả: &nbsp <em> ${ record.author } </em>
			</h3>
					</div>
				</div>
			</div>

		</div>
		<!-- end of left-area -->
		<!-- LEFT AREA ENDS HERE -->

		<!-- ========== START OF SIDEBAR AREA ========== -->
		<div id="sidebar">
			<div class="widget fav-recipes nostylewt">
				<h3 class="w-bot-border">
					<span>Bài viết mới</span>
				</h3>

				<div class="tabed">
					<ul class="tabs clearfix">
						<li class="current">Top 5<span></span></li>
					</ul>
					
					<div class="block">
						<ul class="highest">

							<c:forEach items="${refer}" var="item">
								<li style="padding: 0px; margin: 0px"><a
									href="recipe-single-1.html" class="img-box"><img
										src="${pageContext.request.contextPath }/resources/${item.image}"
										class="attachment-sidebar-tabs wp-post-image"
										></a>
									<h5>
										<a href="${pageContext.request.contextPath}/readmore/${ item.id }">${item.title}</a>
									</h5>

									<p class="rate">
										
										${item.user.fullname.split(' ')[0]} \\ ${item.created_at.toString().split(' ')[0]}
									</p></li>
							</c:forEach>
						</ul>
					</div>
					<div class="bot-border"></div>
				</div>
			</div>

			<div id="recent-posts-2"
				class="widget nostylewt widget_recent_entries clearfix">
				<h3 class="w-bot-border">
					<span>Mẹo Hay </span> 
				</h3>
				<ul>
					<li><a href="${pageContext.request.contextPath }/filter?condition=Mẹo hay chế biến nguyên liệu&category=Mẹo hay"> Mẹo hay chế biến nguyên liệu </a></li>
					<li><a href="${pageContext.request.contextPath }/filter?condition=Bí quyết nấu nướng&category=Mẹo hay">Bí quyết nấu nướng </a></li>
					<li><a href="${pageContext.request.contextPath }/filter?condition=Các thực phẩm kỵ nhau&category=Mẹo hay"> Các thực phẩm kỵ nhau</a></li>
					
				</ul>
				
				<h3 class="w-bot-border">
					<span>Dinh Dưỡng </span> 
				</h3>
				<ul>
					<li><a href="${pageContext.request.contextPath }/filter?condition=Dinh dưỡng cho trẻ&category=Dinh dưỡng">Dinh dưỡng cho trẻ </a></li>
					<li><a href="${pageContext.request.contextPath }/filter?condition=Chế độ ăn cho người bệnh&category=Dinh dưỡng">Chế độ ăn cho người bệnh</a></li>
					<li><a href="${pageContext.request.contextPath }/filter?condition=Dinh Dưỡng cho người cao tuổi&category=Dinh dưỡng">Dinh Dưỡng cho người cao tuổi </a></li>
					
				</ul>
			</div>
		</div>
		<!-- end of sidebar -->

	</div>
	
	
	<div class="bot-ads-area">
            <div class="ads-642x79">
                <a href="#"><img src="${pageContext.request.contextPath}/resources/static//images/top.png" alt="Recipe Ads"></a>
            </div>
        </div>


</div>
<jsp:include page="layout/_footer.jsp"></jsp:include>
