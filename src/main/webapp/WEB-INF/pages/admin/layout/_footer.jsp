<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</div>
</div>
<div class="mdk-drawer js-mdk-drawer" id="default-drawer"
   data-align="start" data-position="left"
   data-domfactory-upgraded="mdk-drawer" data-persistent="" data-opened="">
   <div class="mdk-drawer__scrim" style=""></div>
   <div class="mdk-drawer__content" style="">
      <div class="sidebar sidebar-dark sidebar-left bg-dark-gray ps"
         data-perfect-scrollbar="">
         <div
            class="d-flex align-items-center sidebar-p-a sidebar-account flex-shrink-0">
            <a class="flex d-flex align-items-center text-underline-0"> <span
               class="mr-3"> <img
               src="${pageContext.request.contextPath }/resources/${user.getImage()}"
               style="width: 46px; height: 46px;" />
            </span> <span class="flex d-flex flex-column"> <span
               class="sidebar-brand">${user.getFullname()
            }</span> <small>${user.getEmail() }</small>
            </span>
            </a>
         </div>
         <ul class="sidebar-menu">
            <li class="sidebar-menu-item"><a class="sidebar-menu-button"
               href="${pageContext.request.contextPath}/"> <i
               class="sidebar-menu-icon sidebar-menu-icon--left material-icons">photo_filter</i>
               <span class="sidebar-menu-text">Trang chủ</span>
               </a>
            </li>
         </ul>
         <div class="sidebar-heading">Quản trị người dùng</div>
         <div class="sidebar-block p-0">
            <ul class="sidebar-menu mt-0">
               <li class="sidebar-menu-item"><a class="sidebar-menu-button"
                  href="${pageContext.request.contextPath}/admin/user/list"> <i
                  class="sidebar-menu-icon sidebar-menu-icon--left material-icons">star_half</i>
                  <span class="sidebar-menu-text">Thành viên</span>
                  </a>
               </li>
               <li class="sidebar-menu-item"><a class="sidebar-menu-button"
                  href="${pageContext.request.contextPath}/admin/user/block"> <i
                  class="sidebar-menu-icon sidebar-menu-icon--left material-icons">queue_play_next</i>
                  <span class="sidebar-menu-text">Bị khoá</span>
                  </a>
               </li>
               <li class="sidebar-menu-item"><a class="sidebar-menu-button"
                  href="student-course-purchase.html"> </a></li>
            </ul>
         </div>
         <div class="sidebar-heading">Quản trị bài viết</div>
         <div class="sidebar-block p-0">
            <ul class="sidebar-menu mt-0">
               <li class="sidebar-menu-item"><a
                  class="sidebar-menu-button"
                  href="${pageContext.request.contextPath}/admin/post/list"> <i
                  class="sidebar-menu-icon sidebar-menu-icon--left material-icons">layers</i>
                  <span class="sidebar-menu-text">Bài viết</span>
                  </a>
               </li>
               <li class="sidebar-menu-item"><a class="sidebar-menu-button"
                  href="${pageContext.request.contextPath}/admin/post/block"> <i
                  class="sidebar-menu-icon sidebar-menu-icon--left material-icons">touch_app</i>
                  <span class="sidebar-menu-text">Bị khoá</span>
                  </a>
               </li>
            </ul>
         </div>
         <div class="sidebar-heading">Quản trị tương tác</div>
         <div class="sidebar-block p-0">
            <ul class="sidebar-menu mt-0">
               <li class="sidebar-menu-item"><a class="sidebar-menu-button"
                  href="${pageContext.request.contextPath}/admin/comment/list">
                  <i
                     class="sidebar-menu-icon sidebar-menu-icon--left material-icons">forum</i>
                  <span class="sidebar-menu-text"> Bình luận</span>
                  </a>
               </li>
               <li class="sidebar-menu-item"><a class="sidebar-menu-button"
                  href="${pageContext.request.contextPath}/admin/report/list"> <i
                  class="sidebar-menu-icon sidebar-menu-icon--left material-icons">pie_chart</i>
                  <span class="sidebar-menu-text"> Báo cáo </span>
                  </a>
               </li>
               <li class="sidebar-menu-item"><a class="sidebar-menu-button"
                  href="${pageContext.request.contextPath}/admin/report/warning">
                  <i
                     class="sidebar-menu-icon sidebar-menu-icon--left material-icons">live_help</i>
                  <span class="sidebar-menu-text"> Cảnh báo </span>
                  </a>
               </li>
            </ul>
         </div>
         <div class="sidebar-heading">Quản trị Mẹo hay & Dinh dưỡng</div>
         <div class="sidebar-block p-0">
            <ul class="sidebar-menu mt-0">
               <li class="sidebar-menu-item"><a class="sidebar-menu-button"
                  href="${pageContext.request.contextPath}/admin/tipNutri/list"> <i
                  class="sidebar-menu-icon sidebar-menu-icon--left material-icons">assignment</i>
                  <span class="sidebar-menu-text"> Danh sách </span>
                  </a>
               </li>
               <li class="sidebar-menu-item"><a id="create-tipNutri" class="sidebar-menu-button"
                  href="${pageContext.request.contextPath}/admin/tipNutri/create">
                  <i
                     class="sidebar-menu-icon sidebar-menu-icon--left material-icons">local_offer</i>
                  <span class="sidebar-menu-text"> Viết bài </span>
                  </a>
               </li>
               <li class="sidebar-menu-item"><a class="sidebar-menu-button"
                  href="${pageContext.request.contextPath}/SignOut"> <i
                  class="sidebar-menu-icon sidebar-menu-icon--left material-icons">exit_to_app</i>
                  <span class="sidebar-menu-text">Đăng xuất</span>
                  </a>
               </li>
            </ul>
         </div>
         <script>
            var selector = '.sidebar-block li';
               var url = window.location.href;
               var target = url.split('/');
               var compare = '/' + target[3] + '/'+target[4]+ '/' +target[5]+ '/' +target[6];
                $(selector).each(function(){
                   if($(this).find('a').attr('href')=== compare){
                     $(selector).removeClass('active');
                     $(this).removeClass('active').addClass('active');
                   }
                });
         </script>
         <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
         </div>
         <div class="ps__rail-y" style="top: 0px; height: 916px; right: 0px;">
            <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
         </div>
      </div>
   </div>
</div>
</div>
<!-- // END drawer-layout -->
<script src="${pageContext.request.contextPath}/vendor/dom-factory.js"></script>
<script src="${pageContext.request.contextPath}/vendor/material-design-kit.js"></script>
<script src="${pageContext.request.contextPath}/vendor/app.js"></script>
<%-- <script src="${pageContext.request.contextPath}/vendor"></script>
   --%>
</body>
</html>