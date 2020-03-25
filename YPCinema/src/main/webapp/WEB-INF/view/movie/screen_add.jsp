<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<%@ include file="/WEB-INF/view/navigation.jsp" %>
	</header>
 
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
		<c:forEach items="${theaters}" var="theater">
			<tr align="center" valign="middle">
				<td align="center">
					<a href="<c:url value='/theater/detail?num=${theater.theater_num}' />">${theater.theater_name}</a>
				</td>
			</tr>
		</c:forEach>
		
		
		<form:form name="frm" id="frm" method="POST" commandName="screenCommand">
			<table width="600" align="center" border=1 >
			 	<tr>
			 		<td width="200">스크린번호(호실번호)</td>
			 		<td width="400">
			 			<form:input path="screen_num" id="userPw" size="12" maxlength="10" />
			 			<form:errors path="screen_num" />
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
			 		<td width="200">최대좌석</td>
			 		<td width="400">
			 			<form:input path="screen_max_seat" id="userPwCon" size="12" maxlength="10" />
			 			<form:errors path="screen_max_seat" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">스크린 행(?-?-?)</td>
			 		<td width="400">
			 			<form:input path="screen_row" id="userName" size="12" maxlength="10" />
			 			<form:errors path="screen_row" />
			 		</td>
			 	</tr>
				<tr>
					<td width="200">스크린 규모등급</td>
					<td width="400">
						<form:input path="screen_rating" id="userPh1" size="30" maxlength="28" />
						<form:errors path="screen_rating" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="상영관 정보 등록" />
						<input type="reset" value="리셋" />
						<input type="button" value="뒤로가기" />
			 		</td>
				</tr>
			</table>
		</form:form>
	</div>
</div>
</body>
</html>