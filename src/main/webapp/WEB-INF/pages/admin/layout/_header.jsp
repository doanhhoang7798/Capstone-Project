<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
	<meta charset="utf-8" />
	<title>Admin</title>
	<link type="text/css" href="${pageContext.request.contextPath}/resources/css/app.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" language="javascript"
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript"
		src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" language="javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script type="text/javascript" language="javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
	<script type="text/javascript" language="javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script type="text/javascript" language="javascript"
		src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css">

	<script type="text/javascript">
		$(document).ready(function () {
			$('#example').DataTable({
				dom: 'Bfrtip',
				buttons: ['copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5']
			});
		});


	</script>


	<style>
		#example_wrapper {
			width: 100% !important;
		}

		#hideMe {
			-webkit-animation: cssAnimation 5s forwards;
			animation: cssAnimation 5s forwards;
		}

		@keyframes cssAnimation {
			0% {
				opacity: 1;
			}

			90% {
				opacity: 1;
			}

			100% {
				opacity: 0;
			}
		}

		@-webkit-keyframes cssAnimation {
			0% {
				opacity: 1;
			}

			90% {
				opacity: 1;
			}

			100% {
				opacity: 0;
			}
		}
	</style>
	
</head>

<body class="layout-default has-drawer-opened" style="height: 100%;">
	<div class="mdk-drawer-layout js-mdk-drawer-layout" data-push="" data-responsive-width="992px" data-fullbleed=""
		data-domfactory-upgraded="mdk-drawer-layout">
		<div class="mdk-drawer-layout__content" style="transform: translate3d(0px, 0px, 0px);">
			<!-- Header Layout -->
			<div class="mdk-header-layout js-mdk-header-layout" data-has-scrolling-region=""
				data-domfactory-upgraded="mdk-header-layout">
				<!-- Header -->

				<div id="header" class="mdk-header js-mdk-header m-0" data-fixed="" data-effects="waterfall"
					data-domfactory-upgraded="mdk-header" style="padding-top: 60px;">
					<div class="mdk-header__bg">
						<div class="mdk-header__bg-front"></div>
						<div class="mdk-header__bg-rear"></div>
					</div>
					<div class="mdk-header__content">
						<div class="navbar navbar-expand-sm navbar-main pl-md-0 pr-0 navbar-light bg-white mdk-header--fixed mdk-header--shadow"
							id="navbar" data-primary="data-primary">
							<div class="container-fluid page__container pr-0">
								<!-- Navbar toggler -->
								<button class="navbar-toggler navbar-toggler-custom d-lg-none d-flex mr-navbar"
									type="button" data-toggle="sidebar">
									<span class="material-icons icon-14pt">menu</span>
								</button>

								<div class="navbar-collapse collapse" id="navbarsExample03">
									<ul class="nav navbar-nav">

										<li class="nav-item "><a href="${pageContext.request.contextPath}/admin/Dashboard" class="nav-link ">Dashboard</a>
										</li>


									</ul>
								</div>							
			
								<div class="dropdown" style="margin-right: 8%; background-color: #c33">
									<a href="${pageContext.request.contextPath}/admin/post-create" class="btn btn-success ml-auto"><i
								class="material-icons">add</i>Viết bài</a>
								</div>
							</div>
						</div>
					</div>
				</div>