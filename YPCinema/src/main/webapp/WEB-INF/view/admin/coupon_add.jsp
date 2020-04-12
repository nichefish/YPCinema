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
	<%@ include file="/WEB-INF/view/admin_nav.jsp" %>
	 
        <!-- Begin Page Content -->
        <div class="container-fluid" style="padding-left: 250px;">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">쿠폰추가페이지</h1>
          <!-- DataTales Example -->
          <div class="card shadow mb-4"style="width:80%;margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Add Coupons Page</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              <form method="POST">
                <table class="table table-bordered" id="dataTable" cellspacing="0">
                    <tr>
                      <th>종류</th>
                      <td>
                      	<select id="selectMenuType" name="selectMenuType" style="float:left;margin-right:20px;">
                      			<option value="">----</option>
                      			<option value="영화">영화</option>
                      		<c:forEach items="${menuTypes}" var="mt" step="1">
                      			<option value="${mt.menu_type}">${mt.menu_type}</option>
                      		</c:forEach>
                      	</select>
                      	<div id= "coupon_add2">
                      	<select>
                      		<option>-----</option>
                      	</select>
                      	</div>
                      </td>
                    </tr>
                    <tr>
                      <th>이름</th>
                      <td>
                      	<input type="text" id="c_name" name="c_name">
                      </td>
                    </tr>
                    
                    <tr>
                      <th>내용</th>
                      <td>
                      	<input type="text" id="c_content" name="c_content">
                      </td>
                    </tr>
                    <tr id="hahahoho">
                      <th>할인률</th>
                      <td>
                      	<input type="text" id="c_score" name="c_score">
                      </td>
                    </tr>
                    <tr>
                    	<th>
                    		할인상태
                    	</th>
                    	<td>
                    		① - <input type="radio" name="c_symbol" id="c_symbol" value="-">
                    		② % <input type="radio" name="c_symbol" id="c_symbol2" value="%">
                    		③ 무료 <input type="radio" name="c_symbol" id="c_symbol3" value="*">
                    	</td>
                    </tr>
                  <tbody>

                  </tbody>
                </table>
                
                <div style="float:right;">
            	<input type ="submit" id= "coupon_add" value= "쿠폰등록">
            	<input type ="button" id= "coupon_delete" value= "취소" onclick="location.href='coupon_addList'">
              </div>
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
<script type="text/javascript">
$(function(){
	$("#selectMenuType").change(function(){
		$.ajax({
			type:"POST",
			url:"coupon_add2",
			data:"menuType=" + $("#selectMenuType").val(),
			datatype:"html",
			success: function(data1){
				$("#coupon_add2").html(data1);
			}
			
		});
	});
	
});
$(function() {
	$( document ).ready( function() {
        $( '#c_symbol3' ).click( function() {
        	$("#c_score").val('0');
        	$("#hahahoho").hide();
        });
        $( '#c_symbol2' ).click( function() {
        	$("#hahahoho").show();
        });
        $( '#c_symbol' ).click( function() {
        	$("#hahahoho").show();
        });
    });
});

</script>

</body>
</html>