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
		<table border="1">
			<tr>
				<td>show_num=${show.show_num }</td>
				<td>theater_num=${show.theater_num }</td>
				<td>screen_num=${show.screen_num }</td>
				<td>movie_num=${show.movie_num }</td>
				<td>show_date=${show.show_date }</td>
			</tr>
			<tr>
				<td>screen_row=${screenCommand.screen_row}</td>
				<td>screen_max_seat=${screenCommand.screen_max_seat}</td>
				<td>${screenCommand.screen_row_array[0]} / ${screenCommand.screen_row_array[1]} / ${screenCommand.screen_row_array[2]} </td>
				<c:set var="rowRow" value="${screenCommand.screen_row_array[0] + screenCommand.screen_row_array[1] +screenCommand.screen_row_array[2]}"></c:set>
			</tr>
		</table>
		<form:form action="orderList" method="post" commandName="showReserveCommand">
			<form:hidden path="show_num" />
			<form:hidden path="theater_num" />
			<form:hidden path="screen_num" />
			<input type="text" name="seat_price" value="10000">
			screen max seat = ${screenCommand.screen_max_seat }
			<table border="0">
				<tr>
					<c:forEach var="i" begin="1" end="${screenCommand.screen_max_seat}" varStatus="status">
					<c:set var="rowCount1" value="${status.count % rowRow}" />
					<c:set var="rowCount2" value="${status.count / rowRow}" />
					<td align="center" border="1" width="20">
						${status.count}	<br/>
						<input type="radio" name="seat_num" id="seat_num" value="${status.count}">
					</td>
					<c:if test="${rowCount1 eq screenCommand.screen_row_array[0] || rowCount1 eq screenCommand.screen_row_array[0] + screenCommand.screen_row_array[1] }">
					<td width="20" border="0">-</td>
					</c:if>
					<c:if test="${rowCount1 eq '0'}">
						</tr> <tr>
					</c:if>
					</c:forEach>
				</tr>
			</table>
			<table border="1">
				<tr>
					<td>
						<input type="submit" value="예매신청" /> 
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</div>
</body>
</html>