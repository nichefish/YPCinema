<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<form:form method="post" id="frm" commandName="showReserveCommand">
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
						<input type="checkbox" class="check" name="seat_num" id="seat_num" value="${status.count}">
						<c:if test="${rowCount2 <= 2 || ((rowCount2 > 2 && rowCount2 <= (screenCommand.screen_col - 2)) && ((rowCount1 <= screenCommand.screen_row_array[0]) || (rowCount1 > (screenCommand.screen_row_array[0] + screenCommand.screen_row_array[1])))) }">
							<input type="hidden" name="seat_price" value="9000">
							<div class="economy"></div>
						</c:if>
						<c:if test="${(((rowCount2 > 2 && rowCount2 <= (screenCommand.screen_col - 2)) && ((rowCount1 > screenCommand.screen_row_array[0]) && (rowCount1 <= screenCommand.screen_row_array[1] + screenCommand.screen_row_array[2]))) || ((rowCount2 > (screenCommand.screen_col - 2)) && ((rowCount1 <= screenCommand.screen_row_array[0]) || (rowCount1 > (screenCommand.screen_row_array[0] + screenCommand.screen_row_array[1]))))) }">
							<input type="hidden" name="seat_price" value="10000">
							<div class="normal"></div>
						</c:if>
						<c:if test="${(rowCount2 > (screenCommand.screen_col - 2)) && ((rowCount1 > screenCommand.screen_row_array[0]) && (rowCount1 <= (screenCommand.screen_row_array[0] + screenCommand.screen_row_array[1]))) }">
							<input type="hidden" name="seat_price" value="11000">
							<div class="prime"></div>
						</c:if>
					</td>
					<c:if test="${rowCount1 eq screenCommand.screen_row_array[0] || rowCount1 eq screenCommand.screen_row_array[0] + screenCommand.screen_row_array[1] }">
					<td width="20" border="0">　</td>
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
						<input type="hidden" value="seat_issue">
						<c:if test="${!empty authInfo && authInfo.m_admin eq '2' && authInfo.mode ne '0'}">	<!-- 관리자 및 관리자모드 -->
						<input type="button" id="ticket_issue" value="발권" />
						<input type="button" id="ticket_enter" value="입장확인" />
						<input type="button" id="ticket_refund" value="환불처리..." />
						</c:if>
						<c:if test="${authInfo.m_admin eq '0' || authInfo.mode eq '0' || empty authInfo}">	<!-- 비로그인 + 관리자빼고 다... -->
						<input type="submit" value="예매신청" /> 
 						</c:if>
						<input type="button" onclick="location.href='list'" value="목록 보기">
					</td>
				</tr>
			</table>
		</form:form>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	$("#ticket_issue").click(function() {
		alert("발권! (구현안함)");
		$("ticket_issue").val("1");
		$("#frm").submit();
	});
	$("#ticket_enter").click(function() {
		alert("입장! (구현안함)");
		$("ticket_issue").val("2");
		$("#frm").submit();
	});
	$("#ticket_refund").click(function() {
		alert("환불! (구현안함)");
		$("ticket_issue").val("3");
		$("#frm").submit();
	});
});
</script>
</body>
</html>