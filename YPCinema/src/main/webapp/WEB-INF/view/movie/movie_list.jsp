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
<link rel="icon" href="../img/fvc.jpg">
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
 		<h2>양평시네마 상영영화 정보</h2>
 		<form:form method="get">
 			<p><input type="text"> <input type="button" value="영화 검색"></p>
 		</form:form>
 		<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!-- 이용자 및 비로그인 아니면 -->
 		<table width="60%" border="0" cellpadding="0" cellspacing="0" >
 			<tr>
	 			<td align="right">
	 				<p><input type="button" onclick="location.href='register'" value="영화정보 등록"></p>
	 			</td>
	 			</tr>
 		</table>
 		</c:if>
 		<div class="relCon" align="center">
			<table style="width:60%;align:center;color:black;">
				<tr align="center" border="1" valign="middle">
					<td align="center">영화번호</td>
					<td align="center">영화제목<br/>(감독, 년도)</td>
					<td align="center">장르</td>
					<td align="center">관람연령가</td>
					<td align="center">상영시간</td>
					<td align="center">편성등급</td>
				</tr>
				<c:forEach items="${lists}" var="movie">
				<tr align="center" valign="middle">
					<td align="center"><a href="<c:url value='/movie/detail?num=${movie.movie_num}' />">${movie.movie_num}</a></td>
					<td align="center">
						<a href="<c:url value='/movie/detail?num=${movie.movie_num}' />">${movie.movie_title}</a><br />
						(${movie.movie_director}, <fmt:formatDate value="${movie.movie_date}" type="date" pattern="yyyy" />)
					</td>
					<td align="center">${movie.movie_genre}</td>
					<td align="center">${movie.movie_age}</td>
					<td align="center">${movie.movie_runtime}분</td>
					<td align="center">${movie.movie_rating}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
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
</body>
</html>