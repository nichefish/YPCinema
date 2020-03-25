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
    <title>YPcinema - Blog &amp; Magazine Template</title>

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
                    <div class="contact-form" style="height:1500px;width:900px;margin-left:-50px;">
                        <h3><strong>지원서</strong></h3>
                        <!-- Contact Form -->
                            <div class="row">
                                <div class="col-12 col-md-6" style="font-size:10px; color:red;">
                                 	※주의사항※ 장난으로 내면 디진다.
                                </div>
                                <br />
                                <form:form method="post" commandName="gonggoCommand">
								<table class="table table-bordered" id="dataTable" cellspacing="0" style="width:700px;" frame="void">
									<tr>
										<td>이름 :</td>
										<td>회원이름 등장!</td>
									</tr>
									<tr>
										<td>생년월일</td>
										<td>생년월일 등장!</td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td>전화번호</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>이메일</td>
									</tr>
									<tr>
										<td>우편번호</td>
										<td>
											<input type="hidden" name="theater_zip" id="theater_zip" >
											<input type="text" name="user_zip_show" id="user_zip_show"  disabled> 
											<input type="button" onclick="sample4_execDaumPostcode()" value="검색" >
										</td>
									</tr>
									<tr>
										<td>상세주소</td>
										<td>
											<input type="hidden" name="theater_addr1" id="theater_addr1" > 
											<input type="text" name="user_addr1_show" id="user_addr1_show"  disabled>
										</td>
									</tr>
									<tr>
										<td>희망근무지역</td>
										<td>
											
											<input type="text" name="che_jijom_show" id="che_jijom_show" placeholder="영화관을 검색해 주세요." disabled>
											<input type="hidden" name="che_jijom" id="che_jijom" placeholder="영화관을 검색해 주세요." > 
											<input type="button" name="jijomgumsec" id="jijomgumsec" value="검색" >
										</td>
									</tr>
									<tr>
										<td>근무가능일</td>
										<td>
											<input type="text" name="che_person" id="che_person" > 명
										</td>
									</tr>
									<tr>
										<td>근무 조건</td>
										<td>
											<textarea id="che_jogun" name="che_jogun" style="width:500px;height: 342px;" >
											 ▪ 근로계약 : 무기근로계약 / 단시간근로 / 개인별 스케줄에 따른 근무
											 ▪ 시급조건 : 20년 9,000원 / 단, 근무평가에 따른 시급 조정
											 ▪ 초과근로 : 50% 가산	▪ 야간근로 : 22시 이후 50% 가산
											 ▪ 연차유급휴가 부여(미 사용시 연차수당 지급)
											 ▪ 사회보험 : 관련 법령에 따라 고용보험, 산재보험, 국민연금, 건강보험 적용
											 ▪ 퇴 직 금 : 1년 이상 근무시 지급
											</textarea>
										</td>
									</tr>
									<tr>
										<td>복리후생</td>
										<td>
											<textarea id="che_bocri" name="che_bocri" style="width:500px;height: 218px;" >
											 ▪ 전국 CGV 영화관람 무료(일부 특별관 제외)
											 ▪ 전국 CGV 매점 메뉴 50%할인(일부 제외)
											 ▪ 유니폼, 명찰, 모자 등 근무 時 착용 물품 제공
											 ▪ 드리미 휴게공간 및 락커 제공
											</textarea>
										</td>
									</tr>
					
									<tr>
										<td>지원자격</td>
										<td>
											<textarea id="che_jagyuc" name="che_jagyuc"style="width:500px;height: 154px;" >
											 ▪ 고등학교 졸업 이상 (단, 졸업예정자/미성년자 제외)
											 ▪ 미성년자(검정고시 합격자, 대학 미 진학자)경우 만19세가 되는 해 1월 1일부터 지원가능
											</textarea>
										</td>
									</tr>
									<tr>
										<td>기타사항</td>
										<td>
											<textarea id="che_gita" name="che_gita"style="width:500px;height: 154px;" >이력서 必</textarea>
										</td>
									</tr>
									<tr>
										<td>진행기간</td>
										<td><input type="date" name="che_sijac_string" id="che_sijac_string" min="${sysdate}">~<input type="date" name="che_magam_string" id="che_magam_string" min="${sysdate}"></td>
									</tr>
								</table>
								<input type="reset" value="리셋"> 
								<input type="submit" value="등록">
								<input type="button" value="취소" onclick="location.href='staff_postList'" >
								</form:form>
                            </div>
                    </div>
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
      	<%@ include file="../footer.jsp" %>
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
var w = 400;
var h = 300;
$(document).ready(function(){
	$("#jijomgumsec").click(function(){
		window.open('http://localhost:8080/YPCinema/jijom_gumsec','_blank',"top=0,left=500,width="+w+",height="+h+",toolbar=0,status=0,scrollbars=1,resizable=0");
	});
});
</script>
</body>
</html>