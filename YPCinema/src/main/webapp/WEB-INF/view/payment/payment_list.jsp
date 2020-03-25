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
 		<form:form name="frm" id="frm" method="get" commandName="paymentCommand">
			날짜: <form:input path="payment_date" type="date" />
			<input type="submit" value="날짜선택">
		</form:form>
		
		<table width=50% border="1" cellpadding="0" cellspacing="0" >
			<tr align="center" valign="middle">
				<td colspan=6>회원리스트</td>
			</tr>
			<tr align="center" valign="middle">
				<td align="center">회원아이디</td>
				<td align="center">회원이름</td>
				<td align="center">회원연락처</td>
				<td align="center">이메일</td>
				<td align="center">등록일</td>
				<td align="center">등록일</td>
			</tr>
			<c:forEach items="${lists}" var="payment">
			<tr align="center" valign="middle">
				<td align="center">
					<a href="<c:url value='/payment/detail?num=${payment.payment_num}' />">${payment.payment_num}</a>
				</td>
				<td align="center">${payment.m_num}</td>
				<td align="center">${payment.payment_email}</td>
				<td align="center">${payment.payment_ph}</td>
				<td align="center">${payment.payment_price}</td>
				<td align="center">
					<fmt:formatDate value="${payment.payment_date}" type="date" />
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