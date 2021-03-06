<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="layout/_header.jsp"></jsp:include>
<style></style>
<div id="content" class="clearfix homepage">
	<div id="whats-hot">
		<h3 class="boder_title">Nguyên liệu</h3>
		<span class="w-pet-border"></span>
		<ul class="cat-list clearfix">

			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Thịt lợn&category=main_material"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static/images/category/thit_lon.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Thịt lợn&category=main_material">
						Thịt lợn </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Thịt gia cầm&category=main_material"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/thit_gicam.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Thịt gia cầm&category=main_material">
						Thịt gia cầm </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Thịt Bò&category=main_material"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/thit_bo.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Thịt Bò&category=main_material">
						Thịt Bò </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Rau đậu&category=main_material"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/rau_dau.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Rau đậu&category=main_material">
						Rau Đậu </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Hải sản&category=main_material"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/haisan.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Hải Sản&category=main_material">
						Hải sản </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Trứng&category=main_material"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/trung.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Trứng&category=main_material">
						Trứng </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Bún-Phở-Miến&category=main_material"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/bun.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Bún-Phở-Miến&category=main_material">
						Bún-Phở-Miến </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Cơm-Xôi-Cháo&category=main_material"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/xoi.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Cơm-Xôi-Cháo&category=main_material">
						Cơm-Xôi-Cháo </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Nguyên liệu khác&category=main_material"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/OtherThitLon.png"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Nguyên liệu khác&category=main_material">
						Nguyên liệu khác </a>
				</h4></li>
		</ul>
	</div>

	<div id="whats-hot">
		<h3 class="boder_title">
			Phương pháp <span> </span>
		</h3>
		<span class="w-pet-border"></span>
		<ul class="cat-list clearfix">
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Kho-Om&category=kind"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/kho-om.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Kho-Om&category=kind">
						Kho-Om </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Nướng&category=kind"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/do_nuong.jpeg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Nướng&category=kind">
						Nướng </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Chiên-Rán&category=kind"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/chien_ran.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Chiên-Rán&category=kind">
						Chiên-Rán </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Canh-Súp&category=kind"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/canh_sup.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Canh-Súp&category=kind">
						Canh-Súp </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Luộc-Hầm-Hấp&category=kind"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/luoc_ham.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Luộc-Hầm-Hấp&category=kind">
						Luộc-Hầm-Hấp </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Rang-Xào&category=kind"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/rang-xao.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Rang-Xào&category=kind">Rang-Xào
					</a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Có cách nấu khác&category=kind"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/othercachnau.png"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Có cách nấu khác&category=kind">Có
						cách nấu khác </a>
				</h4></li>
		</ul>
	</div>
	<div id="whats-hot">
		<h3 class="boder_title">Xuất xứ</h3>
		<span class="w-pet-border"></span>
		<ul class="cat-list clearfix">
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Việt Nam&category=nation"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/vietnam.png"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Việt Nam&category=nation">
						Việt Nam </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Châu Âu&category=nation"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/chauau.png"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Châu Âu&category=nation">
						Các Nước Châu Âu </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Trung Quốc&category=nation"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/trungquoc.png"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Trung Quốc&category=nation">
						Trung Quốc </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Nhật Bản&category=nation"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/nhatban.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Nhật Bản&category=nation">
						Nhật Bản </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Thái Lan&category=nation"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/Thailan.png"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Thái Lan&category=nation">
						Thái Lan </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Các nước khác&category=nation"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/otherNation.png"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Các nước khác&category=nation">
						Các nước khác </a>
				</h4></li>
		</ul>
	</div>
	<div id="whats-hot">
		<h3 class="boder_title">Ngày lễ - kỉ niệm</h3>
		<span class="w-pet-border"></span>
		<ul class="cat-list clearfix">
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Tết nguyên đán&category=holiday"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/tet.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Tết nguyên đán&category=holiday">
						Tết nguyên đán </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Trung thu&category=holiday"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/trungthu.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Trung thu&category=holiday">
						Trung thu </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Mâm cỗ&category=holiday"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/mamco.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Mâm cỗ&category=holiday">
						Mâm cỗ </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Sinh nhật&category=holiday"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/sinhnhat.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Sinh nhật&category=holiday">Sinh
						nhật </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Ngày lễ khác&category=holiday"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/otherlehoi.png"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Ngày lễ khác&category=holiday">Ngày
						lễ khác </a>
				</h4></li>
		</ul>
	</div>
	<div id="whats-hot">
		<h3 class="boder_title">
			Thể loại <span> </span>
		</h3>
		<span class="w-pet-border"></span>
		<ul class="cat-list clearfix">
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Món chính&category=category"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/monchinh.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Món chính&category=category">
						Món chính </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Món chay&category=category"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/monchay.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Món chay&category=category">
						Món chay </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Đồ uống&category=category"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/douong.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Đồ uống&category=category">
						Đồ uống </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Ăn sáng&category=category"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/ansang.jpeg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Ăn sáng&category=category">
						Ăn sáng </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Ăn vặt&category=category"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/anvat.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Ăn vặt&category=category">
						Ăn vặt </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Khai vị&category=category"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/khaivi.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Khai vị&category=category">
						Khai vị </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Salad&category=category"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/salad.jpeg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Salad&category=category">
						Salad </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Bánh&category=category"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/banh.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Bánh&category=category">
						Bánh </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Lẩu&category=category"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/lau.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Lẩu&category=category">
						Lẩu </a>
				</h4></li>
		</ul>
	</div>
	<div id="whats-hot">
		<h3 class="boder_title">Thực đơn phù hợp</h3>
		<span class="w-pet-border"></span>
		<ul class="cat-list clearfix">
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Người gầy&category=suitable"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/nguoigay.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Người gầy&category=suitable">
						Người gầy </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Người béo phì&category=suitable"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/nguoibeo.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Người béo phì&category=suitable">
						Người béo </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Người tập GYM&category=suitable"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/tamgym.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Người tập GYM&category=suitable">
						Người tập GYM </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Gia đình&category=suitable"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/giadinh.jpg"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Gia đình&category=suitable">
						Gia đình </a>
				</h4></li>
			<li><a
				href="${pageContext.request.contextPath}/filter?condition=Đối tượng khác&category=suitable"
				class="img-box"> <img style="height: 145px;"
					src="${pageContext.request.contextPath}/resources/static//images/category/otherphuhop.png"
					class="attachment-recipe-4column-thumb wp-post-image" alt="accor_2" />
			</a>
				<h4>
					<a
						href="${pageContext.request.contextPath}/filter?condition=Đối tượng khác&category=suitable">
						Đối tượng khác </a>
				</h4></li>
		</ul>
	</div>

	<div class="bot-ads-area">
		<div class="ads-642x79">
			<a href="#"><img
				src="${pageContext.request.contextPath}/resources/static/images/top.png"
				alt="Recipe Ads"></a>
		</div>
	</div>
</div>
<jsp:include page="layout/_footer.jsp"></jsp:include>