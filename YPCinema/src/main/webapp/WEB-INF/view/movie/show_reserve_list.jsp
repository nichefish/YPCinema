<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
</body>
</html>