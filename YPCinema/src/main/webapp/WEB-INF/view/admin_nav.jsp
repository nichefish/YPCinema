<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_nav</title>
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
</head>
<body>
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- ---------------------------------------------------------------------------------------------- -->
		<!--사이드바 -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
		<!-- 사이드바 브랜드 -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="main">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3"> YP Admin <sup>2</sup></div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">
			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="index.html"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a>
			</li>
			<!-- Divider -->
			<hr class="sidebar-divider">
			<!-- Heading -->
			<div class="sidebar-heading">Management</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>Product M &nbsp;<small></small></span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Product Management:</h6>
						<a class="collapse-item" href="#">상품등록</a> <a
							class="collapse-item" href="#">상품발주</a> <a class="collapse-item"
							href="#">메뉴등록</a>

					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>관리관리</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Utilities:</h6>
						<a class="collapse-item" href="coupon_addList">Coupons 쿠폰</a> <a
							class="collapse-item" href="utilities-border.html">issued 쿠폰발급</a> <a
							class="collapse-item" href="utilities-animation.html">Animations</a>
						<a class="collapse-item" href="utilities-other.html">Other</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Addons</div>

			<!-- Nav Item - 채용관리 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
					<i class="fas fa-list fa-sm fa-fw"></i><span>Member &nbsp;<small>회원관리</small></span>
				</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Member Management:</h6>
						<a class="collapse-item" href="<c:url value='/member/list' />">List</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div>
			</li>
				
			<!-- Nav Item - 채용관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Staff Process &nbsp;<small>직원관리</small></span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>chart</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="jobList"> <i
					class="fas fa-fw fa-table"></i> <span>영화관 등록하기</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow">
		       						<c:if test="${empty companyAuthInfo && empty authInfo}">
		       							<a href="<c:url value='/login' />" class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size:10px;float:right;">로그인</a>
										<a href="#" class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size:10px;float:right;">고객센터</a>
									</c:if>
									<c:if test="${!empty authInfo || !empty companyAuthInfo}">
										<a href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-right:20px; float:right;">
											<c:if test="${!empty authInfo}">
											<img class="img-profile rounded-circle" src="${authInfo.m_picture }" style="display:inline; width:35px;length:35px;">&nbsp;&nbsp;
											</c:if>
											<c:if test="${!empty companyAuthInfo}">
											<img class="img-profile rounded-circle" src="${companyAuthInfo.c_picture }" style="display:inline; width:35px;length:35px;">&nbsp;&nbsp;
											</c:if>
											<span style="font-size:10px; display:inline-block;" valign="center">
												<c:if test="${authInfo.m_admin eq '0'}"><span style="color:white;">"${authInfo.m_name}"</span></c:if>
												<c:if test="${authInfo.m_admin eq '1'}"><span style="color:#6495ED;">관리자 "${authInfo.m_name}"</span></c:if>
												<c:if test="${authInfo.m_admin eq '2'}"><span style="color:blue;">직원 "${authInfo.m_name}"</span></c:if>
												<c:if test="${!empty companyAuthInfo}"><span style="color:yellow;">"${companyAuthInfo.c_comname}"사 소속</span> <span style="color:white;">"${companyAuthInfo.c_name}"</span></c:if>
												<span style="color:grey;">님 환영합니다.</span><br />
												<c:if test="${(authInfo.m_admin eq '1' || authInfo.m_admin eq '2') && authInfo.mode eq '0'}">	<!-- 관리자/직원 -> 관리자 모드 -->
													&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="[이용자 모드]">
												</c:if>
												<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!--  직원 또는 관리자 -> 이용자 모드 -->
													&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="[관리자 모드]">
												</c:if>
												<c:if test="${!empty authInfo && authInfo.m_admin eq '2' && authInfo.mode ne '0'}">	<!--  직원 또는 관리자 -> 이용자 모드 -->
													&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="[직원 모드]">
												</c:if>
												<c:if test="${empty authInfo && !empty companyAuthInfo}">	<!-- 협력업체 -->
													&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="[협력업체 모드]">
												</c:if>
												&nbsp;<input type="button" value="[로그아웃]">
												<div class="dropdown-menu dropdown-menu-right " aria-labelledby="userDropdown">
													<form action="/YPCinema/changeMode" name="mode_form" id="mode_form" method="post">
													<c:if test="${!empty authInfo && authInfo.m_admin ne '0'}">
													<a class="dropdown-item" href="#" id="mode_btn">
														<!-- 관리자 -> 관리자 모드 -->
														<c:if test="${authInfo.m_admin eq '1' && authInfo.mode eq '0'}">	
														<input type="hidden" name="mode" value="1">
														<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>Settings&nbsp;&nbsp;
														<span style="display:inline"><small>관리자 모드로 변환</small></span>
														</c:if>
														<!-- 직원 -> 직원 모드 -->
														<c:if test="${authInfo.m_admin eq '2' && authInfo.mode eq '0'}">	
														<input type="hidden" name="mode" value="2">
														<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>Settings&nbsp;&nbsp;
														<span style="display:inline"><small>직원 모드로 변환</small></span>
														</c:if>
														<!--  관리자 -> 이용자 모드 -->
														<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	
														<input type="hidden" name="mode" value="0">
														<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>Settings&nbsp;&nbsp;
														<span style="display:inline"><small>이용자 모드로 변환</small></span>
														</c:if>
														<!--  직원 -> 이용자 모드 -->
														<c:if test="${!empty authInfo && authInfo.m_admin eq '2' && authInfo.mode ne '0'}">	
														<input type="hidden" name="mode" value="0">
														<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>Settings&nbsp;&nbsp;
														<span style="display:inline"><small>이용자 모드로 변환</small></span>
														</c:if>
														<!-- 이용자: 없음 -->
													</a>	
													</c:if>
													</form>
													<!-- 일반회원 -->
													<c:if test="${!empty authInfo && empty companyAuthInfo}">	
													<a class="dropdown-item" href="/YPCinema/myPage"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>Profile&nbsp;&nbsp;<small>나의 정보</small></a>
													</c:if>
													<!-- 협력업체 -->
													<c:if test="${empty authInfo && !empty companyAuthInfo}">	
													<a class="dropdown-item" href="/YPCinema/companyMyPage"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>Profile&nbsp;&nbsp;<small>나의 업체정보</small></a>
													</c:if>
													<a class="dropdown-item" href="#"><i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>Service &nbsp;&nbsp;<small>고객센터</small></a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="/YPCinema/logout"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout &nbsp;&nbsp;<small>로그아웃</small></a>
												</div>
											</span>
										</a>
									</c:if>
								</li>

					</ul>

				</nav>
				<!-- End of Topbar -->
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$("#mode_btn").click(function() {
			var test = confirm("관리자/이용자 모드로 전환하시겠습니까?\n(메인 페이지로 이동합니다.)");
			if (test) {
				$("#mode_form").submit();
			}
		});
	});
	</script>
</body>
</html>