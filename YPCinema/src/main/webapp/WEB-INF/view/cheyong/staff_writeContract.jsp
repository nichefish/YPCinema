<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="icon" href="img/core-img/favicon.ico">

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
                    <div class="contact-form" style="text-align:left;">
                    <form action="submitContract" method="post">
                        <h3><strong>표준 근로계약서</strong></h3>
                        <input type="hidden" name="please" id="please" >
                        <input type="hidden" id="gnroTime" value="${resume.r_time}">
                        <!-- Contact Form -->
                       	<b>YGVCinema</b>(이하 "사업주"라 함)과(와) <b>${userInfo.m_name}</b>(이하 "근로자"라 함)은 다음과 같이 근로계약을 체결한다.<br />
                       	* 근로계약기간 :
                       	<input type=text id="nyundo" style="border:none;width:45px;" disabled>년
                       	<input type=text id="wyul"	style="border:none;width:45px;" disabled>월
                       	<input type=text id="yeeel"  style="border:none;width:45px;" disabled>일 부터 &nbsp;&nbsp;
                       	<input type=text id="nyundo2" style="border:none;width:45px;" disabled>년
                       	<input type=text id="wyul2"	style="border:none;width:45px;" disabled>월
                       	<input type=text id="yeeel2"  style="border:none;width:45px;" disabled>일까지
                       	1. 근무장소 : <b>${resume.r_hijijom}</b><br />
                       	2. 소정근로시간 : <b>${resume.r_time}</b><br />
                       	3. 근무일: <b>${resume.r_gadate}</b><br />
                       	4. 임금<br />
                       	- 시급(2020년기준): 9000원<br />
                       	5. 장애여부 : <b>${resume.r_dis}</b><br />
                       	6. 보훈대상 : <b>${resume.r_price}</b><br />
                       	7. 연차유급휴가<br />
                       	- 연차유급휴가는 근로기준법에서 정하는 바에 따라 부여함.<br />
                       	8. 근로계약서 교부<br />
                       	- 사업주는 근로계약을 체결함과 동시에 본 계약서를 사본하여 근로자의 교부요구와 고나계없이 근로자에게 교부함(근로기준법 제 17조 이행)<br />
                       	9. 기 타<br />
                       	- 이 계약에 정함이 없는 사항은 근로기준법령에 의함<br />
                       <input type=text id="nyundo3" style="border:none;width:45px;" disabled>년 
                       <input type=text id="wyul3"	style="border:none;width:45px;" disabled>월 
                       <input type=text id="yeeel3"  style="border:none;width:45px;" disabled>일<br />
                       	(근로자) 주소: <b>(${userInfo.m_zip})${userInfo.m_addr1} / ${userInfo.m_addr2}</b><br />
                       	&nbsp;&nbsp;&nbsp; 연락처: <b>${userInfo.m_ph}</b><br />
                       	&nbsp;&nbsp;&nbsp; 성명 :  <b>${userInfo.m_name}</b><br />
                       	은행명:<input type="text" id="staff_bank">
                       	계좌번호:<input type="text" id="staff_bankNum" placeholder=" - 를 없애주세요."><br />
                       	<input type="hidden" name="hiddenR_num" id="hiddenR_num" value="${resume.r_num}">
                       	<input type="hidden" name="hiddenM_num" id="hiddenM_num" value="${userInfo.m_num}" >
                       	
						<!-- 서명서명 -->
						
						<div>
							<canvas id="canvas" width="350" height="200" style="border:10px solid #000000">
							</canvas>
						</div>
						<div>
							<input type="button" id="id_clear" value="다시 서명" /> 
							<input type="button" id="id_copy" value="서명확인" />
							<input type="submit" value="제출">
						</div>
						<div id="copyarea"></div>
						<!-- 서명서명끝 -->
						
				</form>
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


