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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
</head>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 		<h2>양평시네마 지점 정보</h2>
		<p><br /></p>
		<div class="relCon" align="center">
			<table class="table table-bordered" id="dataTable" style="width:600px;align:center;color:black;">
				<c:forEach items="${theaters}" var="theater">
				<tr align="center" valign="middle">
					<th rowspan="2" align="center"><a href="<c:url value='/theater/detail?num=${theater.theater_num}' />">${theater.theater_name}</a></th>
					<td align="center">${theater.theater_addr1} ${theater.theater_addr2} ${theater.theater_zip}</td>
					<td align="center">☎${theater.theater_ph}</td>
				<tr>
					<c:if test="${authInfo.m_admin ne '0' && authInfo.mode ne '0' && !empty authInfo}">	<!-- 이용자 및 비로그인 아니면 -->
					<td align="center">지점 특화장르: ${theater.theater_special}</td>
					<td align="center">규모등급: ${theater.theater_rating}</td>
					</c:if>
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