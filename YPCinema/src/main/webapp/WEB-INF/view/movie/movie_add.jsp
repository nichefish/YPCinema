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
		<form:form method="GET" commandName="movieCommand">
			<p>(한국영화데이터베이스KMDb 영화정보API)</p>
			<p>영화번호 검색: <form:input path="movie_num" id="movie_num" maxlength="6" placeholder="영화번호(MovieId) 6자리(ex. K14382)를 입력하세요." /></p>
			<input type="submit" value="검색" />
			<input type="reset" value="리셋" />
			<p>https://www.kmdb.or.kr/info/api/apiDetail/6</p>
		</form:form>
	
		<form:form name="frm" id="frm" method="POST" commandName="movieCommand">
			<table width="600" align="center" border=1 >
			 	<tr>
			 		<td width="200">영화번호</td>
			 		<td width="400">
			 			<input type="text" value="${movieCommand.movie_num}" disabled />
			 			<form:errors path="movie_num" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">영화제목</td>
			 		<td width="400">
			 			<form:input path="movie_title" id="userPw" size="12" maxlength="10" />
			 			<form:errors path="movie_title" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">감독명</td>
			 		<td width="400">
			 			<form:input path="movie_director" id="userPwCon" size="12" maxlength="10" />
			 			<form:errors path="movie_director" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">제작국가</td>
			 		<td width="400">
			 			<form:input path="movie_nation" id="userName" size="12" maxlength="10" />
			 			<form:errors path="movie_nation" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">개봉일 (<u>yyyy-MM-dd</u>)</td>
			 		<td width="400">
			 			<form:input path="movie_date" id="userBirth" size="12" maxlength="10" placeholder="yyyy-MM-dd" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
			 			<form:errors path="movie_date" />
			 		</td>
			 	</tr>
				<tr>
					<td width="200">장르</td>
					<td width="400">
						<form:input path="movie_genre" id="userPh1" size="30" maxlength="28" />
						<form:errors path="movie_genre" />
					</td>
				</tr>
			 	<tr>
			 		<td width="200">줄거리</td>
					<td width="400">
						<form:textarea path="movie_plot" id="movie_plot" style="width:99%;" />
						<form:errors path="movie_plot" />
					</td>
				</tr>
			 	<tr>
			 		<td width="200">관람연령기준</td>
					<td width="400">
						<form:input path="movie_age" id="m_email" size="30" maxlength="28" />
						<form:errors path="movie_age" />
					</td>
				</tr>
				<tr>
			 		<td width="200">상영시간</td>
					<td width="400">
						<form:input path="movie_runtime" id="m_email" size="30" maxlength="28" />
						<form:errors path="movie_runtime" />
					</td>
				</tr>
				<tr>
			 		<td width="200">포스터이미지url</td>
					<td width="400">
						<form:input path="movie_poster_url" id="m_email" size="30" maxlength="28" />
						<form:errors path="movie_poster_url" />
					</td>
				</tr>
				<tr>
			 		<td width="200">스틸이미지url</td>
					<td width="400">
						<form:input path="movie_still_url" id="m_email" size="30" maxlength="28" />
						<form:errors path="movie_still_url" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="영화정보 등록" />
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