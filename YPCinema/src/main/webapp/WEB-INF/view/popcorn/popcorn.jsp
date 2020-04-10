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

    <!-- Title  -->
    <title>YPcinema</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css1/magnific-popup.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
      
</head>
<body>
 
    <div id="preloader">
        <div class="preload-content">
            <div id="world-load"></div>
        </div>
    </div>
  
    <!-- ***** Header Area Start ***** -->
    <header class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-lg">
                        <!-- Logo -->
                        <a class="navbar-brand" href="<c:url value='/main' />"><img src="<c:url value='/img/logo_1.png' />" alt="Logo" style="width:160px;"></a>
                        <!-- Navbar Toggler -->
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#worldNav" aria-controls="worldNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <!-- Navbar -->
                        <div class="collapse navbar-collapse" id="worldNav">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
									<c:if test="${(empty authInfo && empty companyAuthInfo) || authInfo.m_admin eq '0' || authInfo.mode eq '0'}">
									<a href="/YPCinema/showtime/list" ><img src="<c:url value='/img/ticket3.png' />" alt="Logo" style="width:50px;">　　</a>
									</c:if>
									<c:if test="${!empty companyAuthInfo || (!empty authInfo && authInfo.m_admin ne '0' && authInfo.mode ne '0')}">
									<a href="#" ><img src="<c:url value='/img/픽토픽토/4-2.png' />" alt="Logo" style="width:29px;">　　</a>
									</c:if>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영화</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<c:if test="${authInfo.m_admin eq '0' || authInfo.mode eq '0' || empty authInfo}">	<!-- 이용자 및 비로그인 -->
										<a class="dropdown-item" href="<c:url value='/theater/list' />">극장</a>
										<a class="dropdown-item" href="<c:url value='/movie/list' />">영화</a>
										<a class="dropdown-item" href="<c:url value='/showtime/list' />">예매</a>
										<a class="dropdown-item" href="<c:url value='/statistic' />">나의 영화관</a>
										</c:if>
										<c:if test="${authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!-- 관리자 -->
										<!-- 관리자 -->
										<a class="dropdown-item" href="<c:url value='/theater/list' />">지점 및 상영관 관리</a>
										<a class="dropdown-item" href="<c:url value='/movie/list' />">영화 관리</a>
										<a class="dropdown-item" href="<c:url value='/showtime/list' />">상영일정 관리</a>
										<a class="dropdown-item" href="<c:url value='/myStatistic/' />">통계</a>
										</c:if>
										<c:if test="${authInfo.m_admin eq '2' && authInfo.mode ne '0'}">	<!-- 직원 -->
										<!-- 직원-->
										<a class="dropdown-item" href="<c:url value='/theater/list' />">지점 및 상영관 정보</a>
										<a class="dropdown-item" href="<c:url value='/movie/list' />">영화 정보</a>
										<a class="dropdown-item" href="<c:url value='/showtime/list' />">상영일정 정보</a>
										<a class="dropdown-item" href="<c:url value='/payment/list' />">결제 및 예매 관리</a>
										</c:if>
									</div>
								</li>
                   				<li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="popcorn" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">매점</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="goodsUp">상품등록</a>
                                        <a class="dropdown-item" href="menu">메뉴등록</a>
                                        <a class="dropdown-item" href="goodsList">상품리스트(수정,삭제)</a>
                                        <a class="dropdown-item" href="menuList">메뉴리스트(수정,삭제)</a>
                                       
                                    </div>
                                </li >
                                <li class="nav-item">
									<a class="nav-link" href="<c:url value='/jobList' />">직원관리</a>
								</li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">주차</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">협력업체</a>
                                </li>
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

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->

    <!-- ********** Hero Area Start ********** -->
    <div class="hero-area">

        <!-- Hero Slides Area -->
        <div class="hero-slides owl-carousel">
            <!-- Single Slide -->
            <div class="single-hero-slide bg-img background-overlay" style="background-image: url(img/blog-img/popcorn.jpeg);"></div>
            <!-- Single Slide -->
            <div class="single-hero-slide bg-img background-overlay" style="background-image: url(img/blog-img/popcorn1.jpeg);"></div>
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
                                    <a href="single-blog.html">YP 콤보</a>
                                </div>
                            </div>
                            <!-- Single Slide -->
                            <div class="single-slide d-flex align-items-center">
                                <div class="post-number">
                                    <p>2</p>
                                </div>
                                <div class="post-title">
                                    <a href="single-blog.html">달콤팝콘</a>
                                </div>
                            </div>
                            <!-- Single Slide -->
                            <div class="single-slide d-flex align-items-center">
                                <div class="post-number">
                                    <p>3</p>
                                </div>
                                <div class="post-title">
                                    <a href="single-blog.html">치즈팝콘</a>
                                </div>
                            </div>
                            <!-- Single Slide -->
                            <div class="single-slide d-flex align-items-center">
                                <div class="post-number">
                                    <p>4</p>
                                </div>
                                <div class="post-title">
                                    <a href="single-blog.html">YP나쵸세트</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ********** Hero Area End ********** -->

    <div class="main-content-wrapper section-padding-100" style="width:1200px">
        <div class="container">
            <div class="row justify-content-center">
                <!-- ============= Post Content Area Start ============= -->
                <div class="col-12 col-lg-8">
                    <div class="post-content-area mb-50">
                        <!-- Catagory Area -->
                        <div class="world-catagory-area">
                            <ul class="nav nav-tabs" id="myTab" role="tablist" style="width:1010px">
                                <li class="title">YP cinema</li>

                                <li class="nav-item">
                                 <input type = "button"  class="nav-link active" id="All" value="Main" onclick="location.href='popcorn'">
                                </li>
                                <li class="nav-item">
                                  <input type = "button"  class="nav-link active" id="combobutton" value="콤보">
                                </li>

                                <li class="nav-item">
                                   <input type = "button"  class="nav-link active" id="popcornbutton" value="팝콘">
                                </li>

                                <li class="nav-item">
                                    <input type = "button"  class="nav-link active" id="beverage" value="음료">
                                </li>

                                <li class="nav-item">
                                   <input type = "button"  class="nav-link active" id="snack" value="스낵">
                                </li>

                                <li class="nav-item">
                                   <input type = "button"  class="nav-link active" id="bbokki" value="떡볶이">
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent" style="width:1000px">
							<div id="buttonResult">

                                <div class="tab-pane fade show active" id="world-tab-1" role="tabpanel" aria-labelledby="tab1">
                                    <div class="row">
                                        <div class="col-12 col-md-6" >
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

                                        <div class="col-12 col-md-6">
                                            <!-- Single Blog Post -->
                                         <div class="single-blog-post post-style-2 d-flex align-items-center">
                                                <!-- Post Thumbnail -->
                                            <div class="post-thumbnail">
                                                    <img src="img/blog-img/popcorn1.jpg" alt="">
                                                </div>
                                                <!-- Post Content -->
                                               <div class="post-content">
                                                    <a href="menuDetail?num=54" class="headline">
                                                        <h5>고소팝콘(L)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;5000원</h5>
                                                    </a>
                                                    <!-- Post Meta -->
                                                  <div class="post-meta">
                                                        <p> <a href="menuDetail?num=54" class="post-date"><h5>옥수수 본연의 맛. 짭짜름한 클래식 고소팝콘!</h5></a></p>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Single Blog Post -->
                                           <div class="single-blog-post post-style-2 d-flex align-items-center">
                                                <!-- Post Thumbnail -->
                                            <div class="post-thumbnail">
                                                    <img src="img/blog-img/popcorn1.jpg" alt="">
                                                </div>
                                                <!-- Post Content -->
                                               <div class="post-content">
                                                    <a href="menuDetail?num=54" class="headline">
                                                        <h5>고소팝콘(L)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;5000원</h5>
                                                    </a>
                                                    <!-- Post Meta -->
                                                  <div class="post-meta">
                                                        <p> <a href="menuDetail?num=54" class="post-date"><h5>옥수수 본연의 맛. 짭짜름한 클래식 고소팝콘!</h5></a></p>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Single Blog Post -->
                                            <div class="single-blog-post post-style-2 d-flex align-items-center">
                                                <!-- Post Thumbnail -->
                                            <div class="post-thumbnail">
                                                    <img src="img/blog-img/popcorn1.jpg" alt="">
                                                </div>
                                                <!-- Post Content -->
                                               <div class="post-content">
                                                    <a href="menuDetail?num=54" class="headline">
                                                        <h5>고소팝콘(L)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;5000원</h5>
                                                    </a>
                                                    <!-- Post Meta -->
                                                  <div class="post-meta">
                                                        <p> <a href="menuDetail?num=54" class="post-date"><h5>옥수수 본연의 맛. 짭짜름한 클래식 고소팝콘!</h5></a></p>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Single Blog Post -->
                                          <div class="single-blog-post post-style-2 d-flex align-items-center">
                                                <!-- Post Thumbnail -->
                                            <div class="post-thumbnail">
                                                    <img src="img/blog-img/popcorn1.jpg" alt="">
                                                </div>
                                                <!-- Post Content -->
                                               <div class="post-content">
                                                    <a href="menuDetail?num=54" class="headline">
                                                        <h5>고소팝콘(L)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;5000원</h5>
                                                    </a>
                                                    <!-- Post Meta -->
                                                  <div class="post-meta">
                                                        <p> <a href="menuDetail?num=54" class="post-date"><h5>옥수수 본연의 맛. 짭짜름한 클래식 고소팝콘!</h5></a></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade"  >
                                    <div class="row">
                                        <div class="col-12 col-md-6">
                            
                                        </div>

                                        <div class="col-12 col-md-6">
                                      
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

 <footer class="footer-area">
		<%@ include file="../footer.jsp"%>
	</footer>
 
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

	<script type="text/javascript">
	$(function() {
		$("#mode_btn").click(function() {
			var test = confirm("관리자/이용자 모드로 전환하시겠습니까?\n(메인 페이지로 이동합니다.");
			if (test) {
				$("#mode_form").submit();
			}
		})
	});
	</script>
</body>
</html>