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