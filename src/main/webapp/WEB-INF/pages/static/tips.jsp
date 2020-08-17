<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="layout/_header.jsp"></jsp:include>
<!-- ============= CONTENT AREA STARTS HERE ============== -->
<div id="content" class="clearfix homepage">
<!-- SLIDER STARTS HERE -->
<c:choose>
   <c:when test="${tips2.size() != 0}">
      <div id="whats-hot">
         <h3 class="boder_title" >
           Bí quyết nấu nướng
         </h3>
         <span class="w-pet-border"></span>
         <ul class="cat-list clearfix">
            <c:forEach items="${tips2}" var="item">
               <li>
                  <a href="${pageContext.request.contextPath}/readmore/${ item.id }" class="img-box"> <img style="width: 214px; height: 139px;"
                     src="${pageContext.request.contextPath}/resources/${ item.image }"
                     class="attachment-recipe-4column-thumb wp-post-image"
                     alt="7a0a46455c4ec56a5a02c097374fc513" />
                  </a>
                  <h5>
                     <a class="split-text" href="${pageContext.request.contextPath}/readmore/${ item.id }"> ${ item.title }
                     </a>
                  </h5>
                  <p class="split-text">${ item.content }</p>
               </li>
            </c:forEach>
         </ul>
       <a href="${pageContext.request.contextPath }/filter?condition=Bí quyết nấu nướng&category=Mẹo hay" class="readmore" style="background-color: #c33; color: #ffc72e;">Xem thêm »»</a>
         
      </div>
   </c:when>
   <c:otherwise>
      <div  id="whats-hot">
         <h3 class="boder_title" >
            Bí quyết nấu nướng 
         </h3>
         <h2 style=" text-align: center; margin-top: 4%;">Chưa có bài viết nào cho mục này.
         </h2>
      </div>
   </c:otherwise>
</c:choose>


<c:choose>
   <c:when test="${tips3.size() != 0}">
      <div id="whats-hot">
         <h3 class="boder_title" >
            Các thực phẩm kị nhau 
         </h3>
         <span class="w-pet-border"></span>
         <ul class="cat-list clearfix">
            <c:forEach items="${tips3}" var="item">
               <li>
                  <a href="${pageContext.request.contextPath}/readmore/${ item.id }" class="img-box"> <img style="width: 214px; height: 139px;"
                     src="${pageContext.request.contextPath}/resources/${ item.image }"
                     class="attachment-recipe-4column-thumb wp-post-image"
                     alt="7a0a46455c4ec56a5a02c097374fc513" />
                  </a>
                  <h5>
                     <a class="split-text" href="${pageContext.request.contextPath}/readmore/${ item.id }"> ${ item.title }
                     </a>
                  </h5>
                  <p class="split-text">${ item.content }</p>
               </li>
            </c:forEach>
         </ul>
        <a href="${pageContext.request.contextPath }/filter?condition=Các thực phẩm kị nhau&category=Mẹo hay" class="readmore" style="background-color: #c33; color: #ffc72e;">Xem thêm »»</a>
         
      </div>
   </c:when>
   <c:otherwise>
      <div  id="whats-hot">
         <h3 class="boder_title" >
            Các thực phẩm kỵ nhau 
         </h3>
         <h2 style=" text-align: center; margin-top: 4%;">Chưa có bài viết nào cho mục này.
         </h2>
      </div>
   </c:otherwise>
</c:choose>
<!-- Home Page Whats Hot Recipe Area -->


<c:choose>
   <c:when test="${tips1.size() != 0}">
      <div id="whats-hot">
         <h3 class="boder_title">
            Mẹo hay chế biến nguyên liệu
         </h3>
         <ul class="cat-list clearfix">
            <c:forEach items="${tips1}" var="item">
               <li>
                  <a href="${pageContext.request.contextPath}/readmore/${ item.id }" class="img-box"> <img style="width: 214px; height: 139px;"
                     src="${pageContext.request.contextPath}/resources/${ item.image }"
                     class="attachment-recipe-4column-thumb wp-post-image"
                     alt="7a0a46455c4ec56a5a02c097374fc513" />
                  </a>
                  <h5>
                     <a class="split-text" href="${pageContext.request.contextPath}/readmore/${ item.id }"> ${ item.title }
                     </a>
                  </h5>
                  <p class="split-text">${ item.content }</p>
               </li>
            </c:forEach>
         </ul>
       <a href="${pageContext.request.contextPath }/filter?condition=Mẹo hay chế biến nguyên liệu&category=Mẹo hay" class="readmore" style="background-color: #c33; color: #ffc72e;">Xem thêm »»</a>
         
      </div>
   </c:when>
   <c:otherwise>
      <div  id="whats-hot">
         <h3 class="boder_title">
            Mẹo hay chế biến nguyên liệu
         </h3>
         <h2 style=" text-align: center; ">Chưa có bài viết nào cho mục này.
         </h2>
      </div>
   </c:otherwise>
</c:choose>
<jsp:include page="layout/_footer.jsp"></jsp:include>