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
					<p>[${companyCommand.c_picture}]</p>
					<p>프로필 이미지</p><br/>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${companyCommand.c_id}</td>
			</tr>
			<tr>
				<td>대표자 이름</td>
				<td>${companyCommand.c_ceoname}</td>
			</tr>
			<tr>
				<td>협력업체 이름</td>
				<td>${companyCommand.c_comname}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<c:choose >
					  	<c:when test="${companyCommand.c_gen == 'M'}">남자</c:when>
					  	<c:when test="${companyCommand.c_gen == 'F'}">여자</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><fmt:formatDate value='${companyCommand.c_birth}' type='date' pattern='yyyy-MM-dd' /></td>
			</tr>
			<tr>
				<td>대표자 연락처</td>
				<td>${companyCommand.c_ceoph}</td></tr>
			<tr>
			<tr>
				<td>협력업체 연락처</td>
				<td>${companyCommand.c_comph}</td></tr>
			<tr>
				<td>이메일</td>
				<td>${companyCommand.c_email}</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>${companyCommand.c_zip}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${companyCommand.c_ceoaddr} ${companyCommand.c_ceoaddr2}</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>${companyCommand.c_zip1}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${companyCommand.c_comaddr} ${companyCommand.c_comaddr2}</td>
			</tr>
			<tr>
				<td>회원등급</td>
				<td>${companyCommand.c_class}</td>
			</tr>
			<tr>
				<td>회원가입일</td>
				<td><fmt:formatDate value='${companyCommand.c_date}' type='date' pattern='yyyy-MM-dd' /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="location.href='<c:url value="/companyMyPage/modify" />'" name="modify" id="modify" value="회원정보 수정">
					<input type="button" name="modify" id="modify" value="탈퇴">
					<input type="button" onclick="javascript:history.back();" name="modify" id="modify" value="뒤로가기">
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>