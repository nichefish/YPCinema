<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 		<table border="1">
 		 	<tr>
 				<td>결제번호</td>
 				<td>${payment.payment_num}</td>
 			</tr>
 			<tr>
 				<td>회원번호</td>
 				<td>${payment.m_num}</td>
 			</tr>
 			<tr>
 				<td>결제 이메일</td>
 				<td>${payment.payment_email}</td>
 			</tr>
 			<tr>
 				<td>결제 전화번호</td>
 				<td>${payment.payment_ph}</td>
 			</tr>
 			<tr>
 				<td>결제가격</td>
 				<td>${payment.payment_price}</td>
 			</tr>
 			<tr>
 				<td>결제일자</td>
 				<td>${payment.payment_date}</td>
 			</tr>
 		</table>
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
 		<table width="60%" border="0">
 			<tr>
 				<td align="center">
 					<input type="button" onclick="location.href='/YPCinema/main'" value="메인으로">
 				</td>
 			</tr>
 		</table>
 	</div>
</div>
</body>
</html>