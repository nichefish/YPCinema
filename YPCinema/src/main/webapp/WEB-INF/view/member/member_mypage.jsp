<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="icon" href="img/fvc.jpg">
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
 		<div class="relCon" align="center">
			<table class="table table-bordered" id="dataTable" style="width:600px;align:center;color:black;">
				<tr>
					<td colspan="2" align="center">
						<p>[<img src="${memberCommand.m_picture}" width="120">]</p>
						<p>프로필 이미지</p>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${memberCommand.m_id}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${memberCommand.m_name}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<c:choose >
						  	<c:when test="${memberCommand.m_gen == 'M'}">남자</c:when>
						  	<c:when test="${memberCommand.m_gen == 'F'}">여자</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><fmt:formatDate value='${memberCommand.m_birth}' type='date' pattern='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${memberCommand.m_ph}</td></tr>
				<tr>
					<th>이메일</th>
					<td>${memberCommand.m_email}</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>${memberCommand.m_zip}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${memberCommand.m_addr1} ${memberCommand.m_addr2}</td>
				</tr>
				<tr>
					<th>회원등급</th>
					<td>${memberCommand.m_class}</td>
				</tr>
				<tr>
					<th>회원가입일</th>
					<td><fmt:formatDate value='${memberCommand.m_date}' type='date' pattern='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" onclick="location.href='<c:url value="/myStatistic" />'" name="btn" id="btn" value="나의 이용내역 및 통계">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" onclick="location.href='<c:url value="/myPage/modify" />'" name="modify" id="modify" value="회원정보 수정">
						<input type="button" name="delete" id="delete" value="탈퇴">
						<input type="button" onclick="location.href='/YPCinema/mySeries'" name="modify" id="modify" value="뒤로가기">
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<footer class="footer-area">
	<%@ include file="../footer.jsp"%>
</footer>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/active.js"></script>
</body>
</html>