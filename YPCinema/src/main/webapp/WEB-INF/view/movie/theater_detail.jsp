<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<td>지점이름</td>
				<td>${theaterAddCommand.theater_num}</td>
			</tr>
		</table>
		<table border="1">
			<tr align="center" valign="middle">
				<td align="center">지점</td>
				<td align="center">스크린</td>
				<td align="center">회원연락처</td>
				<td align="center">이메일</td>
				<td align="center">등록일</td>
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
	</div>
</div>
</body>
</html>