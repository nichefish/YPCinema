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
                    <div class="contact-form" style="height:1500px;width:900px;margin-left:-50px;">
                        <h3><strong>지원서</strong></h3>
                        <!-- Contact Form -->
                            <div class="row">
                                <div class="col-12 col-md-6" style="font-size:10px; color:red;">
                                 	※주의사항※ 장난으로 내면 디진다.
                                </div>
                                <br />
                                <form method="post" id="hollly">
                                <input type="hidden" id="r_m_num" name="m_num" value="${m_num}">
								<table class="table table-bordered" id="dataTable" cellspacing="0" style="width:700px;border:0px;" >
									<tr>
										<td>이름 </td>
										<td>${userInfo.m_name}</td>
									</tr>
									<tr>
										<td>생년월일</td>
										<td><fmt:formatDate value='${userInfo.m_birth}' type='date' pattern='yyyy-MM-dd' /></td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td>${userInfo.m_ph}</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>${userInfo.m_email}</td>
									</tr>
									<tr>
										<td>우편번호</td>
										<td>${userInfo.m_zip}</td>
									</tr>
									<tr>
										<td>상세주소</td>
										<td>${userInfo.m_addr1} / ${userInfo.m_addr2}</td>
									</tr>
									<tr>
										<td>희망근무지역</td>
										<td>
											
											<input type="text" name ="che_jijom_show" id="che_jijom_show" placeholder="영화관을 검색해 주세요." disabled >
											<input type="hidden" name="r_hijijom" id="che_jijom"> 
											<input type="button" name="jijomgumsec" id="jijomgumsec" value="검색" >
										</td>
									</tr>
									<tr>
										<td>근무가능일</td>
										<td>
											<label><input type="checkbox" name="r_gadate"   value="월">월</label>
											<label><input type="checkbox" name="r_gadate"   value="화">화</label>
											<label><input type="checkbox" name="r_gadate"   value="수">수</label>
											<label><input type="checkbox" name="r_gadate"   value="목">목</label>
											<label><input type="checkbox" name="r_gadate"   value="금">금</label>
											<label><input type="checkbox" name="r_gadate"   value="토">토</label>
											<label><input type="checkbox" name="r_gadate"   value="일">일</label>
										</td>
									</tr>
									<tr>
										<td>근무가능시간</td>
										<td><input type="text" id="r_time" name="r_time"></td>
									</tr>
									<tr>
										<td>장애구분</td>
										<td>
											<input type="radio" name="r_dis" id="r_dis_y"value="네">네
											<input type="radio" name="r_dis" id="r_dis_n" value="아니요">아니요
											&nbsp;
											<input type="text" name="hahahaho" id="hahahaho" placeholder="장애등급번호를 입력해 주세요." style="width:250px;">
												
											
										</td>
									</tr>
									<tr>
										<td>보훈대상</td>
										<td>
											<input type="radio" name="r_price" id="r_price_y" value="네">네
											<input type="radio" name="r_price" id="r_price_n" value="아니요">아니요
											&nbsp;
											<input type="text" name="hahahahi" id="hahahahi" placeholder="보훈번호를 입력해 주세요." style="width:250px;">
											
										</td>
									</tr>
									<tr>
										<td>경력사항</td>
										<td>
											<textarea id="r_career" name="r_career" style="width:500px;height: 218px;" >
											</textarea>
										</td>
									</tr>
					
									<tr>
										<td>성격의 장단점</td>
										<td>
											<textarea id="r_per" name="r_per" style="width:500px;height: 154px;" >
											
											</textarea>
										</td>
									</tr>
									<tr>
										<td>지원동기 및 포부</td>
										<td>
											<textarea id="r_jiwon" name="r_jiwon" style="width:500px;height: 218px;" >
											</textarea>
										</td>
									</tr>
								</table>
								<input type="reset" value="리셋">
								<input type="submit" value="지원">
								<input type="button" value="취소" onclick="location.href='staff_postList'" >
								</form>
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
<script text/javascript>
var w = 400;
var h = 300;
$(document).ready(function(){
	//숨김
	$("#hahahahi").hide();
	$("#hahahaho").hide();

	$("#jijomgumsec").click(function(){
		window.open('http://localhost:8080/YPCinema/jijom_gumsec','_blank',"top=0,left=500,width="+w+",height="+h+",toolbar=0,status=0,scrollbars=1,resizable=0");
	});
	//눌렀을 때 보이게 & 안보이게
	$("input:radio[id=r_price_y]").click(function(){
		$("#hahahahi").show();
	});
	$("input:radio[id=r_price_n]").click(function(){
		$("#hahahahi").hide();
	});
	$("input:radio[id=r_dis_y]").click(function(){
		$("#hahahaho").show();
	});
	$("input:radio[id=r_dis_n]").click(function(){
		$("#hahahaho").hide();
	});
	$(function() {
		$("#hollly").submit(function() {
			if ($("#che_jijom").val() == "") {
				alert("영화관을 검색해주세요.");
				$("#che_jijom").focus();
				return false;
			}
			if ($("#r_time").val() == "") {
				alert("근무가능시간을 작성해 주세요.");
				$("#r_time").focus();
				return false;
			}
			if ($("#r_career").val() == "") {
				alert("경력사항을 입력해 주세요.");
				$("#r_career").focus();
				return false;
				}
			if ($("#r_per").val() == "") {
				alert("성격의 장단점을 작성해 주세요.");
				$("#r_per").focus();
				return false;
				}
			if ($("#r_jiwon").val() == "") {
				alert("지원동기를 작성해 주세요.");
				$("#r_jiwon").focus();
				return false;
				}
		});
});
});
</script>
</body>
</html>