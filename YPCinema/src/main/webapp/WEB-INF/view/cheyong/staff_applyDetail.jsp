<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>YPCinema</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/fvc.jpg">

    <!-- Style CSS -->
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
		<%@ include file="../navigation.jsp" %>
    </header>
   

    <!-- ********** Hero Area Start ********** -->
    <div class="hero-area height-400 bg-img background-overlay" style="background-image: url(img/blog-img/bg4.jpg);"></div>
    <!-- ********** Hero Area End ********** -->
	
    <section class="contact-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Contact Form Area -->
                <div class="col-12 col-md-10 col-lg-8">
                <form id="gggg" action="changeJinhyeng">
                    <div class="contact-form" style="height:1500px;width:900px;margin-left:-50px;text-align:center;">
                    	<input type="hidden" name="hiddenRNum" id="hiddenRNum" value="${selectApplyOne.r_num}">
                    	<h6>${selectApplyOne.r_num}</h6>
                    	<h6>- ${selectApplyOne.r_hijijom} -</h6>
                        <h3><strong>채용 지원서 &nbsp;[${selectApplyOne.r_jin}]</strong></h3>
                        <!-- Contact Form -->
                            <div class="row">
                                <div class="col-12 col-md-6" style="font-size:10px;text-align:left;">
                                			<input type="hidden" name="Hm_num" id="Hm_num" value="${mdto.m_num}">
											<input type="hidden" name="Hjic_num" id="Hjic_num" value="15">
											<input type="hidden" name="Htheater_name" id="Htheater_name" value="${selectApplyOne.r_hijijom}">
											<input type="hidden" name="r_num" id="r_num" value="${selectApplyOne.r_num}">
											<input type="hidden" name="r_jin" id="r_jin" value="${selectApplyOne.r_jin}">
                                	<input type="hidden" name="hiddenIdNum" id="hiddenIdNum" value="${mdto.m_num}">
                                	지원날짜 : <fmt:formatDate value='${selectApplyOne.r_nalja}' type='date' pattern='yyyy년 MM월 dd일' />
                                	<p style="color:red;font-size:5px;">([열람] 이후  수정 및 삭제가 불가능합니다.)</p>
                                </div>
                                <br />
								<table class="table table-bordered" id="dataTable" cellspacing="0" >
									<tr>
										<th>성명</th>
										<td>${mdto.m_name}</td>
										<th>생년월일</th>
										<td><fmt:formatDate value='${mdto.m_birth}' type='date' pattern='yyyy년 MM월 dd일' /></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td colspan="3">${mdto.m_email}</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td>${mdto.m_ph}</td>
										<th>성별</th>
										<c:if test="${mdto.m_gen eq 'F'}"><td>여자</td></c:if>
										<c:if test="${mdto.m_gen eq 'M'}"><td>남자</td></c:if>	
									</tr>
									<tr>
										<th>현주소</th>
										<td colspan="3">(${mdto.m_zip}) ${mdto.m_addr1} / ${mdto.m_addr2}</td>
									</tr>
									<tr>
										<th rowspan="2" style="text-align:center;">근무가능</th>
										<th>요일</th>
										<th colspan="2">시간</th>
									</tr>
									<tr>
										<td>${selectApplyOne.r_gadate}</td>
										<td colspan="2">${selectApplyOne.r_time}</td>
									</tr>
									<tr>
										<th>장애유무</th>
										<td>${selectApplyOne.r_dis}</td>
										<th>보훈대상</th>
										<td>${selectApplyOne.r_price}</td>
									</tr>
									<tr>
										<th>경력사항</th>
										<td colspan="3">${selectApplyOne.r_career}</td>
									</tr>
									<tr>
										<th>성격의 장단점</th>
										<td colspan="3">${selectApplyOne.r_per}</td>
									</tr>
									<tr>
										<th>지원동기 및 포부</th>
										<td colspan="3">${selectApplyOne.r_jiwon}</td>
									</tr>
									
									<c:if test="${selectApplyOne.r_jin eq '합격목걸이' && m_admin eq '2'}">
									<tr>
										<td colspan="4">
											<input type="button" value="근로계약서 작성하기" style="width:300px;height:50px;"onclick="location.href='staff_writeContract?m_num=${mdto.m_num}&r_num=${selectApplyOne.r_num}'">
										</td>
									</tr>
									</c:if>
									
								</table>
									
								<div id=zmzmr style="margin-top:20px;float:left;">
								<c:if test="${selectApplyOne.r_jin eq '열람대기중'}">
									<input type="submit" value="수정" formaction="staff_applyModify">
									<input type="submit" value="삭제" formaction="staff_applyDelete">
								</c:if>
								<c:if test="${m_admin eq '0'}">
								<input type="button" value="목록으로" onclick="location.href='member_myApply'">
								</c:if>
								<c:if test="${m_admin eq '1'}">
								<input type="button" value="목록으로" onclick="location.href='staff_applyList'">
								</c:if>
								<c:if test="${m_admin eq '1'}">
									<select name="jinhyeng" id="jinhyeng">
										<option value="">-----</option>
										<c:if test="${selectApplyOne.r_jin eq '열람'}">
											<option value="면접중">면접중</option>
										</c:if>
										<c:if test="${selectApplyOne.r_jin eq '면접중'}">
											<option value="합격목걸이">합격목걸이</option>
											<option value="불합격">불합격</option>
										</c:if>
										<c:if test="${selectApplyOne.r_jin eq '불합격'}">
											<option value="면접중">불합격취소</option>
										</c:if>
										<c:if test="${selectApplyOne.r_jin eq '합격목걸이'}">
											<option value="면접중">합격취소</option>
										</c:if>
									</select>	
								</c:if>
								</div>
								</div>
								</div>
								<input type="submit" id="gggg" style="width:150px; height:43px; cursor:hand; opacity:0;">
								</form>
                            
                            
                    	
                    </div>
                </div>
                     </div>
 
</section>

    <!-- Google Maps: If you want to google map, just uncomment below codes -->
    <!--
    <div class="map-area">
        <div id="googleMap" class="googleMap"></div>
    </div>
    -->

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
                            <li><a href="#">Fashion</a></li>
                            <li><a href="#">Lifestyle</a></li>
                            <li><a href="#">Contact</a></li>
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
    <!-- Google Maps: If you want to google map, just uncomment below codes -->
    <!--
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwuyLRa1uKNtbgx6xAJVmWy-zADgegA2s"></script>
    <script src="js/map-active.js"></script>
    -->
<script type="text/javascript">
$(function(){
	$("#jinhyeng").change(function(){
		var a = $("#jinhyeng").val();
		$("#r_jin").val(a);
		$("#gggg").submit();
	});
});
</script>
</body>
</html>