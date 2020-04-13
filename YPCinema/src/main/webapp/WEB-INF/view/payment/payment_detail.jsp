<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="icon" href="../img/fvc.jpg">
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
<body>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 		<div class="relCon" align="center">
 			<h2>나의 결제정보 상세정보</h2>
 			<p><br /></p>
	 		<table class="table table-bordered" id="dataTable" style="width:600px;align:center;color:black;">
	 		 	<tr>
	 				<th>결제번호</th>
	 				<td>${payment.payment_num}</td>
	 			</tr>
	 			<tr>
	 				<th>회원번호</th>
	 				<td>${payment.m_num}</td>
	 			</tr>
	 			<tr>
	 				<th>결제 이메일</th>
	 				<td>${payment.payment_email}</td>
	 			</tr>
	 			<tr>
	 				<th>결제 전화번호</th>
	 				<td>${payment.payment_ph}</td>
	 			</tr>
	 			<tr>
	 				<th>결제가격</th>
	 				<td>${payment.payment_price}</td>
	 			</tr>
	 			<tr>
	 				<th>결제일자</th>
	 				<td><fmt:formatDate value="${payment.payment_date}" type="date" /></td>
	 			</tr>
	 		</table>
	 	</div>
 		<table width="60%" border="0">
 			<tr>
 				<td align="center">
 					<input type="button" onclick="location.href='/YPCinema/myMovies'" value="나의 결제 목록으로">
 				</td>
 			</tr>
 		</table>
	 	<div class="relCon" align="center">
	 		<table class="table table-bordered" id="dataTable" style="width:600px;align:center;color:black;">
	 		 	<tr>
	 		 		<th>-</th>
	 				<th>예약번호</th>
	 				<th>상영번호</th>
	 				<th>결제번호</th>
	 				<th>좌석번호</th>
	 				<th>좌석가격</th>
	 				<th>티켓상태</th>
	 			</tr>
	 			<c:forEach items="${showReserveList}" var="showReserve">
	 			<tr>
	 				<td width="40" style="background-color:black;"><img src="../img/ticket3-5.png" width="30px"></td>
	 				<td><a href="#">${showReserve.seat_reserve_num}</a></td>
	 				<td>${showReserve.show_num}</td>
	 				<td>${showReserve.payment_num}</td>
	 				<td>${showReserve.seat_num}</td>
	 				<td>${showReserve.seat_price}</td>
	 				<td>
		 				<div align="center">
			 				<c:if test="${showReserve.seat_issue eq '0'}">보류...</c:if>
			 				<c:if test="${showReserve.seat_issue eq '1'}">발권!</c:if>
			 				<c:if test="${showReserve.seat_issue eq '2'}">입장!</c:if>
			 				<c:if test="${showReserve.seat_issue eq '3'}">환불ㅠ</c:if>
		 				</div>
		 			</td>
	 			</tr>
	 			</c:forEach>
	 		</table>
 		</div>
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