<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../static/layout/_header.jsp"></jsp:include>

<style>
select {
	margin-left: 46px;
	outline: none;
}

select option {
	padding: 10px;
}

.space-left {
	margin-left: 40px;
}

input {
	border-radius: 25px;
	border: none;
	background: #e6e6e6;
	height: 40px;
}
</style>

<div id="content" class="clearfix"
	style="width: 100%; -webkit-box-shadow: 1px 6px 19px -4px rgba(0, 0, 0, 0.75); -moz-box-shadow: 1px 6px 19px -4px rgba(0, 0, 0, 0.75); box-shadow: 1px 6px 19px -4px rgba(0, 0, 0, 0.75);">
	<div id="left-area" class="clearfix" style="width: 91%;">
		<div class="post-53 post category-barbeque" id="post-53">

			<form action="post-create" method="POST">


				<h3
					style="color: #c33; font-size: 30px; text-align: center; margin: 30px 0px;"
					class="single-post-title">Tạo bài viết mới</h3>



				<input name="title" style="width: 100%; color: #888;" minlength="5"
					required maxlength="50" placeholder="Nhập tiêu đề bài viết !!!" />
				<br> <br> <br>
				<div class="post-53 post category-barbeque" style="width: 100%;">
					<div class="blog-div with20">
						<h3 style="text-align: center; margin-left: 50px;">Thời gian</h3>

						<select class="dropdown" name="time">
							<option value="15">15 Phút</option>
							<option value="30">30 Phút</option>
							<option value="45">45 Phút</option>
							<option value="60">60 Phút</option>
							<option value="70">Trên 60 Phút</option>
						</select>
					</div>

					<div class="blog-div with20 ">
						<h3 style="text-align: center; margin-left: 48px;">Khẩu phần</h3>
						<select class="dropdown" name="ration">
							<option value="1">1 Phần</option>
							<option value="2">2 Phần</option>
							<option value="3">3 Phần</option>
							<option value="4">4 Phần</option>
							<option value="5">Trên 4 Phần</option>
						</select>
					</div>

					<div class="blog-div with20">
						<h3 style="text-align: center; margin-left: 51px;">Cách thức</h3>
						<select class="dropdown" name="kind">
							<option value="Có cách nấu khác">Có cách nấu khác</option>
							<option value="Nướng">Nướng</option>
							<option value="Kho-Om">Kho-Om</option>
							<option value="Chiên-Rán">Chiên-Rán</option>
							<option value="Canh-Súp">Canh-Súp</option>
							<option value="Luộc-Hầm/Hấp">Luộc-Hầm-Hấp</option>
							<option value="Xào-Rang-Rim">Xào-Rang-Rim</option>

						</select>
					</div>



					<div class="blog-div with20">
						<h3 style="text-align: center; margin-left: 51px;">Nguyên
							liệu chính</h3>
						<select name="main_material" class="space-left dropdown">
							<option value="Nguyên liệu khác">Nguyên liệu khác</option>
							<option value="Thịt bò">Thịt bò</option>
							<option value="Thịt lợn">Thịt lợn</option>
							<option value="Thịt gia cầm">Thịt gia cầm</option>
							<option value="Rau đậu">Rau đậu</option>
							<option value="Hải sản">Hải sản</option>
							<option value="Trứng">Trứng</option>
							<option value="Bún-Phở-Miến">Bún-Phở-Miến</option>
							<option value="Cơm-Xôi-Cháo">Cơm-Xôi-Cháo</option>


						</select>
					</div>

					<div class="blog-div with20">
						<h3 style="text-align: center;">Giá thành</h3>
						<input type="number" required max="10000" min="0"
							style="width: 100px; margin-left: 32px; height: 11px;"
							name="price" />
					</div>
				</div>

				<div class="" style="width: 100%;">
					<a title="Best Bread pairing for Barbeque?"> <embed id="video"
							src="" wmode="transparent" type="application/x-shockwave-flash"
							width="889" height="400" allowfullscreen="true"
							title="Adobe Flash Player"></embed>

					</a> <input name="video_url" id="input" type="url" required
						pattern="https?://.+"
						placeholder=" Nhập liên kết video hướng dẫn bắt đầu bằng https:// hoặc http:// !! "
						style="width: 100%;">

				</div>

				<div class="blog-div with30">
					<h3 style="text-align: center;">Xuất xứ</h3>
					<select class="dropdown" name="nation" class="space-left">
						<option value="Các nước khác">Các nước khác</option>
						<option value="Việt Nam">Việt Nam</option>
						<option value="Nhật Bản">Nhật Bản</option>
						<option value="Châu Âu">Châu Âu</option>
						<option value="Trung Quốc">Trung Quốc</option>
						<option value="Thái Lan">Thái Lan</option>

					</select>
				</div>

				<div class="blog-div with30">
					<h3 style="text-align: center;">Ngày lễ/Kỉ niệm</h3>
					<select class="dropdown" name="holiday" class="space-left">
						<option value="Ngày lễ khác">Ngày lễ khác</option>
						<option value="Sinh nhật">Sinh nhật</option>
						<option value="Trung thu">Trung Thu</option>
						<option value="Mâm cỗ">Mâm cỗ</option>
						<option value="Tết nguyên đán">Tết nguyên đán</option>

					</select>
				</div>

				<div class="blog-div with30">
					<h3 style="text-align: center;">Thể loại</h3>
					<select class="dropdown" name="category" class="space-left">
						<option value="Bánh">Bánh</option>
						<option value="Lẩu">Lẩu</option>
						<option value="Salad">Salad</option>
						<option value="Ăn sáng">Ăn sáng</option>
						<option value="Ăn vặt">Ăn vặt</option>
						<option value="Khai vị">Khai vị</option>
						<option value="Món chay">Món chay</option>
						<option value="Món chính">Món chính</option>
						<option value="Đồ uống">Đồ uống</option>

					</select>
				</div>

				<div class="blog-div with30">
					<h3 style="text-align: center;">Phù hợp</h3>
					<select class="dropdown" name="suitable" name="" class="space-left">
						<option value="Đối tượng khác">Đối tượng khác</option>
						<option value="Gia đình">Gia đình</option>
						<option value="Người gầy">Người gầy</option>
						<option value="Người béo phì">Người béo phì</option>
						<option value="Người tập GYM">Người tập GYM</option>

					</select>
				</div>

				<h1 class="w-bot-border">
					<span>Giới thiệu</span>
				</h1>
				<textarea name="overview" cols="128" rows="9" required minlength="5" maxlength="500" 
					placeholder="Mô tả - Giới thiệu về món ăn của bạn !! "
					class="pb-cmnt-textarea"></textarea>
				<h1 class="w-bot-border">
					<span> Nguyên liệu </span>
				</h1>
				<textarea name="material_detail" cols="128" rows="9" required minlength="5" maxlength="1000"
					placeholder="Cách loại nguyên liệu cần chuẩn bị !!!"
					class="pb-cmnt-textarea"></textarea>
				<h1 class="w-bot-border">
					<span>Cách làm </span>
				</h1>
				<textarea name="making" cols="128" rows="9" required minlength="5" maxlength="10000"
					placeholder="Chia sẻ cách làm của bạn !!! " class="pb-cmnt-textarea"></textarea>
		</div>
		<!-- end of post div -->

		<div class="comments">
			<!-- You can start editing here. -->

			<span class="w-pet-border"></span>

			<div class="reply" style="margin-left: 353px;">
				<input type="reset" class="btn btn btn-danger"
					style="height: 49px; line-height: 37px; width: 66px;"
					aria-label="Reply to admin">

				<button class="btn btn btn-info"
					style="height: 49px; line-height: 38px; width: 108px;"
					aria-label="Reply to admin">Tạo bài viết</button>
			</div>


		</div>

		</form>


	</div>

</div>



<jsp:include page="../../static/layout/_footer.jsp"></jsp:include>