<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

  <title>회원 관리</title>

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
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
	<%@ include file="/WEB-INF/view/admin_nav.jsp" %>
	<div class="container-fluid" style="padding-left: 250px;">
	<h1 class="h3 mb-2 text-gray-800">회원목록페이지</h1>
		<div class="card shadow mb-4"style="width:80%;margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Member List Page</h6>
            </div>
            <div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" width="60%" id="dataTable" cellspacing="0">
						<tr align="center" valign="middle">
							<td colspan=4>회원리스트</td>
							<td align=right>회원수 : </td>
						</tr>
						<tr align="center" valign="middle">
							<td align="center">회원아이디</td>
							<td align="center">회원이름</td>
							<td align="center">회원연락처</td>
							<td align="center">이메일</td>
							<td align="center">등록일</td>
						</tr>
						<c:forEach items="${lists}" var="member">
						<tr align="center" valign="middle">
							<td align="center">
								<a href="<c:url value='/member/detail?num=${member.m_num}' />">${member.m_id}</a>
							</td>
							<td align="center">${member.m_name}</td>
							<td align="center">${member.m_ph}</td>
							<td align="center">${member.m_email}</td>
							<td align="center">
								<fmt:formatDate value="${member.m_date}" type="date" />
							</td>
						</tr>
						</c:forEach>
						<tr align=center height=20>
							<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
								<c:if test="${page <= 1}">
								[이전]&nbsp;
								</c:if>
								<c:if test="${page > 1}">
								<a href="list?page=${page-1}">[이전]</a>&nbsp;
								</c:if>
								<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i" >
									<a href="list?page=${i}">[${i}]</a>
								</c:forEach>
									<a href="#"></a>&nbsp;
								<c:if test="${page == maxPage}">
								&nbsp;[다음]
								</c:if>
								<c:if test="${page < maxPage}">
								&nbsp;<a href="list?page=${page+1}">[다음]</a>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
<footer class="sticky-footer bg-white" style="margin-top: 100px;">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>Copyright &copy; YP Cinema 2020</span>
		</div>
	</div>
</footer>
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