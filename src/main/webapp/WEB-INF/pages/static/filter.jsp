<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="layout/_header.jsp"></jsp:include>
<!-- ============= CONTENT AREA STARTS HERE ============== -->
<div id="content" class="clearfix homepage">
	<!-- SLIDER STARTS HERE -->

	<c:choose>

		<c:when test="${posts.size() != 0}">





			<c:choose>

				<c:when test="${check != true}">
					<div id="whats-hot">
						<h3 class="boder_title">${ title }</h3>
						<ul class="cat-list clearfix">
							<c:forEach items="${ posts }" var="post">
								<li>
									<h4 style="margin-bottom: -2px;">
										<a style="margin-bottom: -6px; color: #c33;"
											href="${pageContext.request.contextPath}/filter?condition=${post.category }&category=category">${post.category }</a>
										<i class="d-f-r">${ post.created_at.toString().split(" ")[0] }</i>
									</h4> <a
									href="${pageContext.request.contextPath}/post-show/${post.id }"
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
				</c:when>

				<c:otherwise>
					<div id="whats-hot">
						<h3 class="boder_title">${ title }</h3>
						<ul class="cat-list clearfix">

						<c:forEach items="${ posts }" var="post">

							<li>
								 <a href="${pageContext.request.contextPath}/readmore/${ post.id }" class="img-box"> <img style="width: 214px; height: 139px;"
									src="${pageContext.request.contextPath }/resources/${post.image }"
									class="attachment-recipe-4column-thumb wp-post-image"
									>
							</a>
								<h5 >
									<a class="split-text" href="${pageContext.request.contextPath}/readmore/${ post.id }"> ${post.title } </a>
								</h5>
								<p class="split-text">
									${post.content } 
								</p>
							</li>
							
							</c:forEach>
						</ul>
					</div>


				</c:otherwise>
			</c:choose>

<div class="p-main" style="display: flex; justify-content: center;">


<div class="p1">
<a  class="btn" style="border: 1px solid #ddd;" href="${path}&page=1"> Trang đầu </a>
<a class="btn" style="border: 1px solid #ddd;" href="${path}&page=${ current_page < 1 ? current_page - 1 : 1 }"> &lt;&lt; </a>
</div>
<div class="p2">

<ul  style="margin: 0px !important;" class="pagination">
    <c:forEach var="i" begin="1" end="${ page_size }">
        <li class="${i == 1 ? 'active' : '' }"><a href="${path}&page=${ i }"> ${ i } </a></li>
    </c:forEach>
</ul>
</div>
<div class="p3">

<a class="btn" style="border: 1px solid #ddd;" href="${path}&page=${ current_page < page_size ? current_page + 1 : current_page }"> &gt;&gt; </a>
<a class="btn" style="border: 1px solid #ddd;" href="${path}&page=${ page_size }"> Trang cuối </a>
</div>

</div>


 		<script>
 
 		
 		 var selector = '.pagination li';
 		    var url = window.location.href;
 		    var target = url.split('page');
 		    var compare = target[target.length-1];
 		     $(selector).each(function(){
 		    	 var current =  $(this).find('a').attr('href').split('page');
 		    	 
 		    	 console.log('COMPE',compare);
 		    	 console.log('Cueent',current[1]);

 		        if(current[1] == compare){
 		          $(selector).removeClass('active');
 		          $(this).removeClass('active').addClass('active');
 		        }

 		     });
 		</script>





		</c:when>

		<c:otherwise>

			<div style="height: 320px;" id="whats-hot">
				<h3 class="boder_title">${ title }</h3>

				<h1 style="font-size: 41px; text-align: center; margin-top: 15%;">Chưa
					có bài viết nào cho mục này .</h1>

			</div>



		</c:otherwise>
	</c:choose>


</div>
<!-- end of content div -->
<jsp:include page="layout/_footer.jsp"></jsp:include>
