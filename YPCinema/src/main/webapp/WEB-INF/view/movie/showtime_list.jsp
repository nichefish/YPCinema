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
		<form:form name="frm" id="frm" method="post" commandName="showtimeCommand">
			날짜: <form:input path="show_date" type="date" />
			<input type="submit" value="날짜선택">
		</form:form>
		<form:form name="frm" id="frm" method="post" commandName="showtimeCommand">
			지점:
			<form:select path="theater_num">
				<form:options path="theater_list" />
			</form:select>			
			<input type="submit" value="지점선택">
		</form:form>
		
		

		<table width=50% border="1" cellpadding="0" cellspacing="0" >
			<tr align="center" valign="middle">
				<td align="center">상영번호</td>
				<td align="center">지점번호</td>
				<td align="center">상영관번호</td>
				<td align="center">상영일자</td>
				<td align="center">상영시작시간</td>
				<td align="center">상영종료시간</td>
			</tr>
			
			<c:forEach items="${showLists}" var="show">
			<tr align="center" valign="middle">
				<td align="center"><a href="reservation?num=${show.show_num}">${show.show_num}</a></td>
				<td align="center">${show.theater_num}</td>
				<td align="center">${show.screen_num}</td>
				<td align="center"><fmt:formatDate value="${show.show_date}" type="date" /></td>
				<td align="center">${show.show_date}</td>
				<td align="center">${show.show_date}</td>
			</tr>
			</c:forEach>
			
			<tr align=center height=20>
				<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
					<c:if test="${page <= 1}">
					[이전]&nbsp;
					</c:if>
					<c:if test="${page > 1}">
					<a href="list?page=${page-1}">[이전]</a>&nbsp;
					</c:if>
					<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i" >
						<a href="list?page=${i}">[${i}]</a>
					</c:forEach>
						<a href="#"></a>&nbsp;
					<c:if test="${page == maxPage}">
					&nbsp;[다음]
					</c:if>
					<c:if test="${page < maxPage}">
					&nbsp;<a href="list?page=${page+1}">[다음]</a>
					</c:if>
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