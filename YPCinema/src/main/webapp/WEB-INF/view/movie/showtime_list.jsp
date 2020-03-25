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
</body>
</html>