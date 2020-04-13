<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="icon" href="../img/fvc.jpg">
<link rel="stylesheet" type="text/css" href="css/goodsUp.css" />
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
	$("#API_form").submit(function() {
		if ($("#movie_num").val() == "") {
			alert("검색할 영화번호를 입력해주세요.");
		}
	});
});
</script>
</head>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 		<h2>양평시네마 상영영화 등록</h2>
		<form:form id="API_form" method="GET" commandName="movieCommand">
			<p>
				영화번호 검색: <form:input path="movie_num" id="movie_num" maxlength="6" placeholder="영화번호(MovieId) 6자리(ex. K14382)를 입력하세요." /> <input type="submit" value="검색" /> <input type="reset" value="리셋" /><br />
				(한국영화데이터베이스KMDb 영화정보API)<br/>
				<span style="color:red;"><form:errors path="movie_num" /></span>
			</p>
			<p><a href='https://www.kmdb.or.kr/info/api/apiDetail/6'>https://www.kmdb.or.kr/info/api/apiDetail/6</a></p>
		</form:form>
		<form:form name="frm" id="frm" method="POST" commandName="movieCommand">
		<div class="table11" align="center">
			<table width="60%" align="center" border=1 >
				<tbody>
			 	<tr>
			 		<td width="200">영화번호</td>
			 		<td width="400">
			 			<input type="text" size="14" value="${movieCommand.movie_num}" disabled />
			 			<span style="color:red;"><form:errors path="movie_num" /></span>
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">영화제목</td>
			 		<td width="400">
			 			<form:input path="movie_title" id="userPw" size="14" maxlength="10" />
			 			<span style="color:red;"><form:errors path="movie_title" /></span>
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">감독명</td>
			 		<td width="400">
			 			<form:input path="movie_director" id="userPwCon" size="14" maxlength="10" />
			 			<span style="color:red;"><form:errors path="movie_director" /></span>
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">제작국가</td>
			 		<td width="400">
			 			<form:input path="movie_nation" id="userName" size="14" maxlength="10" />
			 			<span style="color:red;"><form:errors path="movie_nation" /></span>
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">개봉일 (<u>yyyy-MM-dd</u>)</td>
			 		<td width="400">
			 			<form:input path="movie_date" id="userBirth" size="14" maxlength="10" placeholder="yyyy-MM-dd" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
			 			<span style="color:red;"><form:errors path="movie_date" /></span>
			 		</td>
			 	</tr>
				<tr>
					<td width="200">장르</td>
					<td width="400">
						<form:input path="movie_genre" id="userPh1" size="30" maxlength="28" />
						<span style="color:red;"><form:errors path="movie_genre" /></span>
					</td>
				</tr>
			 	<tr>
			 		<td width="200">줄거리</td>
					<td width="400">
						<form:textarea path="movie_plot" id="movie_plot" style="width:99%;" />
						<span style="color:red;"><form:errors path="movie_plot" /></span>
					</td>
				</tr>
			 	<tr>
			 		<td width="200">관람연령기준</td>
					<td width="400">
						<form:input path="movie_age" id="movie_age" size="14" maxlength="28" />
						<span style="color:red;"><form:errors path="movie_age" /></span>
					</td>
				</tr>
				<tr>
			 		<td width="200">상영시간</td>
					<td width="400">
						<form:input path="movie_runtime" id="m_email" size="14" maxlength="28" />
						<span style="color:red;"><form:errors path="movie_runtime" /></span>
					</td>
				</tr>
				<tr>
			 		<td width="200">포스터이미지url</td>
					<td width="400">
						<form:input path="movie_poster_url" id="m_email" size="30" maxlength="28" />
						<span style="color:red;"><form:errors path="movie_poster_url" /></span>
					</td>
				</tr>
				<tr>
			 		<td width="200">스틸이미지url</td>
					<td width="400">
						<form:input path="movie_still_url" id="m_email" size="30" maxlength="28" />
						<span style="color:red;"><form:errors path="movie_still_url" /></span>
					</td>
				</tr>
				<tr>
			 		<td width="200">상영등급 가산점 (0~20)</td>
					<td width="400">
						<form:input path="movie_rating_plus" id="m_email" size="14" maxlength="28" placeholder="0" />
						<span style="color:red;"><form:errors path="movie_rating_plus" /></span>
					</td>
				</tr>
			</tbody>
			</table>
			</div>
			<table width="60%" align="center" border="0">
				<tr>
					<td colspan="2" align="center">
						<p><br />
							<input type="submit" value="영화정보 등록" />
							<input type="reset" id="reset_btn" value="리셋" />
							<input type="button" onclick="location.href='list'" value="뒤로가기" />
						</p>
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
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/active.js"></script>
</body>
</html>