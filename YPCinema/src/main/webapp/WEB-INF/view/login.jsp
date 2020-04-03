<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	$("#id").focus();
	$("#btn").click(function(){
		if($("#id").val() == "") {
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false;
		}
		if($("#pass").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#pass").focus();
			return false;
		}
		$("#frm").submit();
	});
	$("#user").click(function() {
		$("#id").val("");
		$("#pass").val("");
		$("#id").css('background-color', 'white');
		$("#pass").css('background-color', 'white');
		$("#register").html("&nbsp;<a href='register'>회원가입</a>");
		
	});
	$("#company").click(function() {
		$("#id").val("");
		$("#pass").val("");
		$("#id").css('background-color', 'blue');
		$("#pass").css('background-color', 'blue');
		$("#register").html("&nbsp;<a href='companyRegister'>외부업체가입</a>");
	});
});
</script>
</head>
<body>
<header class="header-area">
	<%@ include file="navigation.jsp"%>
</header>
<c:if test="${empty authInfo}">
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 		<p>양평시네마에 오신 걸 환영합니다.</p>
		<form:form action="login" name="frm" id="frm" method="POST" commandName="loginCommand">
			<div width="60%">
			<table border="0">
				<tr>
					<td >
					</td>
					<td align="center">
						회원 <input type="radio" name="admin" id="user" value="0" checked="true">
						외부업체 <input type="radio" name="admin" id="company" value="1">&nbsp;
					</td>
					<td rowspan="2">
						&nbsp;<form:checkbox path="idStore" />아이디 저장<br />
						&nbsp;<form:checkbox path="autoLogin" />자동 로그인
					</td>
				</tr>
				<tr>
					<td>아이디 입력</td>
					<td><form:input path="id" id="id" /><form:errors path="id" /></td>
				</tr>
				<tr>
					<td>비밀번호 입력</td>
					<td><form:password path="pass" id="pass" /><form:errors path="pass" /></td>
					<td>&nbsp;&nbsp;<input type="submit" id="btn" value="로그인" /></td>
				</tr>
			</table>
			</div>
			<table border="0">
				<tr>
					<td colspan="4" align="right">
						<a href="#">아이디 찾기</a>
						<a href="#">비밀번호 찾기</a>
						</td>
					<td align="right">
						<div id="register" style="display:inline;">
							&nbsp;<a href="register">회원가입</a>
						</div>
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</div>
</c:if>
<c:if test="${!empty authInfo}">
	<% response.sendRedirect("main"); %>
</c:if>
<footer class="footer-area">
      <%@ include file="footer.jsp"%>
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