<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="icon" href="../img/core-img/favicon.ico">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	$("#pro").click(function() {
		if ($("input:checkbox[name='agree']").is(":checked") == false) {
			alert("약관에 동의하지 않으면 가입할 수 없습니다!");
			$("#frm").submit();
		} else {
			alert("약관에 동의하셨습니다.");
			$("#frm").submit();
		}
	});
});
</script>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
		<h2>약관 내용</h2>
		<p>약관!</p>
		<form:form method="post" id="frm" commandName="yakganCommand">
			<label>
				<form:checkbox path="agree" id="agree" value="true" />&nbsp;동의합니다.<br/>
				<span style="color:red;"> &nbsp;<form:errors path="agree" /></span>
				<p><input type="button" id="pro" value="다음으로 진행하기" />&nbsp;<input type="button" id="btn" value="메인으로"></p>
			</label>
		</form:form>
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
<script>
$(function() {
	$("#btn").click(function() {
		var test = confirm("회원가입을 포기하고 메인 화면으로 돌아가시겠습니까?");
		if (test) {
			location.href = "main";
		}
	});
});
</script>
</body>
</html>