<script>
$(function(){
	$( document ).ready( function() {
		var Now = new Date();
		var NowTime = Now.getFullYear();
		NowTime += '-' + (Now.getMonth() + 1);
		NowTime += '-' + Now.getDate();
		NowTime += ' ' + Now.getHours();
		NowTime += ':' + Now.getMinutes();
		$("#nyundo").val(Now.getFullYear());
		$("#wyul").val((Now.getMonth() + 1));
		$("#yeeel").val(Now.getDate());
		$("#nyundo2").val((Now.getFullYear()+1));
		$("#wyul2").val((Now.getMonth() + 1));
		$("#yeeel2").val((Now.getDate()-1));
		$("#nyundo3").val(Now.getFullYear());
		$("#wyul3").val((Now.getMonth() + 1));
		$("#yeeel3").val(Now.getDate());
	});
});
$(document).ready(function(){
	 var canvas = document.getElementById('canvas');
	 //canvas.width = screen.width;
	 var context = canvas.getContext('2d');
	 context.lineWidth=10;
	 context.lineCap="round";

	 $(canvas).bind({"touchstart mousedown": function(event){
	  
	  event.preventDefault();
	  
	  if(event.type == 'touchstart'){
	   event = event.originalEvent.targetTouches[0];
	  }
	  
	  $(this).data("flag", "1");
	  var position = $(this).offset();
	  var x = event.pageX - position.left;
	  var y = event.pageY - position.top;
	  console.log("start x: " + x + ", y: " + y);
	  context.beginPath();
	  context.moveTo(x,y);

	 }, "mousemove touchmove" : function(event) {
	  
	  event.preventDefault();
	  
	  if(event.type == 'touchmove'){
	   event = event.originalEvent.targetTouches[0];
	  }  

	  var flag = $(this).data("flag");
	  if(flag == 1){
	   var position = $(this).offset();
	   var x = event.pageX - position.left;
	   var y = event.pageY - position.top; 
	   
	   //console.log("move x: " + x + ", y: " + y);
	  }
	  context.lineTo(x, y);
	  context.stroke();
	 }, "mouseup touchend mouseleave" : function(event) {
	  
	  event.preventDefault();

	  console.log("type: " + event.type);
	  if(event.type == 'touchend'){
	   event = event.originalEvent.changedTouches[0];   
	  }   

	  $(this).data("flag", "0");
	  var position = $(this).offset();
	  
	  var x = event.pageX - position.left;
	  var y = event.pageY - position.top; 
	  
	  console.log("end: " + x + ", y: " + y);

	//  context.lineTo(x, y);
	//  context.stroke();
	 }
	 
	 });

	 $("#id_clear").click(function(){
	  canvas.width = canvas.width;
	  context.lineWidth=10;
	  context.lineCap="round";
	 });

	 $("#id_copy").click(function(){
	  //var imageData = context.getImageData(0,0,canvas.width, canvas.height);
	        //var data = imageData.data;

	  console.log(canvas.width + ": " + canvas.height);

	  var canvasCopy = document.createElement("canvas");
	  var copyContext = canvasCopy.getContext("2d");
	  
	  var w = 80;
	  var h = 50;
	  canvasCopy.width = w;
	  canvasCopy.height = h;

	  copyContext.drawImage(canvas, 0, 0, w, h);


	  var pngUrl = canvas.toDataURL();
	  var copyPngUrl = canvasCopy.toDataURL();
	  $("#please").val(canvas.toDataURL());
	  console.log("원본이미지 사이즈: " + pngUrl.length);
	  console.log("스몰이미지 사이즈: " + copyPngUrl.length);

	  console.log("url type: " + typeof(copyPngUrl));
	  console.log("스몰이미지 url: " + copyPngUrl);
	  console.log("스몰이미지 url: " + copyPngUrl.replace("data:image/png;base64,", ""));

	//  $("<img>", {

	//   src: pngUrl

	//  }).appendTo("#copyarea");

	  $("<img>", {

	   src: copyPngUrl,
	   onload: function(){console.log("img loaded..");}

	  }).appendTo("#copyarea");
hj 
	  delete canvasCopy;
	 });
	});
</script>
</body>
</html>