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
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 	<img src="<c:url value='/img/logo_1-4.png' />" alt="YGVCinema Login Logo" style="width:200px;">
 		<c:if test="${empty result }">
		<p style="color:black;"><b>"${memberCommand.m_name}"</b>님, YPCimena 회원가입을 축하합니다.<br/>
		입력하신 이메일 주소 <b>${memberCommand.m_email}</b>로 가입확인 메일이 발송되었습니다. <br /><b>링크를 클릭하여 메일 인증을 해주시기 바랍니다.</b><br/>
		(메일인증이 된 아이디에 한해 서비스 이용이 가능합니다.)</p>
		<p><a href="<c:url value='/main' />">메인으로</a></p>
		</c:if>
		<c:if test="${result eq 1}">
		<p style="color:black;">이메일 인증에 성공하여 가입이 완료되었습니다.</p>
		<p><a href="<c:url value='/login' />">로그인</a></p>
		</c:if>
		<c:if test="${result eq 0}">
		<p style="color:black;">이미 이메일 인증이 완료된 계정입니다.</p>
		<p><a href="<c:url value='/login' />">로그인</a></p>
		</c:if>
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