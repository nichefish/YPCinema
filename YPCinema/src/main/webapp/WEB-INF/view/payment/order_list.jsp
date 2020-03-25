<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 		<form action="/YPCinema/kakaoPay" method="post">
			<table border="1">
				<tr>
					<td><input type="hidden" name="show_num" value="${showtimeReserveStored.show_num}" /> 상영번호: ${showtimeReserveStored.show_num}</td>
					<td><input type="hidden" name="m_num" value="${showtimeReserveStored.m_num}"/> 회원번호: ${showtimeReserveStored.m_num}</td>
					<td><input type="hidden" name="seat_num" value="${showtimeReserveStored.seat_num}"/> 좌석번호: ${showtimeReserveStored.seat_num}</td>
					<td><input type="hidden" name="seat_name" value="${showtimeReserveStored.seat_name}"/> 좌석이름: ${showtimeReserveStored.seat_name}</td>
					<td><input type="hidden" name="seat_price" value="${showtimeReserveStored.seat_price}"/> 좌석가격: ${showtimeReserveStored.seat_price}</td>
				</tr>
				<tr>
					<td>회원번호: <input type="text" name="m_num" value="${authInfo.m_num }"> (${authInfo.m_num })</td>
					<td>이메일 주소: <input type="text" name="payment_email"></td>
					<td>전화번호: <input type="text" name="payment_ph"></td>
				</tr>
			</table>
			<input type="submit" value="결제">
			<input type="button" value="결제 계속?">
		</form>
	</div>
</div>
</body>
</html>