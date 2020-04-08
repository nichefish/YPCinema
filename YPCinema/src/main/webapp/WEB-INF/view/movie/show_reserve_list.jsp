<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="icon" href="../img/core-img/favicon.ico">
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
 		<p>양평시네마 표 관리 정보</p>
 		<form:form method="get">
 			<p>
 				<input type="text"> <input type="button" value="예매번호 검색? (구현안함...)"><br/>
 				!@#!#@...
 			<p>ㅂㅂ$!@#$!....</p>
 		</form:form>
 		<form:form name="frm" id="frm" method="post" commandName="showtimeCommand">
			날짜: <form:input path="show_date" type="date" />
			<input type="submit" value="날짜선택">
			<p>당일날짜 것만 보이게..? 아니면 어케할지...</p>
		</form:form>
		<table border="1">
 		 	<tr>
 		 		<td>결제번호</td>
 				<td>좌석예약번호</td>
 				<td>상영번호</td>
 				<td>회원번호</td>
 				<td>좌석번호</td>
 				<td>좌석가격</td>
 			</tr>
 			<c:forEach items="${showReserveList}" var="showReserve">
 			<tr>
 				<td>${showReserve.payment_num}</td>
 				<td><a href="detail?payment=${showReserve.payment_num}">${showReserve.seat_reserve_num}</a></td>
 				<td>${showReserve.show_num}</td>
 				<td>${showReserve.m_num}</td>
 				<td>${showReserve.seat_num}</td>
 				<td>${showReserve.seat_price}</td>
 			</tr>
 			</c:forEach>
 		</table>
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