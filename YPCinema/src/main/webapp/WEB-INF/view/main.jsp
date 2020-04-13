<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>YPCinema</title>
<link rel="icon" href="img/fvc.jpg">
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
    <div id="preloader">
        <div class="preload-content">
            <div id="world-load"></div>
        </div>
    </div>
	<header class="header-area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="navbar navbar-expand-lg">
						<!-- Logo -->
						<a class="navbar-brand" href="<c:url value='/main' />"><img src="<c:url value='/img/logo_1.png' />" alt="Logo" style="width:160px;"></a>
						<!-- Navbar Toggler -->
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#worldNav" aria-controls="worldNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
						<!-- Navbar -->/
						<div class="collapse navbar-collapse" id="worldNav">
							<ul class="navbar-nav ml-auto">
								<li class="nav-item">
									<c:if test="${(empty authInfo && empty companyAuthInfo) || authInfo.m_admin eq '0' || authInfo.mode eq '0'}">
									<a href="/YPCinema/showtime/list" ><img src="<c:url value='/img/ticket3.png' />" alt="Logo" style="width:50px;">　　</a>
									</c:if>
									<c:if test="${(!empty authInfo || !empty companyAuthInfo) && (!empty authInfo && authInfo.mode ne '0')}">
									<a href="#" ><img src="<c:url value='/img/픽토픽토/4-2.png' />" alt="Logo" style="width:30px;">　　</a>
									</c:if>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영화</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<c:if test="${authInfo.m_admin eq '0' || authInfo.mode eq '0' || empty authInfo}">	<!-- 이용자 및 비로그인 -->
										<a class="dropdown-item" href="<c:url value='/theater/list' />">극장</a>
										<a class="dropdown-item" href="<c:url value='/movie/list' />">영화</a>
										<a class="dropdown-item" href="<c:url value='/showtime/list' />">예매</a>
										<a class="dropdown-item" href="<c:url value='/myStatistic' />">나의 영화관</a>
										</c:if>
										<c:if test="${authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!-- 관리자 -->
										<!-- 관리자 -->
										<a class="dropdown-item" href="<c:url value='/theater/list' />">지점 및 상영관 관리</a>
										<a class="dropdown-item" href="<c:url value='/movie/list' />">영화 관리</a>
										<a class="dropdown-item" href="<c:url value='/showtime/list' />">상영일정 관리</a>
										<a class="dropdown-item" href="<c:url value='/statistic/' />">통계</a>
										</c:if>
										<c:if test="${authInfo.m_admin eq '2' && authInfo.mode ne '0'}">	<!-- 직원 -->
										<!-- 직원-->
										<a class="dropdown-item" href="<c:url value='/theater/list' />">지점 및 상영관 정보</a>
										<a class="dropdown-item" href="<c:url value='/movie/list' />">영화 정보</a>
										<a class="dropdown-item" href="<c:url value='/showtime/list' />">상영일정 정보</a>
										<a class="dropdown-item" href="<c:url value='/showReserve/check' />">결제 및 예매 관리</a>
										</c:if>
									</div>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="<c:url value='/popcorn' />">매점</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="<c:url value='/partner' />">기프트샵</a>
								</li>
								<c:if test="${(authInfo.m_admin eq '1' || authInfo.m_admin eq '2') && authInfo.mode ne '0'}">	<!-- 관리자 -->
								<li class="nav-item">
									<a class="nav-link" href="<c:url value='/jobList' />">직원관리</a>
								</li>
								</c:if>
							</ul>
							<ul class="navbar-nav ml-auto">
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
												<c:if test="${authInfo.m_admin eq '0'}"><span style="color:white;">이용자 "${authInfo.m_name}"</span></c:if>
												<c:if test="${authInfo.m_admin eq '1'}"><span style="color:#6495ED;">관리자 "${authInfo.m_name}"</span></c:if>
												<c:if test="${authInfo.m_admin eq '2'}"><span style="color:blue;">직원 "${authInfo.m_name}"</span></c:if>
												<c:if test="${!empty companyAuthInfo}"><span style="color:yellow;">"${companyAuthInfo.c_comname}"사 소속</span> <span style="color:white;">"${companyAuthInfo.c_name}"</span></c:if>
												<span style="color:grey;">님 환영합니다.</span><br />
												<!-- 이용자 이력서 진척사항 버튼 -->
												<c:if test="${authInfo.m_admin eq '0'}">
													<c:if test="${!empty authInfo.cheyongApply}">
														<input type="button" value="[채용진행중]">
													</c:if>
												</c:if>
												<!-- 관리자/직원 근태 버튼 -->
												<c:if test="${(authInfo.m_admin eq '1' || authInfo.m_admin eq '2')}">
													<c:if test="${empty authInfo.schedule }">
														&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="[퇴근상태]">
													</c:if>
													<c:if test="${!empty authInfo.schedule }">
														<c:if test="${(authInfo.schedule.gnmu_stime eq null || authInfo.schedule.gnmu_stime eq '00:00:00') && authInfo.gnmu.gbunSTime ne '00:00:00'}">
														&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;"><input type="button" value="[출근!요망!!!]"></span>
														</c:if>
														<c:if test="${(authInfo.schedule.gnmu_stime ne null && authInfo.schedule.gnmu_stime ne '00:00:00') && authInfo.gnmu.gbunSTime ne '00:00:00' && authInfo.schedule.gnmu_etime eq null}">
														&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="[근무중...]">
														</c:if>
														<c:if test="${(authInfo.schedule.gnmu_stime ne null && authInfo.schedule.gnmu_stime ne '00:00:00') && (authInfo.gnmu.gbunSTime ne '00:00:00') && (authInfo.schedule.gnmu_etime ne null && authInfo.schedule.gnmu_etime ne '00:00:00')}">
														&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="[퇴근상태]">
														</c:if>
													</c:if>
												</c:if>
												<!-- 모드 버튼 -->
												<c:if test="${(authInfo.m_admin eq '1' || authInfo.m_admin eq '2') && authInfo.mode eq '0'}">	<!-- 관리자/직원 -> 관리자 모드 -->
													&nbsp;<input type="button" value="[이용자 모드]">
												</c:if>
												<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!--  직원 또는 관리자 -> 이용자 모드 -->
													&nbsp;<input type="button" value="[관리자 모드]">
												</c:if>
												<c:if test="${!empty authInfo && authInfo.m_admin eq '2' && authInfo.mode ne '0'}">	<!--  직원 또는 관리자 -> 이용자 모드 -->
													&nbsp;<input type="button" value="[직원 모드]">
												</c:if>
												<c:if test="${empty authInfo && !empty companyAuthInfo}">	<!-- 협력업체 -->
													&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="[협력업체 모드]">
												</c:if>
												&nbsp;<input type="button" value="[로그아웃]">
												<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
													<form action="/YPCinema/changeMode" name="mode_form" id="mode_form" method="post">
													<c:if test="${!empty authInfo && authInfo.m_admin ne '0'}">
													<a class="dropdown-item" href="#" id="mode_btn">
														<!-- 관리자 -> 관리자 모드 -->
														<c:if test="${authInfo.m_admin eq '1' && authInfo.mode eq '0'}">	
														<input type="hidden" name="mode" value="1">
														<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>Settings&nbsp;&nbsp;
														<span style="display:inline"><small>[관리자 모드]로 변환</small></span>
														</c:if>
														<!-- 직원 -> 직원 모드 -->
														<c:if test="${authInfo.m_admin eq '2' && authInfo.mode eq '0'}">	
														<input type="hidden" name="mode" value="2">
														<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>Settings&nbsp;&nbsp;
														<span style="display:inline"><small>[직원 모드]로 변환</small></span>
														</c:if>
														<!--  관리자 -> 이용자 모드 -->
														<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	
														<input type="hidden" name="mode" value="0">
														<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>Settings&nbsp;&nbsp;
														<span style="display:inline"><small>[이용자 모드]로 변환</small></span>
														</c:if>
														<!--  직원 -> 이용자 모드 -->
														<c:if test="${!empty authInfo && authInfo.m_admin eq '2' && authInfo.mode ne '0'}">	
														<input type="hidden" name="mode" value="0">
														<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>Settings&nbsp;&nbsp;
														<span style="display:inline"><small>[이용자 모드]로 변환</small></span>
														</c:if>
														<!-- 이용자: 없음 -->
													</a>	
													</c:if>
													</form>
													<c:if test="${!empty authInfo && authInfo.m_admin ne '0'}">
													<a class="dropdown-item" href="/YPCinema/staff_se"><i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>Service &nbsp;&nbsp;<small>근태 관리</small></a>
													</c:if>
													<!-- 일반회원 -->
													<c:if test="${!empty authInfo && empty companyAuthInfo}">	
													<a class="dropdown-item" href="/YPCinema/mySeries"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>My Series&nbsp;&nbsp;<small>나의 ...</small></a>
													</c:if>
													<!-- 협력업체 -->
													<c:if test="${empty authInfo && !empty companyAuthInfo}">	
													<a class="dropdown-item" href="/YPCinema/companyMyPage"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>Profile&nbsp;&nbsp;<small>나의 업체정보</small></a>
													</c:if>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="/YPCinema/logout"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout &nbsp;&nbsp;<small>로그아웃</small></a>
												</div>
											</span>
										</a>
									</c:if>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
    </header>

    <!-- ********** Hero Area Start ********** -->
    <div class="hero-area">
        <!-- Hero Slides Area -->
        <div class="hero-slides owl-carousel">
            <!-- Single Slide -->
            <div class="single-hero-slide bg-img background-overlay" style="background-image: url(img/blog-img/poster1.jpg);"></div>
            <!-- Single Slide -->
            <div class="single-hero-slide bg-img background-overlay" style="background-image: url(img/blog-img/poster2.jpg);"></div>
        </div>

        <!-- Hero Post Slide -->
        <div class="hero-post-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="hero-post-slide">
                            <!-- Single Slide -->
                            <div class="single-slide d-flex align-items-center">
                                <div class="post-number">
                                    <p>1</p>
                                </div>
                                <div class="post-title">
                                    <a href="single-blog.html">기생충</a>
                                </div>
                            </div>
                            <!-- Single Slide -->
                            <div class="single-slide d-flex align-items-center">
                                <div class="post-number">
                                    <p>2</p>
                                </div>
                                <div class="post-title">
                                    <a href="single-blog.html">곡성</a>
                                </div>
                            </div>
                            <!-- Single Slide -->
                            <div class="single-slide d-flex align-items-center">
                                <div class="post-number">
                                    <p>3</p>
                                </div>
                                <div class="post-title">
                                    <a href="single-blog.html">겨울왕국</a>
                                </div>
                            </div>
                            <!-- Single Slide -->
                            <div class="single-slide d-flex align-items-center">
                                <div class="post-number">
                                    <p>4</p>
                                </div>
                                <div class="post-title">
                                    <a href="single-blog.html">작은아씨들</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ********** Hero Area End ********** -->

    <div class="main-content-wrapper section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <!-- ============= Post Content Area Start ============= -->
                <div class="col-12 col-lg-8">
                 
                        <div class="world-catagory-area mt-50">
                            <ul class="nav nav-tabs" id="myTab2" role="tablist">
                                <li class="title">YP cinema</li>

                                <li class="nav-item">
                                    <a class="nav-link active" id="tab10" data-toggle="tab" href="#world-tab-10" role="tab" aria-controls="world-tab-10" aria-selected="true">YP cinema</a>
                                </li>

              
                            </ul>

                            <div class="tab-content" id="myTabContent2">

                                <div class="tab-pane fade show active" id="world-tab-10" role="tabpanel" aria-labelledby="tab10">
                                    <div class="row">
                                      <div class="col-12 col-md-6">
                                        			

                                                <!-- Single Blog Post -->
                                                <div class="single-blog-post">
                                                    <!-- Post Thumbnail -->
                                                    <div class="post-thumbnail">
                                                        <img src="img/blog-img/poster3.jpg" style="width:400px" alt="">
                                                        <!-- Catagory -->
                                                        <div class="post-cta"><a href="#">곡성</a></div>
                                                    </div>
                                                    <!-- Post Content -->
                                                    <div class="post-content">
                                                        <a href="#" class="headline">
                                                            <h5>곡성</h5>
                                                        </a>
                                                        <p>내가 악마다........... </p>
                                                        <!-- Post Meta -->
                                                    
                                                    </div>
                                                </div>

                                        </div>
                                        <div class="col-12 col-md-6">
                               				<div class="world-catagory-slider owl-carousel wow fadeInUpBig" data-wow-delay="0.1s">

                                                <!-- Single Blog Post -->
                                                <div class="single-blog-post">
                                                    <!-- Post Thumbnail -->
                                                    <div class="post-thumbnail">
                                                        <img src="img/blog-img/popcorn.jpeg" alt="">
                                                        <!-- Catagory -->
                                                        <div class="post-cta"><a href="#">팝콘</a></div>
                                                    </div>
                                                    <!-- Post Content -->
                                                    <div class="post-content">
                                                        <a href="#" class="headline">
                                                            <h5>영화볼땐 팝콘!</h5>
                                                        </a>
                                                        <p>영화와 함꼐 팝콘 어떠세요?? </p>
                                                        <!-- Post Meta -->
                                                    
                                                    </div>
                                                </div>

                                                <!-- Single Blog Post -->
                                                <div class="single-blog-post">
                                                    <!-- Post Thumbnail -->
                                                    <div class="post-thumbnail">
                                                        <img src="img/blog-img/popcorn1.jpeg" alt="">
                                                        <!-- Catagory -->
                                                        <div class="post-cta"><a href="popcorn">매장</a></div>
                                                    </div>
                                                    <!-- Post Content -->
                                                    <div class="post-content">
                                                            <h5>YP양평점 재오픈!!</h5>
                                                        <p>양평점 매점이 새롭게 단장했어요~</p>
                                                    </div>
                                                </div>                                           
                                            </div>
                                        
                                        </div>

                                      

                                        <div class="col-12">
                                            <div class="world-catagory-slider2 owl-carousel wow fadeInUpBig" data-wow-delay="0.4s">
                                                <!-- ========= Single Catagory Slide ========= -->
                                                <div class="single-cata-slide">
                                                    <div class="row">
                                                        <div class="col-12 col-md-6">
                                                            <!-- Single Blog Post -->
                                                            <div class="single-blog-post post-style-2 d-flex align-items-center mb-1">
                                                                <!-- Post Thumbnail -->
                                                                <div class="post-thumbnail">
                                                                    <img src="img/blog-img/b14.jpg" alt="">
                                                                </div>
                                                                <!-- Post Content -->
                                                                <div class="post-content">
                                                                    <a href="#" class="headline">
                                                                        <h5>채용공고</h5>
                                                                    </a>
                                                                    <!-- Post Meta -->
                                                                
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <!-- Single Blog Post -->
                                                            <div class="single-blog-post post-style-2 d-flex align-items-center mb-1">
                                                                <!-- Post Thumbnail -->
                                                                <div class="post-thumbnail">
                                                                    <img src="img/blog-img/b15.jpg" alt="">
                                                                </div>
                                                                <!-- Post Content -->
                                                                <div class="post-content">
                                                                    <a href="#" class="headline">
                                                                        <h5>음료</h5>
                                                                    </a>
                                                                    <!-- Post Meta -->
                                                              
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <!-- Single Blog Post -->
                                                            <div class="single-blog-post post-style-2 d-flex align-items-center mb-1">
                                                                <!-- Post Thumbnail -->
                                                                <div class="post-thumbnail">
                                                                    <img src="img/blog-img/b16.jpg" alt="">
                                                                </div>
                                                                <!-- Post Content -->
                                                                <div class="post-content">
                                                                    <a href="#" class="headline">
                                                                        <h5>채우기3</h5>
                                                                    </a>
                                                                    <!-- Post Meta -->
                                                                
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <!-- Single Blog Post -->
                                                            <div class="single-blog-post post-style-2 d-flex align-items-center mb-1">
                                                                <!-- Post Thumbnail -->
                                                                <div class="post-thumbnail">
                                                                    <img src="img/blog-img/b17.jpg" alt="">
                                                                </div>
                                                                <!-- Post Content -->
                                                                <div class="post-content">
                                                                    <a href="#" class="headline">
                                                                        <h5>채우기4</h5>
                                                                    </a>
                                                                    <!-- Post Meta -->
                                                            
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- ========= Single Catagory Slide ========= -->
                                                <div class="single-cata-slide">
                                                    <div class="row">
                                                        <div class="col-12 col-md-6">
                                                            <!-- Single Blog Post -->
                                                            <div class="single-blog-post post-style-2 d-flex align-items-center mb-1">
                                                                <!-- Post Thumbnail -->
                                                                <div class="post-thumbnail">
                                                                    <img src="img/blog-img/b17.jpg" alt="">
                                                                </div>
                                                                <!-- Post Content -->
                                                                <div class="post-content">
                                                                    <a href="#" class="headline">
                                                                        <h5>채우기5</h5>
                                                                    </a>
                                                                    <!-- Post Meta -->
                                                            
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <!-- Single Blog Post -->
                                                            <div class="single-blog-post post-style-2 d-flex align-items-center mb-1">
                                                                <!-- Post Thumbnail -->
                                                                <div class="post-thumbnail">
                                                                    <img src="img/blog-img/b15.jpg" alt="">
                                                                </div>
                                                                <!-- Post Content -->
                                                                <div class="post-content">
                                                                    <a href="#" class="headline">
                                                                        <h5>채우기6</h5>
                                                                    </a>
                                                                
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <!-- Single Blog Post -->
                                                            <div class="single-blog-post post-style-2 d-flex align-items-center mb-1">
                                                                <!-- Post Thumbnail -->
                                                                <div class="post-thumbnail">
                                                                    <img src="img/blog-img/b14.jpg" alt="">
                                                                </div>
                                                                <!-- Post Content -->
                                                                <div class="post-content">
                                                                    <a href="#" class="headline">
                                                                        <h5>채우기7</h5>
                                                                    </a>
                                                               
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <!-- Single Blog Post -->
                                                            <div class="single-blog-post post-style-2 d-flex align-items-center mb-1">
                                                                <!-- Post Thumbnail -->
                                                                <div class="post-thumbnail">
                                                                    <img src="img/blog-img/b16.jpg" alt="">
                                                                </div>
                                                                <!-- Post Content -->
                                                                <div class="post-content">
                                                                    <a href="#" class="headline">
                                                                        <h5>채우기8</h5>
                                                                    </a>
                                                             
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>

                <!-- ========== Sidebar Area ========== -->
                <div class="col-12 col-md-8 col-lg-4">
                    <div class="post-sidebar-area wow fadeInUpBig" data-wow-delay="0.2s">
             
                        <div class="sidebar-widget-area">
                            <h5 class="title">영화예매차트</h5>
                            <div class="widget-content">
                                <!-- Single Blog Post -->
                                <div class="single-blog-post post-style-2 d-flex align-items-center widget-post" >
                                    <!-- Post Thumbnail -->
                                    <div class="post-thumbnail" style="height:45px">
                                        <img src="img/blog-img/poster2.jpg"  alt="">
                                    </div>
                                    <!-- Post Content -->
                                    <div class="post-content">
                                        <a href="#" class="headline">
                                            <h5 class="mb-0">기생충</h5>
                                        </a>
                                    </div>
                                </div>
                                <!-- Single Blog Post -->
                                <div class="single-blog-post post-style-2 d-flex align-items-center widget-post">
                                    <!-- Post Thumbnail -->
                                    <div class="post-thumbnail" style="height:45px">
                                        <img src="img/blog-img/poster3.jpg" alt="">
                                    </div>
                                    <!-- Post Content -->
                                    <div class="post-content">
                                        <a href="#" class="headline">
                                            <h5 class="mb-0">곡성</h5>
                                        </a>
                                    </div>
                                </div>
                                <!-- Single Blog Post -->
                                <div class="single-blog-post post-style-2 d-flex align-items-center widget-post">
                                    <!-- Post Thumbnail -->
                                    <div class="post-thumbnail"  style="height:45px">
                                        <img src="img/blog-img/goods.jpg" alt="">
                                    </div>
                                    <!-- Post Content -->
                                    <div class="post-content">
                                        <a href="#" class="headline">
                                            <h5 class="mb-0">겨울왕국</h5>
                                        </a>
                                    </div>
                                </div>
                                <!-- Single Blog Post -->
                                <div class="single-blog-post post-style-2 d-flex align-items-center widget-post">
                                    <!-- Post Thumbnail -->
                                    <div class="post-thumbnail"  style="height:45px">
                                        <img src="img/blog-img/poster4.jpg" alt="">
                                    </div>
                                    <!-- Post Content -->
                                    <div class="post-content">
                                        <a href="#" class="headline">
                                            <h5 class="mb-0">작은아씨들</h5>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
						<div class="sidebar-widget-area">
                            <h5 class="title">YP cinema</h5>
                            <div class="widget-content">
                                <p>YP씨네마는 2020년 3월에 오픈한 신규 영화관입니다. 지점으로는 양평점, 홍대점이 있으며  5월에 제주점, 영등포점을 오픈 예정입니다.</p>
                            </div>
						</div>
					</div>
				</div>
            </div>

            <div class="row justify-content-center">
                <!-- ========== Single Blog Post ========== -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-blog-post post-style-3 mt-50 wow fadeInUpBig" data-wow-delay="0.2s">
                        <!-- Post Thumbnail -->
                        <div class="post-thumbnail">
                            <img src="img/blog-img/b4.jpg" alt="">
                            <!-- Post Content -->
                            <div class="post-content d-flex align-items-center justify-content-between">
                                <!-- Catagory -->
                                <div class="post-tag"><a href="staff_postList">YP시네마 채용</a></div>
                                <!-- Headline -->
                                <a href="staff_postList" class="headline">
                                    <h5>YPCinama에서 당신의 능력을 펼쳐보세요.</h5>
                                </a>
                             
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ========== Single Blog Post ========== -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-blog-post post-style-3 mt-50 wow fadeInUpBig" data-wow-delay="0.4s" style="height:200px">
                        <!-- Post Thumbnail -->
                        <div class="post-thumbnail">
                            <img src="img/blog-img/poster2.jpg" alt="">
                            <!-- Post Content -->
                            <div class="post-content d-flex align-items-center justify-content-between">
                                <!-- Catagory -->
                                <div class="post-tag"><a href="#">기생충</a></div>
                                <!-- Headline -->
                                <a href="#" class="headline">
                                    <h5>1000만 관객 돌파!</h5>
                                </a>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ========== Single Blog Post ========== -->
                <div class="col-12 col-md-6 col-lg-4" >
                    <div class="single-blog-post post-style-3 mt-50 wow fadeInUpBig" data-wow-delay="0.6s" >
                        <!-- Post Thumbnail -->
                        <div class="post-thumbnail" >
                            <img src="img/blog-img/goods.jpg" alt="">
                            <!-- Post Content -->
                            <div class="post-content d-flex align-items-center justify-content-between" >
                                <!-- Catagory -->
                                <div class="post-tag"><a href="#">겨울왕국</a></div>
                                <!-- Headline -->
                                <a href="#" class="headline">
                                    <h5>Do you want a build a snowman?</h5>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<footer class="footer-area">
	<%@ include file="footer.jsp" %>
</footer>

<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/active.js"></script>
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