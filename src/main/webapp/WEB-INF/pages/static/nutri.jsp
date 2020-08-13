<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="layout/_header.jsp"></jsp:include>

<!-- ============= CONTENT AREA STARTS HERE ============== -->
<div id="content" class="clearfix homepage">
   <!-- SLIDER STARTS HERE -->
   <!-- Home Page Whats Hot Recipe Area -->
   <c:choose>
      <c:when test="${children.size() != 0}">
         <div id="whats-hot">
            <h3 class="boder_title">
               Dinh dưỡng cho trẻ 
            </h3>
            <ul class="cat-list clearfix">
               <c:forEach items="${children}" var="item">
                  <li>
                     <a
                        href="${pageContext.request.contextPath}/readmore/${ item.id }"
                        class="img-box"> <img style="width: 214px; height: 139px;"
                        src="${pageContext.request.contextPath}/resources/${ item.image }"
                        class="attachment-recipe-4column-thumb wp-post-image"
                        alt="7a0a46455c4ec56a5a02c097374fc513" />
                     </a>
                     <h5>
                        <a class="split-text"
                           href="${pageContext.request.contextPath}/readmore/${ item.id }">
                        ${ item.title } </a>
                     </h5>
                     <p class="split-text">${ item.content }</p>
                  </li>
               </c:forEach>
            </ul>
         <a href="${pageContext.request.contextPath }/filter?condition=Dinh dưỡng cho trẻ&category=Dinh dưỡng" class="readmore" style="background-color: #c33; color: #ffc72e;">Xem thêm »»</a>
            
         </div>
      </c:when>
      <c:otherwise>
         <div  id="whats-hot">
            <h3 class="boder_title">
               Dinh dưỡng cho trẻ 
            </h3>
             <h2 style=" text-align: center; ">Chưa có bài viết nào cho mục này.
            </h2>
         </div>
      </c:otherwise>
   </c:choose>
   <c:choose>
      <c:when test="${posts.size() != 0}">
      </c:when>
      <c:otherwise>
         <div style="height: 320px;" id="whats-hot">
            <h3 class="boder_title">${ title }</h3>
            <h2 style=" text-align: center; margin-top: 4%;">Chưa có bài viết nào cho mục này.
            </h2>
         </div>
      </c:otherwise>
   </c:choose>
   <c:choose>
      <c:when test="${older.size() != 0}">
         <div id="whats-hot">
            <h3 class="boder_title">
               Dinh dưỡng cho người cao tuổi
            </h3>
            <span class="w-pet-border"></span>
            <ul class="cat-list clearfix">
               <c:forEach items="${older}" var="item">
                  <li>
                     <a
                        href="${pageContext.request.contextPath}/readmore/${ item.id }"
                        class="img-box"> <img style="width: 214px; height: 139px;"
                        src="${pageContext.request.contextPath}/resources/${ item.image }"
                        class="attachment-recipe-4column-thumb wp-post-image"
                        alt="7a0a46455c4ec56a5a02c097374fc513" />
                     </a>
                     <h5>
                        <a class="split-text"
                           href="${pageContext.request.contextPath}/readmore/${ item.id }">
                        ${ item.title } </a>
                     </h5>
                     <p class="split-text">${ item.content }</p>
                  </li>
               </c:forEach>
            </ul>
            <a href="${pageContext.request.contextPath }/filter?condition=Dinh Dưỡng cho người cao tuổi&category=Dinh dưỡng" class="readmore" style="background-color: #c33; color: #ffc72e;">Xem thêm »»</a>
         </div>
      </c:when>
      <c:otherwise>
         <div  id="whats-hot">
            <h3 class="boder_title">
               Dinh dưỡng cho người cao tuổi
            </h3>
            <h2 style=" text-align: center;">Chưa có bài viết nào cho mục này.
            </h2>
         </div>
      </c:otherwise>
   </c:choose>
   <c:choose>
      <c:when test="${sick.size() != 0}">
         <div id="whats-hot">
            <h3 class="boder_title">
               Chế độ ăn cho người bệnh 
            </h3>
            <span class="w-pet-border"></span>
            <ul class="cat-list clearfix">
               <c:forEach items="${sick}" var="item">
                  <li>
                     <a
                        href="${pageContext.request.contextPath}/readmore/${ item.id }"
                        class="img-box"> <img style="width: 214px; height: 139px;"
                        src="${pageContext.request.contextPath}/resources/${ item.image }"
                        class="attachment-recipe-4column-thumb wp-post-image"
                        alt="7a0a46455c4ec56a5a02c097374fc513" />
                     </a>
                     <h5>
                        <a class="split-text"
                           href="${pageContext.request.contextPath}/readmore/${ item.id }">
                        ${ item.title } </a>
                     </h5>
                     <p class="split-text">${ item.content }</p>
                  </li>
               </c:forEach>
            </ul>
              <a href="${pageContext.request.contextPath }/filter?condition=Chế độ ăn cho người bệnh&category=Dinh dưỡng" class="readmore" style="background-color: #c33; color: #ffc72e;">Xem thêm »»</a>
            
         </div>
      </c:when>
      <c:otherwise>
         <div id="whats-hot">
            <h3 class="boder_title">
               Chế độ ăn cho người bệnh 
            </h3>
            <h2 style=" text-align: center; ">Chưa có bài viết nào cho mục này.
            </h2>
         </div>
      </c:otherwise>
   </c:choose>
   
   <c:choose>
      <c:when test="${gym.size() != 0}">
         <div id="whats-hot">
            <h3 class="boder_title">
               Dinh dưỡng cho người tập Gym 
            </h3>
            <span class="w-pet-border"></span>
            <ul class="cat-list clearfix">
               <c:forEach items="${gym}" var="item">
                  <li>
                     <a
                        href="${pageContext.request.contextPath}/readmore/${ item.id }"
                        class="img-box"> <img style="width: 214px; height: 139px;"
                        src="${pageContext.request.contextPath}/resources/${ item.image }"
                        class="attachment-recipe-4column-thumb wp-post-image"
                        alt="7a0a46455c4ec56a5a02c097374fc513" />
                     </a>
                     <h5>
                        <a class="split-text"
                           href="${pageContext.request.contextPath}/readmore/${ item.id }">
                        ${ item.title } </a>
                     </h5>
                     <p class="split-text">${ item.content }</p>
                  </li>
               </c:forEach>
            </ul>
              <a href="${pageContext.request.contextPath }/filter?condition=Dinh dưỡng cho người tập Gym&category=Dinh dưỡng" class="readmore" style="background-color: #c33; color: #ffc72e;">Xem thêm »»</a>
            
         </div>
      </c:when>
      <c:otherwise>
         <div id="whats-hot">
            <h3 class="boder_title">
               Dinh dưỡng cho người tập Gym
            </h3>
            <h2 style=" text-align: center; ">Chưa có bài viết nào cho mục này.
            </h2>
         </div>
      </c:otherwise>
   </c:choose>
   <jsp:include page="layout/_footer.jsp"></jsp:include>
</div>