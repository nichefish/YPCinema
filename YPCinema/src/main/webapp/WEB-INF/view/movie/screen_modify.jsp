<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
</head>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
		<p>양평시네마 <b>${screenCommand.theater_name}</b> <b>[${screenCommand.screen_name}]</b> 상영관 수정</p>
		<form:form name="frm" id="frm" method="POST" commandName="screenCommand">
			<table width="60%" border="1" align="center" >
			 	<tr>
			 		<td width="200">상영관 이름</td>
			 		<td width="400">
			 			<form:hidden path="screen_num" />
			 			<form:hidden path="theater_num" />
			 			<form:input path="screen_name" id="userPw" size="12" maxlength="10" />
			 			<form:errors path="screen_name" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">좌석 배치 행(?-?-?)</td>
			 		<td>
			 			<form:input path="screen_row" id="screen_row" placeholder="0-0-0" size="12" maxlength="10" />
			 			<span style="color:red;"><form:errors path="screen_row" /></span>
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">좌석 배치 열</td>
			 		<td>
			 			<form:input path="screen_col" id="screen_col" size="12" maxlength="10" />
			 			<span style="color:red;"><form:errors path="screen_col" /></span>
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">총 좌석 수</td>
			 		<td>
			 			<form:hidden path="screen_max_seat" id="screen_max_seat" size="12" maxlength="10" />
			 			<input type="text" id="screen_max_seat_show" size="12" maxlength="10" value="${screenCommand.screen_max_seat}" disabled >
			 		</td>
			 	</tr>
				<tr>
					<td width="200">스크린 규모등급</td>
					<td>
						<input type="hidden" name="screen_rating" id="screen_rating" value="${screenCommand.screen_rating}">
						<input type="text" name="screen_rating_show" id="screen_rating_show" value="${screenCommand.screen_rating}" size="12" value="" disabled>
						(60- D, 60~120 C, 120~200 B, 200+ A)
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="상영관 정보 수정" />
						<input type="reset" value="리셋" />
						<input type="button" onclick="location.href='detail?num=${screenCommand.theater_num}'" value="뒤로가기" />
			 		</td>
				</tr>
			</table>
		</form:form>
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
   <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript">
$(function() {
	$("#screen_row").change(function() {
		var strArray = $("#screen_row").val().split('-');
		var number = Number(strArray[0]) + Number(strArray[1]) + Number(strArray[2]);
		$("#screen_max_seat").val(number*Number($("#screen_col").val()));
		
		alert(number*Number($("#screen_col").val()));
		
		$("#screen_max_seat_show").val(number*Number($("#screen_col").val()));
	    var val = $("#screen_max_seat").val();
	    if (val < 60) {
	    	$("#screen_rating").val('D');
	    	$("#screen_rating_show").val('D');
	    } else if (val >= 60 & val < 120) {
	    	$("#screen_rating").val('C');
	    	$("#screen_rating_show").val('C');
	    } else if (val >= 120 & val < 200) {
	    	$("#screen_rating").val('B');
	    	$("#screen_rating_show").val('B');
	    } else if (val >= 200) {
	    	$("#screen_rating").val('A');
	    	$("#screen_rating_show").val('A');
	    };
	})
	$("#screen_col").change(function() {
		var strArray = $("#screen_row").val().split('-');
		var number = Number(strArray[0]) + Number(strArray[1]) + Number(strArray[2]);
		$("#screen_max_seat").val(number*Number($("#screen_col").val()));
		$("#screen_max_seat_show").val(number*Number($("#screen_col").val()));
	    var val = $("#screen_max_seat").val();
	    if (val < 60) {
	    	$("#screen_rating").val('D');
	    	$("#screen_rating_show").val('D');
	    } else if (val >= 60 & val < 120) {
	    	$("#screen_rating").val('C');
	    	$("#screen_rating_show").val('C');
	    } else if (val >= 120 & val < 200) {
	    	$("#screen_rating").val('B');
	    	$("#screen_rating_show").val('B');
	    } else if (val >= 200) {
	    	$("#screen_rating").val('A');
	    	$("#screen_rating_show").val('A');
	    };
	})
	$("#frm").submit(function() {
		if ($("#screen_max_seat").val() == 0 || $("#screen_row").val() == "0-0-0") {
			alert("좌석 수는 0이 될 수 없습니다.");
		} else {
		    var val = $("#screen_max_seat").val();
		    if (val < 60) {
		    	$("#screen_rating").val('D');
		    	$("#screen_rating_show").val('D');
		    } else if (val >= 60 & val < 120) {
		    	$("#screen_rating").val('C');
		    	$("#screen_rating_show").val('C');
		    } else if (val >= 120 & val < 200) {
		    	$("#screen_rating").val('B');
		    	$("#screen_rating_show").val('B');
		    } else if (val >= 200) {
		    	$("#screen_rating").val('A');
		    	$("#screen_rating_show").val('A');
		    };
		}
	})
});
</script>
</body>
</html>