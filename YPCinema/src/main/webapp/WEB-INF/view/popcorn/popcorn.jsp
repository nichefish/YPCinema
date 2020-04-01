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
                                        <a class="dropdown-item" href="menutype?type=all">메뉴분류하기 ㅠㅠ</a>
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
<!--                             Search Form  -->
<!--                             <div id="search-wrapper"> -->
<!--                                 <form action="#"> -->
<!--                                     <input type="text" id="search" placeholder="Search something..."> -->
<!--                                     <div id="close-icon"></div> -->
<!--                                     <input class="d-none" type="submit" value=""> -->
<!--                                 </form> -->
<!--                             </div> -->
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
                            <ul class="nav nav-tabs" id="myTab" role="tablist" style="width:930px">
                                <li class="title">YP cinema</li>

                                <li class="nav-item">
                                    <a class="nav-link active" id="tab1" data-toggle="tab" href="#world-tab-1" role="tab" aria-controls="world-tab-1" aria-selected="true">All</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="tab2" data-toggle="tab" href="#world-tab-2" role="tab" aria-controls="world-tab-2" aria-selected="false">콤보</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="tab3" data-toggle="tab" href="#world-tab-3" role="tab" aria-controls="world-tab-3" aria-selected="false">팝콘</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="tab4" data-toggle="tab" href="#world-tab-4" role="tab" aria-controls="world-tab-4" aria-selected="false">음료</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="tab5" data-toggle="tab" href="#world-tab-5" role="tab" aria-controls="world-tab-5" aria-selected="false">스낵</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="tab6" data-toggle="tab" href="#world-tab-6" role="tab" aria-controls="world-tab-6" aria-selected="false">떡볶이</a>
                                </li>
                            </ul>

                            <div class="tab-content" id="myTabContent" style="width:1000px">

                                <div class="tab-pane fade show active" id="world-tab-1" role="tabpanel" aria-labelledby="tab1">
                                    <div class="row">
                                        <div class="col-12 col-md-6">
                                            <div class="world-catagory-slider owl-carousel wow fadeInUpBig" data-wow-delay="0.1s">

                                                <!-- Single Blog Post -->
                                                <div class="single-blog-post">
                                                    <!-- Post Thumbnail -->
                                                    <div class="post-thumbnail">
                                                        <img src="img/blog-img/b1.jpg" alt="">
                                                        <!-- Catagory -->
                                                        <div class="post-cta"><a href="#">YP콤보</a></div>
                                                    </div>
                                                    <!-- Post Content -->
                                                    <div class="post-content">
                                                        <a href="#" class="headline">
                                                            <h5>BEST 1위</h5>
                                                        </a>
                                                        <p>영화와 함꼐 YP콤보를 즐겨보세요! </p>
                                                        <!-- Post Meta -->
                                                        <div class="post-meta">
                                                            <p><a href="#" class="post-author"></a> <a href="#" class="post-date"></a></p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Single Blog Post -->
                                                <div class="single-blog-post">
                                                    <!-- Post Thumbnail -->
                                                    <div class="post-thumbnail">
                                                        <img src="img/blog-img/b2.jpg" alt="">
                                                        <!-- Catagory -->
                                                        <div class="post-cta"><a href="popcorn">매점</a></div>
                                                    </div>
                                                    <!-- Post Content -->
                                                    <div class="post-content">
                                                        <a href="#" class="headline">
                                                            <h5>YGV콤보</h5>
                                                        </a>
                                                        <p>영화와 함께 콤보를 즐겨보세요~</p>
                                                        <!-- Post Meta -->
                                                        <div class="post-meta">
                                                            <p><a href="#" class="post-author">팝콘</a> @ <a href="#" class="post-date">YP씨네마 홍대점</a></p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Single Blog Post -->
                                                <div class="single-blog-post">
                                                    <!-- Post Thumbnail -->
                                                    <div class="post-thumbnail">
                                                        <img src="img/blog-img/b3.jpg" alt="">
                                                        <!-- Catagory -->
                                                        <div class="post-cta"><a href="#">채용</a></div>
                                                    </div>
                                                    <!-- Post Content -->
                                                    <div class="post-content">
                                                        <a href="#" class="headline">
                                                            <h5>YP씨네와 함께하시겠습니까?</h5>
                                                        </a>
                                                        <p>YP씨네마 채용</p>
                                                        <!-- Post Meta -->
                                                        <div class="post-meta">
                                                            <p><a href="#" class="post-author">채용팀</a> on <a href="#" class="post-date">YP씨네마 건대점</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12 col-md-6">
                                            <!-- Single Blog Post -->
                                            <div class="single-blog-post post-style-2 d-flex align-items-center wow fadeInUpBig" data-wow-delay="0.2s">
                                                <!-- Post Thumbnail -->
                                                <div class="post-thumbnail">
                                                    <img src="img/blog-img/b10.jpg" alt="">
                                                </div>
                                                <!-- Post Content -->
                                                <div class="post-content">
                                                    <a href="#" class="headline">
                                                        <h5>BEST1위</h5>
                                                    </a>
                                                    <!-- Post Meta -->
                                                    <div class="post-meta">
                                                        <p><a href="#" class="post-author">YP콤보</a> <a href="#" class="post-date">5000원</a></p>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Single Blog Post -->
                                            <div class="single-blog-post post-style-2 d-flex align-items-center wow fadeInUpBig" data-wow-delay="0.3s">
                                                <!-- Post Thumbnail -->
                                                <div class="post-thumbnail">
                                                    <img src="img/blog-img/b11.jpg" alt="">
                                                </div>
                                                <!-- Post Content -->
                                                <div class="post-content">
                                                    <a href="#" class="headline">
                                                        <h5>콜라</h5>
                                                    </a>
                                                    <!-- Post Meta -->
                                                    <div class="post-meta">
                                                        <p><a href="#" class="post-author">Katy Liu</a> on <a href="#" class="post-date">Sep 29, 2017 at 9:48 am</a></p>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Single Blog Post -->
                                            <div class="single-blog-post post-style-2 d-flex align-items-center wow fadeInUpBig" data-wow-delay="0.4s">
                                                <!-- Post Thumbnail -->
                                                <div class="post-thumbnail">
                                                    <img src="img/blog-img/b12.jpg" alt="">
                                                </div>
                                                <!-- Post Content -->
                                                <div class="post-content">
                                                    <a href="#" class="headline">
                                                        <h5>나쵸</h5>
                                                    </a>
                                                    <!-- Post Meta -->
                                                    <div class="post-meta">
                                                        <p><a href="#" class="post-author">Katy Liu</a> on <a href="#" class="post-date">Sep 29, 2017 at 9:48 am</a></p>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Single Blog Post -->
                                            <div class="single-blog-post post-style-2 d-flex align-items-center wow fadeInUpBig" data-wow-delay="0.5s">
                                                <!-- Post Thumbnail -->
                                                <div class="post-thumbnail">
                                                    <img src="img/blog-img/b13.jpg" alt="">
                                                </div>
                                                <!-- Post Content -->
                                                <div class="post-content">
                                                    <a href="#" class="headline">
                                                        <h5>에이드</h5>
                                                    </a>
                                                    <!-- Post Meta -->
                                                    <div class="post-meta">
                                                        <p><a href="#" class="post-author">Katy Liu</a> on <a href="#" class="post-date">Sep 29, 2017 at 9:48 am</a></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="world-tab-2" role="tabpanel" aria-labelledby="tab2">
                                    <div class="row">
                                        <div class="col-12 col-md-6">
                                            <!-- Single Blog Post -->
                                     
                                          
                                       
                                         
                                                
                                        </div>

                                        <div class="col-12 col-md-6">
                                            <!-- Single Blog Post -->
                                         

                                            <!-- Single Blog Post -->
                                   

                                            <!-- Single Blog Post -->
                                       

                                            <!-- Single Blog Post -->
                                 
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="world-tab-3" role="tabpanel" aria-labelledby="tab3">
                                    <div class="row">
                                        <div class="col-12 col-md-6">
                                            <!-- Single Blog Post -->
                                
                                        
                                           
                                       
                                        </div>

                                        <div class="col-12 col-md-6">
                                            <!-- Single Blog Post -->
                                    

                                            <!-- Single Blog Post -->
                                
                                            <!-- Single Blog Post -->
                                   

                                            <!-- Single Blog Post -->
                                       
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="world-tab-4" role="tabpanel" aria-labelledby="tab4">
                                    <div class="row">
                                        <div class="col-12 col-md-6">
                                            <!-- Single Blog Post -->
                                      
                                        </div>

                                        <div class="col-12 col-md-6">
                                            <!-- Single Blog Post -->
                                 

                                            <!-- Single Blog Post -->
                                       

                                            <!-- Single Blog Post -->
                                  

                                            <!-- Single Blog Post -->
                                       
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="world-tab-5" role="tabpanel" aria-labelledby="tab5">
                                    <div class="row">
                                        <div class="col-12 col-md-6">
                                            <!-- Single Blog Post -->
                                        
                                        </div>

                                        <div class="col-12 col-md-6">
                                            <!-- Single Blog Post -->
                                    

                                            <!-- Single Blog Post -->
                                        

                                            <!-- Single Blog Post -->
                                    

                                            <!-- Single Blog Post -->
                                     
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="world-tab-6" role="tabpanel" aria-labelledby="tab6">
                                    <div class="row">
                                        <div class="col-12 col-md-6">
                                            <!-- Single Blog Post -->
                                         
                                        </div>

                                        <div class="col-12 col-md-6">
                                            <!-- Single Blog Post -->
                                        

                                            <!-- Single Blog Post -->
                                          

                                            <!-- Single Blog Post -->
                                       

                                            <!-- Single Blog Post -->
                                      
                                        </div>
                                    </div>
                                </div>

                     
                     
                            
                            </div>
                        </div>

                        
               

                    </div>
                </div>

    
           
                </div>
            </div>

         

            <!-- Load More btn -->
            <div class="row">
                <div class="col-12">
                    <div class="load-more-btn mt-50 text-center">
                        <a href="#" class="btn world-btn">Load More</a>
                    </div>
                </div>
            </div>
        </div>


    <!-- ***** Footer Area Start ***** -->
    <footer class="footer-area">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-4">
                    <div class="footer-single-widget">
                        <a href="#"><img src="img/core-img/logo.png" alt=""></a>
                        <div class="copywrite-text mt-30">
                            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="footer-single-widget">
                        <ul class="footer-menu d-flex justify-content-between">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">영화예매</a></li>
                            <li><a href="popcorn">매점</a></li>
                            <li><a href="#">오시는 길</a></li>
                            <li><a href="#">Gadgets</a></li>
                            <li><a href="#">Video</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="footer-single-widget">
                        <h5>Subscribe</h5>
                        <form action="#" method="post">
                            <input type="email" name="email" id="email" placeholder="Enter your mail">
                            <button type="button"><i class="fa fa-arrow-right"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ***** Footer Area End ***** -->

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