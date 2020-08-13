<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.our-team {
	padding: 30px 0 40px;
	margin-bottom: 30px;
	background-color: #f7f5ec;
	text-align: center;
	overflow: hidden;
	position: relative;
}

.our-team .picture {
	display: inline-block;
	height: 130px;
	width: 130px;
	margin-bottom: 50px;
	z-index: 1;
	position: relative;
}

.our-team .picture::before {
	content: "";
	width: 100%;
	height: 0;
	border-radius: 50%;
	background-color: #ffc72c;
	position: absolute;
	bottom: 135%;
	right: 0;
	left: 0;
	opacity: 0.9;
	transform: scale(3);
	transition: all 0.3s linear 0s;
}

.our-team:hover .picture::before {
	height: 100%;
}

.our-team .picture::after {
	content: "";
	width: 100%;
	height: 100%;
	border-radius: 50%;
	background-color: #ffc72c;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
}

.our-team .picture img {
	width: 100%;
	height: auto;
	border-radius: 50%;
	transform: scale(1);
	transition: all 0.9s ease 0s;
}

.our-team:hover .picture img {
	box-shadow: 0 0 0 14px #f7f5ec;
	transform: scale(0.7);
}

.our-team .title {
	display: block;
	font-size: 15px;
	color: #4e5052;
	text-transform: capitalize;
}

.our-team .social {
	width: 100%;
	padding: 0;
	margin: 0;
	background-color: #ffc72c;
	position: absolute;
	bottom: -100px;
	left: 0;
	transition: all 0.5s ease 0s;
}

.our-team:hover .social {
	bottom: 0;
}

.our-team .social li {
	display: inline-block;
}

.our-team .social li a {
	display: block;
	padding: 10px;
	font-size: 17px;
	color: white;
	transition: all 0.3s ease 0s;
	text-decoration: none;
}

.our-team .social li a:hover {
	color: #fff;
	background-color: #c33;
}
</style>
<jsp:include page="layout/_header.jsp"></jsp:include>

