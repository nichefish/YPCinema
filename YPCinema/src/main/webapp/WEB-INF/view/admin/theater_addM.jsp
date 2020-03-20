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

<title>지점 수정</title>

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
					<h1 class="h3 mb-2 text-gray-800">
						<b>Movie Theater Modification</b>
					</h1>
					<!-- DataTales Example -->
					
					<div class="card shadow mb-4" style="width: 50%;margin-left: 25%;">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">극장 수정</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
							<form action="theater_addM" method="post">
								<table class="table table-bordered" id="dataTable" cellspacing="0">
								
									<tr>
										<th colspan="2">Theater</th>
										
									</tr>
									<tr>
										<td>Theater Name</td>
										
										<td><input type="text" name="theater_name"	id="theater_name" value="${numTheater.theater_name}"></td>
									</tr>
									<tr>
										<td>Postal Code</td>
										<td>
											<input type="hidden" name="theater_num" id="theater_num" value="${numTheater.theater_num}">
											<input type="hidden" name="theater_zip" id="theater_zip" value="${numTheater.theater_zip}">
											<input type="text" name="user_zip_show" id="user_zip_show"  value="${numTheater.theater_zip}" disabled> 
											<input type="button" onclick="sample4_execDaumPostcode()" value="검색" >
										</td>
									</tr>
									<tr>
										<td>Road Name Address</td>
										<td>
											<input type="hidden" name="theater_addr1" id="theater_addr1"  value="${numTheater.theater_addr1}"> 
											<input type="text" name="user_addr1_show" id="user_addr1_show" value="${numTheater.theater_addr1}" disabled>
										</td>
									</tr>
									<tr>
										<td>Detail Address</td>
										<td><input type="text" name="theater_addr2" id="theater_addr2" value="${numTheater.theater_addr2}" ></td>
									</tr>
									<tr>
										<td>Phone Number</td>
										<td><input type="text" name="theater_ph" id="theater_ph" value="${numTheater.theater_ph}"></td>
									</tr>
					
									<tr>
										<td>Rating</td>
										<td style="text-align: center;">${numTheater.theater_rating}</td>
									</tr>
									<tr>
										<td>Special</td>
										<td style="text-align: center;">${numTheater.theater_special}</td>
									</tr>
								</table>
								<input type="submit" value="등록"> 
								<input type="button" value="취소" onclick="location.href='jobList'" >
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
	<!-- 다음 지도 API -->
	<script>
function sample4_execDaumPostcode() {
	new daum.Postcode(
	{
		oncomplete : function(data) {
		// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		var roadAddr = data.roadAddress; // 도로명 주소 변수
		var extraRoadAddr = ''; // 참고 항목 변수
		// 법정동명이 있을 경우 추가한다. (법정리는 제외)
		// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
			extraRoadAddr += data.bname;
		}
		// 건물명이 있고, 공동주택일 경우 추가한다.
		if (data.buildingName !== '' && data.apartment === 'Y') {
			extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		}
		// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		if (extraRoadAddr !== '') {
			extraRoadAddr = ' (' + extraRoadAddr + ')';
		}
		// 우편번호와 주소 정보를 해당 필드에 넣는다.
		document.getElementById('theater_zip').value = data.zonecode;
		document.getElementById('user_zip_show').value = data.zonecode;
		document.getElementById("theater_addr1").value = roadAddr;
		document.getElementById("user_addr1_show").value = roadAddr;
// 		document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
// 		var guideTextBox = document.getElementById("guide");
		// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
// 		if (data.autoRoadAddress) {
// 			var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
// 			guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
// 			guideTextBox.style.display = 'block';
// 		} else if (data.autoJibunAddress) {
// 			var expJibunAddr = data.autoJibunAddress;
// 			guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
// 			guideTextBox.style.display = 'block';
// 		} else {
// 			guideTextBox.innerHTML = '';
// 			guideTextBox.style.display = 'none';
// 		}
		}
	}).open();
}
</script>

</body>
</html>