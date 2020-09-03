<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../layout/_header.jsp"></jsp:include>
<!-- // END Header -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div
   class="mdk-header-layout__content mdk-header-layout__content--fullbleed mdk-header-layout__content--scrollable page"
   style="padding-top: 60px;">
   <div class="page__heading border-bottom">
      <div class="container-fluid page__container d-flex align-items-center">
         <h1 class="mb-0" style="margin-left: -3%;">Cảnh báo </h1>
         <!-- 	<a href="quiz-edit.html" class="btn btn-success ml-auto"><i
            class="material-icons">add</i>Viết bài</a> -->
         			<span id="hideMe" class="${class_name}">${ msg }</span>

      </div>
   </div>
   <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div style="top: 25%;" class="modal-dialog">
         <div style="border-radius: 10px" class="modal-content">
            <div
               style="padding: 10px 40px 10px 20px; background-color: #212529; border-top-left-radius: 10px; border-top-right-radius: 10px;"
               class="modal-header">
               <h2
                  style="font-size: 28px; color: #fff; margin-left: 30%; text-align: center;"
                  class="modal-title" id="myModalLabel">Xác nhận khoá</h2>
            </div>
            <div class="modal-body">
               <p style="text-align: center; font-size: 19px;">Khoá bình luận
                  ?
               </p>
               <p
                  style="text-align: center; font-style: italic; font-weight: bold;"
                  id="modal_name"></p>
               <p class="debug-url"></p>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-basic" data-dismiss="modal">Huỷ</button>
               <a id="confirm_url" href="" style="margin-right: 40%"
                  class="btn btn-danger btn-ok">Xác nhận</a>
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
      $(document).ready(function() {
      	$(".use-block").click(function() {
      	    var $row = $(this).closest("tr");    // Find the row
      	    var name = $row.find(".full_name").text(); // Find the text
      		thisdata = $(this).attr('data-href');
      		$("#confirm_url").attr("href", thisdata);
      	    $('#modal_name').text(name);
      	    
      	});
      });
   </script>
   <div class="container-fluid page__container">
      <div class="row">
         <table id="example" class="table table-striped">
            <thead>
               <tr>
                  <th class="table-th" scope="col">#</th>
                  <th class="table-th" scope="col">Họ Tên</th>
                  <th class="table-th" scope="col">Số điện thoại</th>
                  <th class="table-th" scope="col"> Tông hợp </th>
                  <th class="table-th" scope="col">Ảnh đại diện</th>
                  <th class="table-th" scope="col">Thao tác</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${users }" var="user_detail">
             
                     
                        <tr>
                           <td scope="row">${ user_detail[0] }</td>
                           <td class="full_name">${ user_detail[1] }</td>
                           <td>${ user_detail[2] }</td>
                           
                           <td>
                              <c:forEach items="${user_detail[5].split(',') }" begin="0" end="${fn:length(user_detail[5].split(',')) }" var="i">
                                 <c:choose>
                                    <c:when test = "${ i == 1}">
                                       <p>Spam</p>
                                    </c:when>
                                    <c:when test = "${ i  == 2}">
                                       <p >Bạo lực </p>
                                    </c:when>
                                    <c:when test = "${ i  == 3}">
                                       <p  >Nội dung đồi truỵ  </p>
                                    </c:when>
                                    <c:when test = "${ i  == 4}">
                                       <p   >Nội dung khiếm nhã  </p>
                                    </c:when>
                                    <c:otherwise>
                                       <p  >Gây hiểu nhâm, lừa đảo  </p>
                                    </c:otherwise>
                                 </c:choose>
                              </c:forEach>
                           </td> 
                           
                           
                           
                           <td><img
                              src="${pageContext.request.contextPath}/resources/${ user_detail[3] }"></td>
                           <td>
                              <button class="btn btn-dark use-block" id="test"
                                 data-href="${pageContext.request.contextPath}/admin/user/_block?user_id=${user_detail[0]}&&comment_id=${user_detail[6]}"
                                 data-toggle="modal" data-target="#confirm-delete">
                              <i class="fa fa-lock"></i>
                              </button> 
                           </td>
                        </tr>
                   
               </c:forEach>
            </tbody>
         </table>
      </div>
   </div>
</div>
<jsp:include page="../layout/_footer.jsp"></jsp:include>