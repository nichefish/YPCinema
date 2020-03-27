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
<%@ include file="../navigation.jsp" %>

<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
		<form:form action="companyJoinAction" name="frm" id="frm" method="post" commandName="companyCommand">
		<!-- <input type="hidden" name="confirmNum" id="confirmNum" value="1"> 여기 value 1! 중복체크 -->
			<table width="600" align="center" border=1 >
			 	<tr>
			 		<td width="200">사용자 ID</td>
			 		<td width="400">
			 			<form:input path="c_id" size="12" maxlength="10" id="userId" />
			 			<form:errors path="c_id" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">비밀번호</td>
			 		<td width="400">
			 			<form:password path="c_pass" id="userPw" size="12" maxlength="10" />
			 			<form:errors path="c_pass" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">비밀번호 확인</td>
			 		<td width="400">
			 			<form:password path="c_pass_con" id="userPwCon" size="12" maxlength="10" />
			 			<form:errors path="c_pass_con" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">사업자 번호</td>
			 		<td width="400">
			 			<form:input path="c_companynum" size="12" maxlength="10" id="companynum" />
			 			<form:errors path="c_companynum" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">대표자 이름</td>
			 		<td width="400">
			 			<form:input path="c_ceoname" id="ceoName" size="12" maxlength="10" />
			 			<form:errors path="c_ceoname" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">협력업체 이름</td>
			 		<td width="400">
			 			<form:input path="c_comname" id="comName" size="12" maxlength="10" />
			 			<form:errors path="c_comname" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">성별</td>
			 		<td width="400">
			 			남자 : <form:radiobutton path="c_gen" value="M" id="userGender" checked="checked" />
			 			여자 : <form:radiobutton path="c_gen" value="F" id="userGender" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td width="200">생년월일 (<u>yyyy-MM-dd</u>)</td>
			 		<td width="400">
			 			<form:input path="c_birth" id="userBirth" size="12" maxlength="10" placeholder="yyyy-MM-dd" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
			 			<form:errors path="c_birth" />
			 		</td>
			 	</tr>
				<tr>
					<td width = 200 ><b>대표자 연락처</b> (휴대폰 번호)</td>
					<td width = 400 >
						<form:input path="c_ceoph" id="ceoPh1" size="30" maxlength="28" />
						<form:errors path="c_ceoph" />
					</td>
				</tr>
				<tr>
					<td width = 200 ><b>협력업체 연락처</b> (휴대폰 번호)</td>
					<td width = 400 >
						<form:input path="c_comph" id="comPh1" size="30" maxlength="28" />
						<form:errors path="c_comph" />
					</td>
				</tr>
			 	<tr>
			 		<td width=200><b>*이메일 주소</b></td>
					<td width=400>
						<form:input path="c_email" id="c_email" size="30" maxlength="28" />
						<form:errors path="c_email" />
					</td>
				</tr>
				<tr>
					<td>우편번호 </td>
					<td><form:hidden path="c_zip" id="c_zip" /><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><input type="text" id="c_zip_show" placeholder="우편번호" value="${companyCommand.c_zip}" disabled /></td>	
				</tr>
				<tr>
					<td>대표자 주소 </td>
					<td>
						<form:hidden path="c_ceoaddr" id="c_ceoaddr" /><input type="text" id="c_ceoaddr_show" style="width:99%;" placeholder="도로명주소" value="${companyCommand.c_ceoaddr}" disabled="disabled" /><br/>
						<form:input path="c_ceoaddr2" id="c_ceoaddr2" style="width:75%;" placeholder="상세주소"/>
					</td>
				</tr>
				<tr>
					<td>우편번호 </td>
					<td><form:hidden path="c_zip1" id="c_zip1" /><input type="button" onclick="sample5_execDaumPostcode()" value="우편번호 찾기"><input type="text" id="c_zip1_show" placeholder="우편번호" value="${companyCommand.c_zip1}" disabled /></td>	
				</tr>
				<tr>
					<td>협력업체 주소 </td>
					<td>
						<form:hidden path="c_comaddr" id="c_comaddr" /><input type="text" id="c_comaddr_show" style="width:99%;" placeholder="도로명주소" value="${companyCommand.c_comaddr}" disabled="disabled" /><br/>
						<form:input path="c_comaddr2" id="c_comaddr2" style="width:75%;" placeholder="상세주소"/>
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
			document.getElementById('c_zip').value = data.zonecode;
			document.getElementById('c_zip_show').value = data.zonecode;
			document.getElementById("c_ceoaddr").value = roadAddr;
			document.getElementById("c_ceoaddr_show").value = roadAddr;
			
		}
	}).open();
}
</script>
<script>
	function sample5_execDaumPostcode() {
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
				document.getElementById('c_zip1').value = data.zonecode;
				document.getElementById('c_zip1_show').value = data.zonecode;
				document.getElementById("c_comaddr").value = roadAddr;
				document.getElementById("c_comaddr_show").value = roadAddr;
				
			}
		}).open();
}
</script>
</body>
</html>