<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Searching User</title>
</head>
<body>
<table class="table table-bordered" width="60%" id="dataTable" cellspacing="0">
						<tr align="center" valign="middle">
							<th></th>
							<th align="center">회원번호</th>
							<th align="center">회원 아이디</th>
							<th align="center">이름</th>
							<th align="center">연락처</th>
							<th align="center">이메일</th>
							<th align="center">등록일</th>
						</tr>
						<c:if test="${empty lists}">
						<tr>
							<td colspan="7" align="center">조건에 맞는 회원이 없습니다.</td>
						</tr>
						</c:if>
						<c:if test="${!empty lists}">
						<c:forEach items="${lists}" var="member">
						<tr align="center" valign="middle">
							<td width="48" style="background-color:black;">
								<img width="36px" src="${member.m_picture }">
							</td>
							<td align="center">
								<a href="<c:url value='/memberDetail?num=${member.m_num}' />">${member.m_num}</a>
							</td>
							<td align="center">
								<a href="<c:url value='/memberDetail?num=${member.m_num}' />">${member.m_id}</a>
							</td>
							<td align="center">
								<a href="<c:url value='/memberDetail?num=${member.m_num}' />">${member.m_name}</a>
							</td>
							<td align="center">${member.m_ph}</td>
							<td align="center">${member.m_email}</td>
							<td align="center">
								<fmt:formatDate value="${member.m_date}" type="date" />
							</td>
						</tr>
						</c:forEach>
						</c:if>
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
</body>
</html>