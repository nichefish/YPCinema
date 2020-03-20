<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="member.register" /></title>	<!-- 요런 식으로 코드를 집어넣고. 유지보수할 때 label.property만 건드리면 되는 거다.. -->
</head>
<body>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
		<h2>약관 내용</h2>
		<p>약관!<spring:message code="term" /></p>
		<form method="post">
			<label>
				<input type="checkbox" name="agree" value="true">동의합니다.
			</label>
			<input type="submit" value="다음으로 진행하기" />
		</form>
	</div>
</div>
</body>
</html>