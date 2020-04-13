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
<script type="text/javascript">
$(function() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	if (dd<10) {
		dd='0'+dd;
	} 
	if(mm<10){
		mm='0'+mm;
	} 
	today = yyyy+'-'+mm+'-'+dd;
	$("#date").attr("min", today);
	$("#theater").change(function() {
		location.href="list?theater=" + this.value;
	});
	$("#date").change(function() {
		location.href="list?date=" + this.value;
	});
});
</script>
</head>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 		<h2>양평시네마 상영일정 정보</h2>
 		<form:form name="frm" id="frm" method="post" commandName="showtimeListCommand">
			<p>
				날짜: <form:input path="show_date" id="date" type="date" />&nbsp;&nbsp;
				지점:
				<form:select path="theater_num" id="theater">
					<form:option value="" label="지점 선택" selected="selected" />
					<c:forEach items="${theaters}" var="theater">
					<form:option value="${theater.theater_num}" label="${theater.theater_name}" />
					</c:forEach>
				</form:select>
				영화: <form:hidden path="movie_num" />
				<input type="text" value="${showtimeListCommand.movie_num}" />
				<input type="submit" value="검색"><br/>
			</p>
			
		</form:form>
 		<p><br /></p>
 		<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!-- 이용자 및 비로그인 아니면 -->
 		<table width="60%" border="0" cellpadding="0" cellspacing="0" >
 			<tr>
 			<td align="right">
 				<p><input type="button" onclick="location.href='register'" value="상영일정 등록"></p>
 			</td>
 			</tr>
 		</table>
 		</c:if>
 		<div>
			<table width="60%" border="1" cellpadding="0" cellspacing="0" >
				<tr align="center" valign="middle">
					<td align="center">상영번호</td>
					<td align="center">지점번호</td>
					<td align="center">상영관번호</td>
					<td align="center">영화번호</td>
					<td align="center">상영일자</td>
					<td align="center">상영시작시간</td>
					<td align="center">상영종료시간</td>
				</tr>
				<c:forEach items="${showLists}" var="show">
				<tr align="center" valign="middle">
					<td align="center"><a href="reservation?num=${show.show_num}">${show.show_num}</a></td>
					<td align="center">${show.theater_num}</td>
					<td align="center">${show.screen_num}</td>
					<td align="center">${show.movie_num}</td>
					<td align="center"><fmt:formatDate value="${show.show_date}" type="date" /></td>
					<td align="center"><fmt:formatDate value='${show.show_start}' type='time' pattern='HH:mm' /></td>
					<td align="center"><fmt:formatDate value='${show.show_end}' type='time' pattern='HH:mm' /></td>
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