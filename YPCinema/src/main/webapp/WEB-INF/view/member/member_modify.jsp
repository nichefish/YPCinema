<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>지점 및 직무 관리</title>

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<style>
  .bg-gradient-primary {
    background-color: #070a12;
    background-image: linear-gradient(180deg,#2b8980 10%,#524c4c 100%);
    background-size: cover;
}
div.backLayerssss {
	display: none;
	background-color: black;
	position: absolute;
	left: 0px;
	top: 0px;
}

div#loadingDiv {
	background-color: white;
	text-align:center;
	display: none;
	position: absolute;
	width: 300px;
	height: 300px;
}
div.card-body {
	height: 367px;
}
  </style>
 
</head>
<body id="page-top">
<div class='backLayerssss' style=''></div>
	<!-- navbar -->
	<%@ include file="/WEB-INF/view/admin_nav.jsp" %>
	<div class="container-fluid" style="padding-left: 20px;">
	<h1 class="h3 mb-2 text-gray-800">회원수정페이지</h1>
		<div class="card shadow mb-4"style="width:100%;margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Member Modify Page</h6>
            </div>
            <div class="card-body">
				<div class="table-responsive">
		<form:form name="frm" id="frm" method="POST" enctype="multipart/form-data" commandName="memberCommand">
		<!-- <input type="hidden" name="confirmNum" id="confirmNum" value="1"> 여기 value 1! 중복체크 -->
			<table class="table table-bordered" width="60%" id="dataTable" cellspacing="0">
				<tr rowspan="2">
					<td colspan="2" align="center">
						<p>[<img width="200px" src="${memberCommand.m_picture}">]</p>
						<p>프로필 이미지: <input type="file" name="goodsImage" id="goodsImage" ></p><br/>
					</td>
				</tr>
			 	<tr>
			 		<td width="200">아이디</td>
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
			 		<td width="200">사용자 이름</td>
			 		<td width="400">
			 			<form:input path="m_name" id="userName" size="12" maxlength="10" />
			 			<form:errors path="m_name" />
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
					<td>회원등급</td>
					<td>${memberCommand.m_class}</td>
				</tr>
				<tr>
					<td>회원가입일</td>
					<td><fmt:formatDate value='${memberCommand.m_date}' type='date' pattern='yyyy-MM-dd' /></td>
				</tr>
				<tr>
					<td colspan="2"align="center">
						<input type="submit" value="수정 확인" />
						<input type="reset" value="리셋" />
						<input type="button" value="뒤로가기" />
			 		</td>
				</tr>
			</table>
		</form:form>

				</div>
			</div>
		</div>
	</div>
      <!-- Footer -->
      <footer class="sticky-footer bg-white" style="margin-top: 100px;">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
      		 <span>Copyright &copy; YP Cinema 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    <!-- End of Content Wrapper -->


  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃 하시겠습니까?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">로그아웃을 원하시면 확인버튼을 눌러주세요.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="login.html">확인</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/datatables-demo.js"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
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