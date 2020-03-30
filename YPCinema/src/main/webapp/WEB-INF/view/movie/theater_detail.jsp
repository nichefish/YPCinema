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
 		<p>양평시네마 <b>${numTheater.theater_name}</b> 상세정보</p>
 		<p>주소로 지도.. 찾아오는 길.. 넣을꺼냐...</p>
 		
 		<table width="60%" border="0">
 			<tr>
 				<td align="right">
 					<p>
						<c:if test="${authInfo.m_admin eq '0' || authInfo.mode eq '0' || empty authInfo}">	<!-- 비로그인 + 관리자빼고 다... -->
						<input type="button" onclick="location.href='../showtime/list?theater=${numTheater.theater_num}'" value="지점 상영일정 보기" />
						</c:if>
						<input type="button" onclick="location.href='list'" value="목록으로" />
					</p>
 				</td>
 			</tr>
 		</table>
		<table width="60%" border="1" cellpadding="0" cellspacing="0" >
			<tr>
				<td align="center" width="160">지점 고유번호</td>
				<td colspan="2">${numTheater.theater_num}</td>
			</tr>
			<tr>
				<td align="center" width="160">지점 주소</td>
				<td colspan="2">${numTheater.theater_addr1} ${numTheater.theater_addr2} ${numTheater.theater_zip}</td>
			</tr>
			<tr>
				<td align="center" width="160">지점 연락처</td>
				<td colspan="2">☎${numTheater.theater_ph}</td>
			</tr>
			<tr>
				<td align="center" width="160">지점 특화장르</td>
				<td>
					<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!-- 이용자 및 비로그인 아니면 -->
					<form method="post">
						<input type="hidden" name="theater_num" value="${numTheater.theater_num}">
						<select name="theater_special">
							<option value="${numTheater.theater_special}" selected>${numTheater.theater_special}</option>
							<option value="0" label="없음">0</option>
							<option value="스릴러">스릴러</option>
						</select>
						<input type="submit" value="특화장르 수정" />
					</form>
					</c:if>
					<c:if test="${authInfo.m_admin eq '0' || authInfo.mode eq '0' || empty authInfo}">	<!-- 비로그인 + 관리자빼고 다... -->
						${numTheater.theater_special}
					</c:if>
				</td>
			</tr>
			<tr>
				<td align="center" >지점 규모등급</td>
				<td colspan="2">${numTheater.theater_rating}</td>
			</tr>
		</table>
		<p><br /></p>
		<p>
			양평시네마 <b>${numTheater.theater_name}</b> 상영관 정보
			<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!-- 이용자 및 비로그인 아니면 -->
			<input type="button" onclick="location.href='addScreen?num=${numTheater.theater_num}'" value="상영관 등록" />
			</c:if>
		</p>
		<table width="60%" border="1" cellpadding="0" cellspacing="0" >
			<c:forEach items="${lists}" var="screen">
			<tr align="center" valign="middle">
				<td align="center" width="160"><a href="<c:url value='/theater/detailScreen?num=${screen.screen_num}' />">${screen.screen_name}</a></td>
				<td align="center">${screen.screen_max_seat}석 (${screen.screen_row})</td>
			</tr>
			</c:forEach>
		</table>
		<p><br /></p>
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