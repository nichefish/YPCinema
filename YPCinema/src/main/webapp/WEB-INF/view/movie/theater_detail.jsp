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
		<table border="1">
			<tr>
				<td>지점이름</td>
				<td>${numTheater.theater_num}</td>
			</tr>
			<tr>
				<td>지점이름</td>
				<td>${numTheater.theater_name}</td>
			</tr>
			<tr>
				<td>지점주소</td>
				<td>${numTheater.theater_addr1} ${numTheater.theater_addr2} ${numTheater.theater_zip}</td>
			</tr>
			<tr>
				<td>지점연락처</td>
				<td>${numTheater.theater_ph}</td>
			
			</tr>
			<tr>
				<td>지점특화장르</td>
				<td>${numTheater.theater_special}</td>
			</tr>
			<tr>
				<td>지점등급</td>
				<td>${numTheater.theater_rating}</td>
			</tr>
		</table>
		<form method="post">
			<input type="hidden" name="theater_num" value="${numTheater.theater_num}">
			<select name="theater_special">
				<option value="0">0</option>
				<option value="스릴러">스릴러</option>
			</select>
			<input type="submit" value="지점특화장르 수정" />
		</form>
		<table border="1">
			<tr align="center" valign="middle">
				<td align="center">지점</td>
				<td align="center">스크린</td>
				<td align="center">최대좌석</td>
				<td align="center">좌석배치 열</td>
			</tr>
			
			<c:forEach items="${lists}" var="screen">
			<tr align="center" valign="middle">
				<td align="center">${screen.theater_num}</td>
				<td align="center">
					<a href="<c:url value='/theater/detailScreen?num=${screen.screen_num}' />">${screen.screen_num}</a>
				</td>
				<td align="center">${screen.screen_max_seat}</td>
				<td align="center">${screen.screen_row}</td>
			</tr>
			</c:forEach>
		</table>
		<input type="button" onclick="location.href='addScreen?num=${numTheater.theater_num}'" value="상영관 추가" />
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