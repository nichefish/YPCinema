<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">	
		<form:form name="frm" id="frm" method="POST" commandName="showtimeCommand">
			<table width="600" align="center" border=1 >
			 	<tr>
			 		<td width="200">상영번호</td>
			 		<td width="400">
			 			<form:input path="show_num" id="userPw" size="12" maxlength="10" />
			 			<form:errors path="show_num" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">지점번호</td>
			 		<td width="400">
			 			<form:input path="theater_num" id="userPw" size="12" maxlength="10" />
			 			<form:errors path="theater_num" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">상영관번호</td>
			 		<td width="400">
			 			<form:input path="screen_num" id="userPwCon" size="12" maxlength="10" />
			 			<form:errors path="screen_num" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">영화번호</td>
			 		<td width="400">
			 			<form:input path="movie_num" id="userName" size="12" maxlength="10" />
			 			<form:errors path="movie_num" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">상영일 (<u>yyyy-MM-dd</u>)</td>
			 		<td width="400">
			 			<form:input path="show_date" type="date" id="userBirth" size="12" maxlength="10" placeholder="yyyy-MM-dd" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
			 			<form:errors path="show_date" />
			 		</td>
			 	</tr>
				<tr>
					<td width="200">상영시작시간</td>
					<td width="400">
						<form:input path="show_start" id="userPh1" size="30" maxlength="28" placeholder="hh:mm" pattern="\d{2}:\d{2}"/>
						<form:errors path="show_start" />
					</td>
				</tr>
			 	<tr>
			 		<td width="200">상영종료시간</td>
					<td width="400">
						<form:input path="show_end" id="userPh1" size="30" maxlength="28" placeholder="hh:mm" pattern="\d{2}:\d{2}"/>
						<form:errors path="show_end" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="상영일정 등록" />
						<input type="reset" value="리셋" />
						<input type="button" value="뒤로가기" />
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
</body>
</html>