<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 		<p>양평시네마 상영영화 상세정보</p>
 		<p>ㅂㅂ$!@#$!....</p>
 		
 		
 		<table width="60%" border="0">
 			<tr>
				<td colspan="2" align="right">
					<p>
						<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!-- 관리자 및 관리자모드 -->
						<input type="button" onclick="location.href='modify?num=${movieCommand.movie_num}'" name="modify" id="modify" value="영화정보 수정">
						</c:if>
						<c:if test="${authInfo.m_admin eq '0' || authInfo.mode eq '0' || empty authInfo}">	<!-- 비로그인 + 관리자빼고 다... -->
						<input type="button" onclick="location.href='../showtime/list?movie=${movieCommand.movie_num}'" value="지점 상영일정 보기" />
 						</c:if>
						<input type="button" onclick="location.href='list'" value="목록 보기">
					</p>
				</td>
			</tr>
 		</table>
		<table width="60%" border="1">
			<tr>
				<td colspan="2" align="center">
					<img src="${movieCommand.movie_poster_url}">
				</td>
			</tr>
			<tr>
				<td align="center" width="120">영화번호</td>
				<td>${movieCommand.movie_num}</td>
			</tr>
			<tr>
				<td align="center" width="120">제목 </td>
				<td>${movieCommand.movie_title}</td>
			</tr>
			<tr>
				<td align="center" width="120">감독</td>
				<td>${movieCommand.movie_director} (${movieCommand.movie_nation}, <fmt:formatDate value='${movieCommand.movie_date}' type='date' pattern='yyyy-MM-dd' /> 개봉)</td>
			</tr>
			<tr>
				<td align="center" width="120">장르</td>
				<td>${movieCommand.movie_genre}</td>
			</tr>
			<tr>
				<td align="center" width="120">관람연령가</td>
				<td>${movieCommand.movie_age}세</td>
			</tr>
			<tr>
				<td align="center" width="120">상영시간</td>
				<td>${movieCommand.movie_runtime}분</td>
			</tr>
			<tr>
				<td align="center" width="120">줄거리</td>
				<td>${movieCommand.movie_plot}</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<c:forTokens items="${movieCommand.movie_still_url}" var="url" delims="|">
						<img src="${url}">
					</c:forTokens>
				</td>
			</tr>
		</table>
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