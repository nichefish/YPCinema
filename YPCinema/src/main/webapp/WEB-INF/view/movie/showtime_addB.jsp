<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	상영관: <br/>
	<form:select path="screen_num" size="4" id="screen">
		<option label="상영관 선택" />
		<c:forEach items="${lists}" var="screen">
		<form:option value="${screen.screen_num}" label="${screen.screen_name} ${screen.screen_rating }" />
		</c:forEach>
	</form:select>
</body>
</html>