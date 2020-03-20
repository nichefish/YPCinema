<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<form:form name="frm" id="frm" method="post" commandName="showReserveCommand">
			날짜:
			<input type="date" name="show_date">
			지점: 
			<select name="theater" id="theater">
				<c:forEach items="${lists}" var="showtime">
					<option value="${showtime.theater_num }">${showtime.theater_num }</option>
				</c:forEach>
			</select>
			상영관: 
			<select name="screen" id="screen">
				<c:forEach items="${lists}" var="showtime">
					<option value="${showtime.screen_num }">${showtime.screen_num }</option>
				</c:forEach>
			</select>
			영화: 
			<select name="movie" id="movie">
				<c:forEach items="${lists}" var="showtime">
					<option value="${showtime.movie_num}">${showtime.movie_num}</option>
				</c:forEach>
			</select>
			<input type="submit" value="상영일정 보기">
			<input type="reset" value="리셋">
			<input type="button" value="취소">
		</form:form>
		<table width=50% border="1" cellpadding="0" cellspacing="0" >
			<tr align="center" valign="middle">
				<td colspan=5>회원리스트</td>
				<td align=right>회원수 : </td>
	<!-- 			${count}  -->
			</tr>
			<tr align="center" valign="middle">
				<td align="center">상영번호</td>
				<td align="center">지점번호</td>
				<td align="center">상영관번호</td>
				<td align="center">상영일자</td>
				<td align="center">상영시작시간</td>
				<td align="center">상영종료시간</td>
			</tr>
			<c:forEach items="${lists}" var="show">
			<tr align="center" valign="middle">
				<td align="center"><a href="reservation">${show.show_num}</a></td>
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
</body>
</html>