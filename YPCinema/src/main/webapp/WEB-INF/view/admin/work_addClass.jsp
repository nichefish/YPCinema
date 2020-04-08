<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>근무분류 추가페이지</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

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
					<h1 class="h3 mb-2 text-gray-800" style="margin-left: 37%;">
						<b>GnmuTime Add Page</b>
					</h1>
					<!-- DataTales Example -->
					
					<div class="card shadow mb-4" style="width: 50%; margin-left: 25%;">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">근무시간 등록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
							<form method="post">
								<table class="table table-bordered" id="dataTable" cellspacing="0">

									<tr>
										<th>근무이름</th>
										<td><input type="text" name="gbunName" id="gbunName">
									</tr>
									<tr>
										<th>출근시간</th>
										<td>
											<input type="time"  name="gbunSTime" id="gbunSTime">
										</td>
									</tr>
									<tr>
										<th>퇴근시간</th>
										<td>
											<input type="time"  name="gbunETime" id="gbunETime">
										</td>
									</tr>
									<tr>
										<th>총 근무시간
											<input type="button" id="totalButton" name="totalButton" value="▶">
											
										</th>
										<td>
											<div id="total"></div>
										</td>
									</tr>
								</table>
								<input type="reset" value="리셋"> 
								<input type="submit" value="등록"> 
								<input type="button" value="취소" onclick="location.href='work_class'" >
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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	$("#totalButton").click(function(){
		$.ajax({
			type:"POST",
			url:"work_addClass2",
			data:{"sTime": $("#gbunSTime").val(), "eTime": $("#gbunETime").val()},
			datatype:"html",
			success: function(data1){
				$("#total").html(data1);
			}
			
		});
	});
});
</script>
</body>
</html>