<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
		<p>${memberCommand.m_name}님, 회원가입을 축하합니다. ${memberCommand.m_email}로 승인 내용이 (아직 안)갔습니다.</p>
		<p><a href="<c:url value='/main' />">메인으로</a></p>
	</div>
</div>
</body>
</html>