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
		<table width=50% border="1" cellpadding="0" cellspacing="0" >
			<tr align="center" valign="middle">
				<td align="center">지점이름</td>
				<td align="center">지점주소</td>
				<td align="center">지점 전화번호</td>
				<td align="center">지점 특화장르</td>
				<td align="center">지점 등급</td>
			</tr>
			<c:forEach items="${theaters}" var="theater">
			<tr align="center" valign="middle">
				<td align="center">
					<a href="<c:url value='/theater/detail?num=${theater.theater_num}' />">${theater.theater_name}</a>
				</td>
				<td align="center">
					${theater.theater_addr1} ${theater.theater_addr2} ${theater.theater_zip}</a>
				</td>
				<td align="center">
					${theater.theater_ph}</a>
				</td>
				<td align="center">
					${theater.theater_special}</a>
				</td>
				<td align="center">
					${theater.theater_rating}</a>
				</td>
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