<div id="content" class="clearfix" style="width: 100%;">

	<div id="left-area" class="clearfix" style="width: 91%;">
		<div class="post-53 post category-barbeque" id="post-53">
			<h1 style="color: #c33; font-size: 40px; text-align: center; margin: 30px 0px;"
				class="single-post-title">- Yummy & Câu chuyện của chúng ta -</h1>
			<br>

			<h1 style="font-size: 30px; text-align: center; margin-bottom: 45px;"
				class="single-post-title">Câu chuyện của Yummy</h1>

			<!-- 			<div style="border: 5px double #565556; border-radius: 20px;">
 -->
			<p style="padding: 19px; text-align: justify;">Yummy được tạo nên
				với mong muốn có thể giúp cho người nội trợ và những người có đam mê
				nấu ăn sẽ trở nên dễ dàng hơn trong việc nấu ăn hàng ngày của mình.
				Từ công việc chuẩn bị các nguyên liệu, phải chọn món ăn hàng ngày
				hoặc lựa chọn những thiết bị dùng bếp sẽ trở nên dễ dàng hơn.</p>

			<p style="padding: 19px; text-align: justify;">Bạn có thể tìm
				kiếm công thức các món ăn ưa thích một cách nhanh chóng hơn với công
				cụ tìm kiếm của Yummy. Bạn có thể tìm kiếm theo tên, theo nguyên
				liệu, theo mục đích, theo chế độ dinh dưỡng (gym, người cao
				tuổi,...).</p>

			<p style="padding: 19px; text-align: justify;">Nấu một món ngon
				trở nên dễ dàng hơn với Yummy. Yummy sẽ cố gắng từng ngày một với
				mong muốn tạo ra một sản phẩm có thể giúp cho những đầu bếp bình
				thường nhất nấu được một món ăn ngon nhất. Chúng tôi chắc chắn rằng
				bạn sẽ cảm thấy rất vui khi được tự nấu cho một ai đó thưởng thức.
				Và cảm nhận thành quả của mình đã làm ra.</p>

			<p style="padding: 19px; text-align: justify;">Bạn sẽ trở thành
				những chuyên gia nấu ăn nhờ những công thức từ các đầu bếp chuyên
				nghiệp. Một ngày nào đó bạn sẽ trở nên nổi tiếng với chính những "bí
				kíp" nấu ăn mà bạn đã tạo ra và chia sẻ chúng. Chúng tôi tin rằng
				bạn sẽ trở thành một đầu bếp chuyên nghiệp trong tương lai.</p>

			<p style="padding: 19px; text-align: justify;">Hơn nữa, bạn sẽ dễ
				dàng tìm được những người bạn có cùng đam nấu nướng và ăn uống. Bạn
				có thể kết nối và chia sẻ kinh nghiệm về nấu ăn cho nhau. Mong muốn
				có thể tạo được một sân chơi thật sự cho người đam mê ẩm thực, đam
				mê nấu nướng. Bạn có thể đưa ra những ý kiến riêng của bản thân về
				những bài viết trên Yummy ở dưới phần bình luận để tăng thêm sự
				khách quan.</p>
			<!-- 			</div>
 -->






		</div>
	</div>




	<h1
		style="font-size: 30px; text-align: center; margin-bottom: 45px; margin-left: 0;"
		class="single-post-title">Đồng sáng lập</h1>


	<div class="container" style="width: 100%;">
		<div class="row">

			<div class="col-12 col-sm-6 col-md-4 col-lg-3">
				<div class="our-team">
					<div class="picture">
						<img class="img-fluid"
							src="https://scontent.fhan5-1.fna.fbcdn.net/v/t1.0-1/79279911_628458811020028_2522879612329918464_n.jpg?_nc_cat=109&_nc_sid=dbb9e7&_nc_ohc=5aaCKGxEqosAX9m9-82&_nc_ht=scontent.fhan5-1.fna&oh=9e04bb721c2bd23b4c2402bdf2923b71&oe=5F5A063A">
					</div>
					<div class="team-content">
						<h3 class="name">Ng Thúy Trang</h3>
						<h4 class="title">Web Developer</h4>
					</div>
					<ul class="social">
						<li><a onClick="openFacebookTrang()"
							class="fab fa-facebook-f" aria-hidden="true"></a></li>
						<li><a
							href="mailto:Trangnttse06081@fpt.edu.vn?subject=Dear Trang"
							class="fab fa-google" aria-hidden="true"></a></li>
					</ul>
				</div>
			</div>

			<div class="col-12 col-sm-6 col-md-4 col-lg-3">
				<div class="our-team">
					<div class="picture">
						<img class="img-fluid"
							src="https://scontent.fhan5-5.fna.fbcdn.net/v/t1.0-0/p206x206/19437549_835172129983266_8144884002029286437_n.jpg?_nc_cat=108&_nc_sid=7aed08&_nc_ohc=RU8VS2Gv0wwAX8Msz6J&_nc_ht=scontent.fhan5-5.fna&_nc_tp=6&oh=7c6ced9bd6a3c7fa5a2d1d8b853287ac&oe=5F594CAC">
					</div>
					<div class="team-content">
						<h3 class="name">Đỗ Anh Hoàng</h3>
						<h4 class="title">Web Developer</h4>
					</div>
					<ul class="social">
						<li><a onClick="openFacebookHoang()"
							class="fab fa-facebook-f" aria-hidden="true"></a></li>
						<li><a
							href="mailto:Hoangdase05956@fpt.edu.vn?subject=Dear Hoàng"
							class="fab fa-google" aria-hidden="true"></a></li>
					</ul>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-md-4 col-lg-3">
				<div class="our-team">
					<div class="picture">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/DucVV.PNG">
					</div>
					<div class="team-content">
						<h3 class="name">Vũ Viết Đức</h3>
						<h4 class="title">Web Developer</h4>
					</div>
					<ul class="social">
						<li><a onClick="openFacebookDuc()" class="fab fa-facebook-f"
							aria-hidden="true"></a></li>
						<li><a href="mailto:ducvvse05830@fpt.edu.vn?subject=Dear Đức"
							class="fab fa-google" aria-hidden="true"></a></li>
					</ul>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-md-4 col-lg-3">
				<div class="our-team">
					<div class="picture">
						<img class="img-fluid"
							src="https://scontent.fhan5-5.fna.fbcdn.net/v/t1.0-9/s960x960/116043771_3275070916052238_4630418638727898909_o.jpg?_nc_cat=101&_nc_sid=85a577&_nc_ohc=M-3EtoDjfEcAX8MzUQt&_nc_ht=scontent.fhan5-5.fna&_nc_tp=7&oh=e01c8ded28d89c3695dd9eb81b18cb20&oe=5F5C0514">
					</div>
					<div class="team-content">
						<h3 class="name">Lê Diệu Ly</h3>
						<h4 class="title">Web Developer</h4>
					</div>
					<ul class="social">
						<li><a onClick="openFacebookLy()" class="fab fa-facebook-f"
							aria-hidden="true"></a></li>
						<li><a href="mailto:Lyldse05303@fpt.edu.vn?subject=Dear Ly"
							class="fab fa-google" aria-hidden="true"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<script>
		function openFacebookLy() {
			window.open(
					'https://www.facebook.com/profile.php?id=100006480854669',
					'_blank');
		}
		function openFacebookHoang() {
			window.open('https://www.facebook.com/harlen7777', '_blank');
		}
		function openFacebookTrang() {
			window.open('https://www.facebook.com/thuytrang.nguyenthi.3158652',
					'_blank');
		}
		function openFacebookDuc() {
			window.open(
					'https://www.facebook.com/profile.php?id=100008776422751',
					'_blank');
		}
	</script>


</div>
<jsp:include page="layout/_footer.jsp"></jsp:include>
