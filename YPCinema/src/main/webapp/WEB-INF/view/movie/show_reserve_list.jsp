<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
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
 		<form:form name="frm" id="frm" method="post" commandName="showtimeCommand">
			날짜: <form:input path="show_date" type="date" />
			<input type="submit" value="날짜선택">
		</form:form>
		<table border="1">
 		 	<tr>
 				<td>좌석예약번호</td>
 				<td>상영번호</td>
 				<td>결제번호</td>
 				<td>회원번호</td>
 				<td>좌석번호</td>
 				<td>좌석가격</td>
 			</tr>
 			<c:forEach items="${showReserveList}" var="showReserve">
 			<tr>
 				<td><a href="#">${showReserve.seat_reserve_num}</a></td>
 				<td>${showReserve.show_num}</td>
 				<td>${showReserve.payment_num}</td>
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
   <!-- Popper js -->
   <script src="js/popper.min.js"></script>
   <!-- Bootstrap js -->
   <script src="js/bootstrap.min.js"></script>
   <!-- Plugins js -->
   <script src="js/plugins.js"></script>
   <!-- Active js -->
   <script src="js/active.js"></script>
</body>
</html>