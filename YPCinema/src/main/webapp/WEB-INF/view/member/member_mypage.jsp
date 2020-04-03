<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
</head>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<body>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
		<table border="1">
			<tr>
				<td colspan="2" align="center">
					<p>[<img src="${memberCommand.m_picture}" width="240">]</p>
					<p>프로필 이미지</p><br/>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${memberCommand.m_id}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${memberCommand.m_name}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<c:choose >
					  	<c:when test="${memberCommand.m_gen == 'M'}">남자</c:when>
					  	<c:when test="${memberCommand.m_gen == 'F'}">여자</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><fmt:formatDate value='${memberCommand.m_birth}' type='date' pattern='yyyy-MM-dd' /></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${memberCommand.m_ph}</td></tr>
			<tr>
				<td>이메일</td>
				<td>${memberCommand.m_email}</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>${memberCommand.m_zip}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${memberCommand.m_addr1} ${memberCommand.m_addr2}</td>
			</tr>
			<tr>
				<td>회원등급</td>
				<td>${memberCommand.m_class}</td>
			</tr>
			<tr>
				<td>회원가입일</td>
				<td><fmt:formatDate value='${memberCommand.m_date}' type='date' pattern='yyyy-MM-dd' /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="location.href='<c:url value="/myStatistic" />'" name="modify" id="modify" value="나의 내역">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="location.href='<c:url value="/myPage/modify" />'" name="modify" id="modify" value="회원정보 수정">
					<input type="button" name="modify" id="modify" value="탈퇴">
					<input type="button" onclick="javascript:history.back();" name="modify" id="modify" value="뒤로가기">
				</td>
			</tr>
		</table>
	</div>
</div>
<footer class="footer-area">
	<%@ include file="../footer.jsp"%>
</footer>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
   <!-- Popper js -->
   <script src="js/popper.min.js"></script>
   <!-- Bootstrap js -->
   <script src="js/bootstrap.min.js"></script>
   <!-- Plugins js -->
   <script src="js/plugins.js"></script>
   <!-- Active js -->
   <script src="js/active.js"></script>
</body>
</html>