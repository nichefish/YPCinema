<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
	<h1 class="h3 mb-2 text-gray-800">회원상세페이지</h1>
		<div class="card shadow mb-4"style="width:100%;margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Member Detail Page</h6>
            </div>
            <div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" width="60%" id="dataTable" cellspacing="0">

			<tr>
				<td colspan="2" align="center">
					<p>[<img width="200px" src="${memberCommand.m_picture}">]</p>
					<p>프로필 이미지</p><br/>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${memberCommand.m_id}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${memberCommand.m_name}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<c:choose >
					  	<c:when test="${memberCommand.m_gen == 'M'}">남자</c:when>
					  	<c:when test="${memberCommand.m_gen == 'F'}">여자</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><fmt:formatDate value='${memberCommand.m_birth}' type='date' pattern='yyyy-MM-dd' /></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${memberCommand.m_ph}</td></tr>
			<tr>
				<td>이메일</td>
				<td>${memberCommand.m_email}</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>${memberCommand.m_zip}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${memberCommand.m_addr1} ${memberCommand.m_addr2}</td>
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
				<td colspan="2" align="center">
					<input type="button" onclick="location.href='memberModify?num=${memberCommand.m_num}'" name="modify" id="modify" value="회원정보 수정">
					<input type="button" name="modify" id="modify" value="탈퇴">
				</td>
			</tr>
		</table>
		
		
		
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
</body>
</html>