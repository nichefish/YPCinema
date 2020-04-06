<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<table border="1">
			<tr>
				<td>상영일정번호</td>
				<td>${show.show_num }</td>
			</tr>
			<tr>
				<td>지점</td>
				<td>${show.theater_num}</td>
			</tr>
			<tr>
				<td>상영관 번호</td>
				<td>${show.screen_num}</td>
			</tr>
			<tr>
				<td>영화번호</td>
				<td>${show.movie_num}</td>
			</tr>
			<tr>
				<td>상영일자</td>
				<td>${show.show_date}</td>
			</tr>
			<tr>
				<td>상영시간</td>
				<td>${show.show_start} ~ ${show.show_end}</td>
			</tr>
			<tr>
				<td>상영관 가로 행</td>
				<td>
					${screenCommand.screen_row} (${screenCommand.screen_row_array[0]} // ${screenCommand.screen_row_array[1]} // ${screenCommand.screen_row_array[2]})
					<c:set var="rowRow" value="${screenCommand.screen_row_array[0] + screenCommand.screen_row_array[1] +screenCommand.screen_row_array[2]}"></c:set>
				</td>
			</tr>
			<tr>
				<td>상영관 가로 열</td>
				<td>${screenCommand.screen_col}</td>
			</tr>
			<tr>
				<td>스크린 최대 좌석수</td>
				<td>${screenCommand.screen_max_seat}</td>
			</tr>
		</table>
		<table border="0">
			<tr>
				<td>
					<input type="button" onclick="location.href='list'" value="상영일정표로 돌아가기" >
				</td>
			</tr>
		</table>
		<p><br /></p>
		<form:form action="orderList" id="select_seats" method="post" commandName="showReserveCommand">
			<form:hidden path="show_num" />
			<form:hidden path="theater_num" />
			<form:hidden path="screen_num" />
			인원수를 선택하세요: 
			<select name="show_reserve_people" id="show_reserve_people">
				<option value="1" label="1명" selected>1</option>
				<option value="2" label="2명">2</option>
				<option value="3" label="3명">3</option>
				<option value="4" label="4명">4</option>
			</select>
			인원수 선택해야 되고.. selectbox...?<br />
			일단 총 가격이... select하면 바로 보여야 되고...
			<div id="total_price"></div>
			
			
			<p><br /></p>
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
			<p><br /></p>
			<table border="1">
				<tr>
					<td>
						<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!-- 관리자 및 관리자모드 -->
						<!--  -->
						</c:if>
						<c:if test="${authInfo.m_admin eq '0' || authInfo.mode eq '0' || empty authInfo}">	<!-- 비로그인 + 관리자빼고 다... -->
						<input type="submit" value="예매신청" /> 
 						</c:if>
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
<script>
$(".economy").closest("td").css('background-color', 'yellow');
$(".normal").closest("td").css('background-color', '#87ceeb');
$(".prime").closest("td").css('background-color', '#ff8080');
</script>
</body>
</html>