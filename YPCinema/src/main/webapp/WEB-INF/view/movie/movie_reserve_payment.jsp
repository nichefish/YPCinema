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
 		<form:form method="post" action="/YPCinema/orderList" commandName="showtimeReserveCommand">
			<table border="1">
				<tr>
					<td>예약정보</td>
				</tr>
				<tr>
					<td>
						show_num: ${show.show_num }<br />
						<form:hidden path="show_num" />
						theater_num: ${showtimeReserveCommand.theater_num }<br />
						<form:hidden path="theater_num" />
						screen_num: ${showtimeReserveCommand.screen_num }<br />
						<form:hidden path="screen_num" />
						seat_num: ${showtimeReserveCommand.seat_num }<br />
						<form:hidden path="seat_num" />
						seat_price: ${showtimeReserveCommand.seat_price }<br/>
						<form:hidden path="seat_price" />
						show_date: ${show.show_date }<br />
						show_start: ${show.show_start }<br />
						show_end: ${show.show_end }<br />
					</td>
				</tr>
				<tr>
					<td>
						결제수단: <input type="radio" name="payment_method" value="카카오페이" /> 카카오페이
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="결제" />
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</div>
</body>
</html>