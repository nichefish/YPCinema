<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
		<table border="1">
			<tr>
				<td colspan="2" align="center">
					<p>[${movieCommand.movie_poster_url}]</p>
					<p>프로필 이미지</p><br/>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${movieCommand.movie_num}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${movieCommand.movie_title}</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${movieCommand.movie_director}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${movieCommand.movie_nation}</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><fmt:formatDate value='${movieCommand.movie_date}' type='date' pattern='yyyy-MM-dd' /></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>${movieCommand.movie_genre}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${movieCommand.movie_plot}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${movieCommand.movie_age}</td>
			</tr>
			<tr>
				<td>회원등급</td>
				<td>${movieCommand.movie_runtime}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<p>[${movieCommand.movie_still_url}]</p>
					<p>프로필 이미지</p><br/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" onclick="location.href='modify?num=${movieCommand.movie_num}'" name="modify" id="modify" value="회원정보 수정">
					<input type="button" name="modify" id="modify" value="탈퇴">
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>