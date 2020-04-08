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

  <title>채용공고 지원 현황 목록</title>

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
	 
        <!-- Begin Page Content -->
        <div class="container-fluid" style="padding-left: 20px;">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">채용공고 현황</h1>
          <!-- DataTales Example -->
          <div class="card shadow mb-4"style="width:100%;margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Coupon List Page</h6>
            </div>
            <div class="card-body" style="heigth:auto;">
              <div class="table-responsive">
              <form>
                <table class="table table-bordered" id="dataTable" cellspacing="0">
                    <tr>
                      <th style="width:5px;height:5px">
					  	<input type = "checkBox" class = "select_all" name = "couponSelect">
        			  </th>
        			  <th>채용번호</th>
                      <th>지원번호</th>
                      <th>회원번호</th>
                      <th>이름</th>
                      <th>영화관</th>
                      <th>지원날짜</th>
                      <th>진행현황</th>
                    </tr>
                  <tbody>
                  <c:forEach items="${allApplyLists}" var="a">
                  <tr>
                  	  <td style="width:5px;height:5px">
					  	<input type = "checkBox" class = "select" name = "couponSelect">
        			  </td>
                  	  <td><a href="staff_postDetail?che_num=${a.che_num}">${a.che_num}</a></td>
					  <td>
					  	<input type="button" id="readBtn" value="${a.r_num}" onclick="location.href='staff_readApply?r_num=${a.r_num}'" style="border:0px none;background-color:transparent;" >
					  </td>
                      <td>${a.m_num}</td>
                      <td>${a.m_name}</td>
                      <td>${a.r_hijijom}</td>
                      <td><fmt:formatDate value='${a.r_nalja}' type='date' pattern='yyyy-MM-dd' /></td>
                      <td>${a.r_jin}</td>
                  </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </form>
              </div>
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