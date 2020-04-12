<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
</head>
<body>
<select name="c_spe" id="c_spe">
	<option>-----</option>
	<c:if test="${menuType eq '영화'}">
	<option value="영화">영화</option>
	</c:if>
	<c:forEach items="${menuNames}" var="mn" step="1">
		<option value="${mn.menu_name}">${mn.menu_name}</option>
	</c:forEach>
</select>

</body>
</html>