<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-profile">
	<div class="modal-dialog show-profile"
		style="display: none; margin-left: -82px; position: fixed; z-index: 999; top: 40%;; bottom: 50%; left: 55%; transform: translate(-50%, -50%);"
		role="document">
		<div class="modal-content">
			<div class="modal-header" style="background-color: #68aa10;">
				<h5 class="modal-title">Modal title</h5>

			</div>
			<div class="modal-body">
				<p
					style="font-size: 20px; font-weight: 700; color: black; text-align: center;">
					Xác nhận thay đổi thông tin người dùng?</p>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary save-change">Xác
					nhận</button>
				<button type="button" class="btn btn-secondary save-close">Huỷ
				</button>
			</div>
		</div>
	</div>
</div>



<div class="modal-password">
	<div class="modal-dialog show-password"
		style="display: none; margin-left: -82px; position: fixed; z-index: 999; top: 40%;; bottom: 50%; left: 55%; transform: translate(-50%, -50%);"
		role="document">
		<div class="modal-content">
			<div class="modal-header" style="background-color: #68aa10;">
				<h5 class="modal-title">Modal title</h5>

			</div>
			<div class="modal-body">
				<p
					style="font-size: 20px; font-weight: 700; color: black; text-align: center;">
					Xác nhận thay đổi mật khẩu ?</p>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary save-change-pass">Xác
					nhận</button>
				<button type="button" class="btn btn-secondary save-close-pass">Huỷ
				</button>
			</div>
		</div>
	</div>
</div>