<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="icon" href="img/fvc.jpg">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
</head>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100" >
 	<div class="container" align="center">
 	<input type="button" style="border-radius: 50%; width:150px; height:150px; color: #c0bdbd;" value="나의정보" onclick="location.href='myPage'">&nbsp;&nbsp;
 	<input type="button" style="border-radius: 50%; width:150px; height:150px; color: #c0bdbd;" value="나의쿠폰" onclick="location.href='memeber_couponList'">&nbsp;&nbsp;
 	<input type="button" style="border-radius: 50%; width:150px; height:150px; color: #c0bdbd;" value="나의 영화관" onclick="location.href='myStatistic'">&nbsp;&nbsp;
 	<input type="button" style="border-radius: 50%; width:150px; height:150px; color: #c0bdbd;" value="나의 매점" onclick="location.href='myPage'">&nbsp;&nbsp;
 	<input type="button" style="border-radius: 50%; width:150px; height:150px; color: #c0bdbd;" value="나의 이력서" onclick="location.href='member_myApply'">&nbsp;&nbsp;
 	<input type="button" style="border-radius: 50%; width:150px; height:150px; color: #c0bdbd;" value="나의 통계">

 		
		
	</div>
</div>
<footer class="footer-area">
	<%@ include file="../footer.jsp"%>
</footer>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/active.js"></script>
</body>
</html>