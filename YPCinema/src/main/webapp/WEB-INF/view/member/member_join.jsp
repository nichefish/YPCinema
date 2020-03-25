<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
	<header class="header-area">
		<%@ include file="../navigation.jsp" %>
	</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
		<form:form action="memberJoinAction" name="frm" id="frm" method="post" commandName="memberCommand">
		<!-- <input type="hidden" name="confirmNum" id="confirmNum" value="1"> 여기 value 1! 중복체크 -->
			<table width="600" align="center" border=1 >
				
			 	<tr>
			 		<td width="200">사용자 ID</td>
			 		<td width="400">
			 			<form:input path="m_id" size="12" maxlength="10" id="userId" />
			 			<form:errors path="m_id" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">비밀번호</td>
			 		<td width="400">
			 			<form:password path="m_pass" id="userPw" size="12" maxlength="10" />
			 			<form:errors path="m_pass" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">비밀번호 확인</td>
			 		<td width="400">
			 			<form:password path="m_pass_con" id="userPwCon" size="12" maxlength="10" />
			 			<form:errors path="m_pass_con" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">사용자 이름</td>
			 		<td width="400">
			 			<form:input path="m_name" id="userName" size="12" maxlength="10" />
			 			<form:errors path="m_name" />
			 			<input type="hidden" name="m_picture" value="<c:url value='/img/empty_person.png' />" >
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">성별</td>
			 		<td width="400">
			 			남자 : <form:radiobutton path="m_gen" value="M" id="userGender" checked="checked" />
			 			여자 : <form:radiobutton path="m_gen" value="F" id="userGender" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">생년월일 (<u>yyyy-MM-dd</u>)</td>
			 		<td width="400">
			 			<form:input path="m_birth" id="userBirth" size="12" maxlength="10" placeholder="yyyy-MM-dd" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
			 			<form:errors path="m_birth" />
			 		</td>
			 	</tr>
				<tr>
					<td width = 200 ><b>*연락처</b> (휴대폰 번호)</td>
					<td width = 400 >
						<form:input path="m_ph" id="userPh1" size="30" maxlength="28" />
						<form:errors path="m_ph" />
					</td>
				</tr>
			 	<tr>
			 		<td width=200><b>*이메일 주소</b></td>
					<td width=400>
						<form:input path="m_email" id="m_email" size="30" maxlength="28" />
						<form:errors path="m_email" />
					</td>
				</tr>
				<tr>
					<td>우편번호 </td>
					<td><form:hidden path="m_zip" id="m_zip" /><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><input type="text" id="m_zip_show" placeholder="우편번호" value="${memberCommand.m_zip}" disabled /></td>	
				</tr>
				<tr>
					<td>주소 </td>
					<td>
						<form:hidden path="m_addr1" id="m_addr1" /><input type="text" id="m_addr1_show" style="width:99%;" placeholder="도로명주소" value="${memberCommand.m_addr1}" disabled="disabled" /><br/>
						<form:input path="m_addr2" id="m_addr2" style="width:75%;" placeholder="상세주소"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="회원가입" />
						<input type="reset" value="리셋" />
						<input type="button" value="뒤로가기" />
			 		</td>
				</tr>
			</table>
		</form:form>
	</div>
</div>
<script>
if("${err}" == "1") {
	alert("입력이 되지 않았습니다.");
}
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample4_execDaumPostcode() {
	new daum.Postcode(
	{
		oncomplete : function(data) {
			var roadAddr = data.roadAddress;
			var extraRoadAddr = '';
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			document.getElementById('m_zip').value = data.zonecode;
			document.getElementById('m_zip_show').value = data.zonecode;
			document.getElementById("m_addr1").value = roadAddr;
			document.getElementById("m_addr1_show").value = roadAddr;
		}
	}).open();
}
</script>
</body>
</html>