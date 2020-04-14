<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
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

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <link rel="icon" href="img/fvc.jpg">
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
        <div class="container-fluid" style="padding-left: 90px;">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">지점 및 직무 목록</h1>
          <!-- DataTales Example -->
          <div class="card shadow mb-4"style="width:30%; float: left; margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">지점별</h6>
            </div>
            <div class="card-body"style="height:auto;">
              <div class="table-responsive">
              
                <table class="table table-bordered" id="dataTable"cellspacing="0"  style="float:left;" >
                    <tr>
                      <th colspan="2">Theater</th>
                    </tr>
                  <tfoot>
                    <tr>
                      <th colspan="2">Theater</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  	<c:forEach items="${theaters}" var="t" step="1">
                  		<tr>
                  			<td>
                  				<input type="button" name="theater_name" id="theater_name" value="${t.theater_name}">
                  			</td>
                  			<td>
                  				<input type="button" name="theater_addM" id="theater_addM" value="상세" onclick="location.href='theater_detail?num=${t.theater_num}'"><br />
                  				<input type="button" name="theater_addM" id="theater_addM" value="수정" onclick="location.href='theater_addM?num=${t.theater_num}'"><br />
                  				<input type="button" name="theater_del" id="theater_del" value="삭제" onclick="location.href='theater_del?num=${t.theater_num}'">
                  			</td>
                  		</tr>
                 	</c:forEach>
                  </tbody>
                </table>
            	<input type ="button" id= "theater_add" value= "지점추가">
              </div>
            </div>
          </div>
		<!-- 222222222222222222222 -->
          <!-- DataTales Example -->
          <div id="theater2">
          <div class="card shadow mb-4"style="width:30%;float: left; margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">직무별</h6>
            </div>
            <div class="card-body" style="height:auto;">
              <div class="table-responsive">
              
              </div>
            </div>
          </div>
		</div>
		<!-- 2222222222222222222222222 -->
		<!-- 3333333333333333333333333 -->
		<!-- DataTales Example -->
          <div class="card shadow mb-4"style="width:30%;float:left;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">직원</h6>
            </div>
            <div class="card-body"style="height:auto;">
              <div class="table-responsive">
              
                
              </div>
            </div>
          </div>
		
		<!-- 3333333333333333333333333 -->
        </div>
        <!-- /.container-fluid -->


      <!-- End of Main Content -->

     
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

<!-- script -->
<script type="text/javascript">
$(function(){
	$("#theater_name").click(function(){
		$.ajax({
			type:"POST",
			url:"theater_ajax2",
			data:"num=" + $("#theater_name").val(),
			datatype:"html",
			success: function(data1){
				$("#theater2").html(data1);
			}
			
		});
	});
});

 	$(function(){
 		$("#theater_add").click(function(){
 			location.href="theater_add";
 		});
 	})
 	//window onload 
	$(document).ready(function(){
		// 배경 조절 버튼 클릭시 클릭 이벤트 
		$("#job_add").click(function(){
			var width = $("#page-top").width(); 
			var height = $("#page-top").height(); 
			//화면을 가리는 레이어의 사이즈 조정 
			$(".backLayerssss").width(width); 
			$(".backLayerssss").height(height); 
			//화면을 가리는 레이어를 보여준다 (0.5초동안 30%의 농도의 투명도) 
			$(".backLayerssss").fadeTo(500, 0.3); 
			//팝업 레이어 보이게 
			var loadingDivObj = $("#loadingDiv"); 
			loadingDivObj.css("top", $(document).height()/2-500); 
			loadingDivObj.css("left",$(document).width()/2-500); 
			loadingDivObj.fadeIn(500); }); }); 
	//esc키 누르면 화면 잠김 해제
	$(document).keydown(function(event){
		if(event.which=='27'){ 
			$("#loadingDiv").fadeOut(300); 
			$(".backLayerssss").fadeOut(1000); } }); 
	//button 누르면 화면 잠김 해제
	$(document).ready(function(){
		$("#btnss").click(function(event){
				$("#loadingDiv").fadeOut(300); 
				$(".backLayerssss").fadeOut(1000); }); 
	}); 
	//윈도우가 resize될때마다 backLayer를 조정 
	$(window).resize(function(){
		var width = $(window).width(); 
		var height = $(window).height();
		$(".backLayerssss").width(width).height(height); });
</script>
</body>
</html>