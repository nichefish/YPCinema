<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="icon" href="img/fvc.jpg">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(document).ready(function() {
	if ($("#user").is(":checked")) {
		$("#id").css('background-color', 'white');
		$("#pass").css('background-color', 'white');
		$("#register").html("&nbsp;<a href='register'>회원가입</a>");
	} else if ($("#company").is(":checked")) {
		$("#id").css('background-color', '#beefff');
		$("#pass").css('background-color', 'beefff');
		$("#register").html("&nbsp;<a href='companyRegister'>외부업체가입</a>");
	}
})
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
		if($("#autoLogin").prop('checked')) {
			alert("자동로그인 기능이 체크되었습니다. 보안에 유의해주세요.");
		}
		$("#frm").submit();
	});
	$("#user").click(function() {
		$("#id").val("");
		$("#pass").val("");
		$("#id").attr('placeholder', '아이디');
// 		$("#id").css('background-color', 'white');
// 		$("#pass").css('background-color', 'white');
		$("#register").html("&nbsp;<a href='register'>회원가입</a>");
		
	});
	$("#company").click(function() {
		$("#id").val("");
		$("#pass").val("");
		$("#id").attr('placeholder', '외부업체 아이디');
// 		$("#id").css('background-color', '#ffefd5');
// 		$("#pass").css('background-color', '#ffefd5');
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

<div class="main-content-wrapper section-padding-100" >
 	<div class="text-center">
 	<img src="<c:url value='/img/logo_1-4.png' />" alt="YGVCinema Login Logo" style="width:200px;">
    </div>
 	<div class="container" align="center" style="width:30%;">
 		<p>생활의 즐거움 Life Theater<br/>양평시네마에 오신 걸 환영합니다.</p>

		<form:form action="login" class="user" name="frm" id="frm" method="POST" commandName="loginCommand">
			

				회원 <form:radiobutton path="admin" id="user" value="0" checked="true" />
				외부업체 <form:radiobutton path="admin" id="company" value="1"/>	
			
			<hr>
			<div class="form-group" >
				<form:input path="id" id="id" class="form-control form-control-user" placeholder="아이디" />
			</div>
			<div class="form-group" >	
				<form:password path="pass" id="pass" class="form-control form-control-user" placeholder="비밀번호"/>
			</div>
			   <div class="form-group">
			   			<form:checkbox path="idStore" id="idStore" />
                        <label  for="ex_chk3">아이디저장</label>
                     	<form:checkbox path="autoLogin" id="autoLogin" />
                        <label  for="ex_chk3">자동로그인</label>
                    </div>	
                    	
					<input type="submit" id="btn" value="Login" class="btn btn-primary btn-user btn-block"/>
				<span style="color:red;"><form:errors path="id" /><form:errors path="pass" /></span>
				

				<hr>
				<div class="text-center">
                    <a class="small" id="register" href="register">회원가입</a>
                  </div>
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