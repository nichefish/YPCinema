<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="icon" href="../img/fvc.jpg">
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
		<form:form name="frm" id="frm" method="POST" enctype="multipart/form-data" commandName="memberCommand">
			<div class="relCon" align="center">
				<table class="table table-bordered" id="dataTable" style="width:600px;align:center;color:black;">
					<tr rowspan="2">
						<td colspan="2" align="center">
							<p id="img">[<img src="${memberCommand.m_picture}" width="120">]</p>
							<p>프로필 이미지<br/>
							<input type="button" id="add_btn" value="새 파일 업로드하기" style=""> / <input type="button" id="del_btn" value="업로드된 파일 삭제" style=""></p><br/>
							<div id="fileUploade"></div>
						</td>
					</tr>
				 	<tr>
				 		<th width="200">아이디</th>
				 		<td width="400">
				 			<input type="hidden" name="m_id" size="14" maxlength="10" value="${memberCommand.m_id}" />
				 			<input type="text" name="m_id" size="14" maxlength="10" value="${memberCommand.m_id}" disabled />
				 		</td>
				 	</tr>
				 	<tr>
				 		<th width="200">*비밀번호</th>
				 		<td width="400">
				 			<form:password path="m_pass" id="userPw" size="14" maxlength="10" /><br />
				 			<input type="hidden" name="m_pass_con" id="m_pass_con" size="14" maxlength="10" value="temp" /><br />
				 			<span style="color:red;"><form:errors path="m_pass" /></span>
				 		</td>
				 	</tr>
				 	<tr>
				 		<th width="200">새 비밀번호<br/>(비밀번호 변경시 입력)</th>
				 		<td width="400">
				 			<input type="password" name="m_new_pass" id="userPwCon" size="14" maxlength="10" /><br />
				 		</td>
				 	</tr>
				 	<tr>
				 		<th width="200">새 비밀번호 확인<br/>(비밀번호 변경시 입력)</th>
				 		<td width="400">
				 			<input type="password" name="m_new_pass_con" id="userPwCon" size="14" maxlength="10" /><br />
				 		</td>
				 	</tr>
				 	<tr>
				 		<th width="200">사용자 이름</th>
				 		<td width="400">
				 			<form:input path="m_name" size="14" maxlength="10" /><br />
				 			<span style="color:red;"><form:errors path="m_name" /></span>
				 		</td>
				 	</tr>
				 	<tr>
				 		<th width="200">성별</th>
				 		<td width="400">
				 			남자 : <form:radiobutton path="m_gen" value="M" id="userGender" />
				 			여자 : <form:radiobutton path="m_gen" value="F" id="userGender" /><br />
				 			<span style="color:red;"><form:errors path="m_gen" /></span>
				 		</td>
				 	</tr>
				 	<tr>
				 		<th width="200">생년월일<br />(<u>yyyy-MM-dd</u>)</th>
				 		<td width="400">
				 			<form:input path="m_birth" id="userBirth" size="14" maxlength="10" placeholder="yyyy-MM-dd" pattern="\d{4}-\d{1,2}-\d{1,2}"/><br />
				 			<span style="color:red;"><form:errors path="m_birth" /></span>
				 		</td>
				 	</tr>
					<tr>
						<th width="200"><b>*연락처</b>  <br />(000-0000-0000)</th>
						<td width = 400 >
							<form:input path="m_ph" id="userPh1" size="24" maxlength="28" /><br />
							<span style="color:red;"><form:errors path="m_ph" /></span>
						</td>
					</tr>
				 	<tr>
				 		<th width=200><b>*이메일 주소</b></th>
						<td width=400>
							<form:input path="m_email" id="m_email" size="24" maxlength="28" /><br />
							<span style="color:red;"><form:errors path="m_email" /></span>
						</td>
					</tr>
					<tr>
						<th>우편번호 </th>
						<td><form:hidden path="m_zip" id="m_zip" /><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><input type="text" id="m_zip_show" placeholder="우편번호" value="${memberCommand.m_zip}" disabled /></td>	
					</tr>
					<tr>
						<th>주소 </th>
						<td>
							<form:hidden path="m_addr1" id="m_addr1" /><input type="text" id="m_addr1_show" style="width:99%;" placeholder="도로명주소" value="${memberCommand.m_addr1}" disabled="disabled" /><br/>
							<form:input path="m_addr2" id="m_addr2" style="width:75%;" placeholder="상세주소"/>
						</td>
					</tr>
					<tr>
						<th>회원등급</th>
						<td>${memberCommand.m_class}</td>
					</tr>
					<tr>
						<th>회원가입일</th>
						<td><fmt:formatDate value='${memberCommand.m_date}' type='date' pattern='yyyy-MM-dd' /></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="수정 확인" />
							<input type="reset" value="리셋" />
							<input type="button" onclick="location.href='/YPCinema/myPage'" value="뒤로가기" />
				 		</td>
					</tr>
				</table>
			</div>
		</form:form>
	</div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	$("#add_btn").click(function() {
		$("#fileUploade").html("<input type='file' name='m_picture_file' id='m_picture_file' >");
	});
	$("#del_btn").click(function() {
		$("#img").html("[<img src='/YPCinema/img/empty_person.png' width='120'>]");
		$("#fileUploade").html("<input type='hidden' name='m_picture' value='/YPCinema/img/empty_person.png' >");
	});
});
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
<footer class="footer-area">
	<%@ include file="../footer.jsp"%>
</footer>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/active.js"></script>
</body>
</body>
</html>