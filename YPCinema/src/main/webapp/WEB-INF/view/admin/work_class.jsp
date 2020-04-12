<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>YPCinema</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="icon" href="img/fvc.jpg">
<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<style>
.bg-gradient-primary {
	background-color: #070a12;
	background-image: linear-gradient(180deg, #2b8980 10%, #524c4c 100%);
	background-size: cover;
}
</style>
</head>
<body id="page-top">
	<!-- navbar -->
	<%@ include file="/WEB-INF/view/admin_nav.jsp" %>
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!--내용넣는거 시작!-->
					<h1 class="h3 mb-2 text-gray-800" style="margin-left: 35%;">
						<b>Gnmu Management</b>
					</h1>
					<!-- DataTales Example -->
					
					<div class="card shadow mb-4" style="width: 50%; margin-left: 25%;">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">근무시간표 관리</h6>
						</div>
						<div class="card-body" style="float:right;">
							<div class="table-responsive">
								<form>
								<table class="table table-bordered" id="dataTable" cellspacing="0" style="text-align:center;">
								<c:set var="i" value="0" /> 
								<c:set var="j" value="3" />
								<c:if test="${!empty gnmuLists}">
								<c:forEach items="${gnmuLists}" var="gn" step="1">
								 <c:if test="${i%j == 0 }">
									<tr>
								</c:if>
								<c:if test="${gn.gbunTotal eq '00:00'}">
										<td>
											<button style="width:147px;height:72px;">${gn.gbunName}</button><br />
											<input type="radio" name="gnmuTime" id="gnmuTime" value="${gn.gbunNum}">
										</td>
								</c:if>
								<c:if test="${gn.gbunTotal ne '00:00'}">
										<td>
											<button style="width:147px;height:72px;">${gn.gbunName}<br />${gn.gbunSTime}~${gn.gbunETime}<br />총 ${gn.gbunTotal}시간</button><br />
											<input type="radio" name="gnmuTime" id="gnmuTime" value="${gn.gbunNum}">
										</td>
								</c:if>
								 <c:if test="${i%j == j-1 }">
									</tr>
								</c:if>
								<c:set var="i" value="${i+1 }" />
								</c:forEach>
								</c:if>
								<c:if test="${empty gnmuLists}">
									<tr style = "text-align:center;">
										<td>추가되어 있는 근무분류표가 없습니다.</td>
									</tr>		
								</c:if>
								</table> 
								<input type="submit" value="삭제" formaction="work_deleteClass">
								<input type="button" value="추가" onclick="location.href='work_addClass'">
								</form>
		
							</div>
						</div>
					</div>
					
				</div>
				
				<!-- /.container-fluid -->

			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; YP Cinema 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">정말 로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그아웃을 원하시면 확인버튼을 눌러주세요.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
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
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>