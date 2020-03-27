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
		<p>양평시네마 <b>${screenCommand.theater_name}</b> <b>[${screenCommand.screen_name}]</b> 상영관 정보</p>
		<table width="600" align="center" border=1 >
		 	<tr>
		 		<td width="200">상영관 이름</td>
		 		<td width="400">
		 			${screenCommand.screen_name} (${screenCommand.screen_num})
		 		</td>
		 	</tr>
		 	<tr>
		 		<td width="200">총 좌석 수</td>
		 		<td width="400">
		 			${screenCommand.screen_max_seat}
		 		</td>
		 	</tr>
		 	<tr>
		 		<td width="200">좌석 배치 행(?-?-?)</td>
		 		<td width="400">
		 			${screenCommand.screen_row}
		 		</td>
		 	</tr>
			<tr>
				<td width="200">스크린 규모등급</td>
				<td width="400">
					${screenCommand.screen_rating}
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<c:if test="${authInfo.m_admin ne '0' && authInfo.mode ne '0' && !empty authInfo}">	<!-- 이용자 및 비로그인 아니면 -->
					<input type="button" onclick="location.href='modifyScreen?num=${screenCommand.screen_num}'" value="수정" />
					<input type="button" onclick="location.href='deleteScreen?num=${screenCommand.screen_num}'" value="삭제(구현안함)" />
					</c:if>
					<input type="button" onclick="location.href='detail?num=${screenCommand.theater_num}'" value="뒤로가기" />
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