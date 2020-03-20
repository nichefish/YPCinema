<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Style CSS -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/themify-icons.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
	<link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/owl.carousel.css">
    <link rel="stylesheet" href="../css/style.css">
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
</head>
<body>
	<header class="header-area">
		<jsp:include page="/WEB-INF/view/navigation.jsp" flush="true" />
	</header>
    
<c:if test="${empty authInfo}">
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
		<form:form action="login" name="frm" id="frm" method="POST" commandName="loginCommand">
			<table border="1">
				<tr>
					<td colspan="3" align="right">
						<input type="radio" name="admin">회원
						<input type="radio" name="admin">외부업체
						<form:checkbox path="autoLogin" />자동 로그인
					</td>
				</tr>
				<tr>
					<td>아이디 입력</td>
					<td><form:input path="id" id="id" /><form:errors path="id" /></td>
					<td><form:checkbox path="idStore" />아이디 저장</td>
				</tr>
				<tr>
					<td>비밀번호 입력</td>
					<td><form:password path="pass" id="pass" /><form:errors path="pass" /></td>
					<td><input type="submit" id="btn" value="로그인" /></td>
				</tr>
				<tr>
					<td colspan="3" align="right">
						<a href="#">아이디 찾기</a>
						<a href="#">비밀번호 찾기</a>
						<a href="register">회원가입</a>
					</td>
				</tr>
			</table>
		</form:form>
		현재 ID: <c:out value="${authInfo.id}" />
	</div>
</div>
</c:if>

<c:if test="${!empty authInfo}">
	<% response.sendRedirect("main"); %>
</c:if>
</body>
</html>