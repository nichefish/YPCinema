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

  <title>YPCinema</title>

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link rel="icon" href="img/fvc.jpg">
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
	<%@ include file="/WEB-INF/view/staff_nav.jsp" %>
	 
        <!-- Begin Page Content -->
        <div class="container-fluid" style="padding-left: 20px;">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">계약서 자세히</h1>
          <!-- DataTales Example -->
          <div class="card shadow mb-4"style="width:100%;margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Contract</h6>
            </div>
            <div class="card-body" style="height:auto;'">
                   <h3><strong>표준 근로계약서</strong></h3>
                        <input type="hidden" name="please" id="please" >
                        <input type="hidden" id="gnroTime" value="${resume.r_time}">
                        <!-- Contact Form -->
                       	<b>YGVCinema</b>(이하 "사업주"라 함)과(와) <b>${userInfo.m_name}</b>(이하 "근로자"라 함)은 다음과 같이 근로계약을 체결한다.<br />
                       	* 근로계약기간 :
                       	<input type=text id="nyundo" style="border:none;width:45px;" disabled>년
                       	<input type=text id="wyul"	style="border:none;width:45px;" disabled>월
                       	<input type=text id="yeeel"  style="border:none;width:45px;" disabled>일 부터 &nbsp;&nbsp;
                       	<input type=text id="nyundo2" style="border:none;width:45px;" disabled>년
                       	<input type=text id="wyul2"	style="border:none;width:45px;" disabled>월
                       	<input type=text id="yeeel2"  style="border:none;width:45px;" disabled>일까지
                       	1. 근무장소 : <b>${resume.r_hijijom}</b><br />
                       	2. 소정근로시간 : <b>${resume.r_time}</b><br />
                       	3. 근무일: <b>${resume.r_gadate}</b><br />
                       	4. 임금<br />
                       	- 시급(2020년기준): 9000원<br />
                       	5. 장애여부 : <b>${resume.r_dis}</b><br />
                       	6. 보훈대상 : <b>${resume.r_price}</b><br />
                       	7. 연차유급휴가<br />
                       	- 연차유급휴가는 근로기준법에서 정하는 바에 따라 부여함.<br />
                       	8. 근로계약서 교부<br />
                       	- 사업주는 근로계약을 체결함과 동시에 본 계약서를 사본하여 근로자의 교부요구와 고나계없이 근로자에게 교부함(근로기준법 제 17조 이행)<br />
                       	9. 기 타<br />
                       	- 이 계약에 정함이 없는 사항은 근로기준법령에 의함<br />
                       <input type=text id="nyundo3" style="border:none;width:45px;" disabled>년 
                       <input type=text id="wyul3"	style="border:none;width:45px;" disabled>월 
                       <input type=text id="yeeel3"  style="border:none;width:45px;" disabled>일<br />
                       	(근로자) 주소: <b>(${userInfo.m_zip})${userInfo.m_addr1} / ${userInfo.m_addr2}</b><br />
                       	&nbsp;&nbsp;&nbsp; 연락처: <b>${userInfo.m_ph}</b><br />
                       	&nbsp;&nbsp;&nbsp; 성명 :  <b>${userInfo.m_name}</b><br />
                       	은행명:<input type="text" id="staff_bank">
                       	계좌번호:<input type="text" id="staff_bankNum" placeholder=" - 를 없애주세요."><br />
                       	<input type="hidden" name="hiddenR_num" id="hiddenR_num" value="${resume.r_num}">
                       	<input type="hidden" name="hiddenM_num" id="hiddenM_num" value="${userInfo.m_num}" >
                       	
						<!-- 서명서명 -->
						
						<div>
							<canvas id="canvas" width="350" height="200" style="border:10px solid #000000">
							</canvas>
						</div>
						<div>
							<input type="button" id="id_clear" value="다시 서명" /> 
							<input type="button" id="id_copy" value="서명확인" />
							<input type="submit" value="제출">
						</div>
						<div id="copyarea"></div>
						<!-- 서명서명끝 -->
						

              </div>
            </div>
          </div>
       

        <!-- /.container-fluid -->


      <!-- End of Main Content -->

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