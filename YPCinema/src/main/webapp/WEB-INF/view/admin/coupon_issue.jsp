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
	<%@ include file="/WEB-INF/view/admin_nav.jsp" %>
	 
        <!-- Begin Page Content -->
        <div class="container-fluid" style="padding-left: 20px;">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">쿠폰발급페이지</h1>
          <!-- DataTales Example -->
          <div class="card shadow mb-4"style="width:100%;margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Find User</h6>
            </div>
            <div class="card-body" style="height:auto;'">
              <div class="table-responsive">
              <form>
                회원검색 :&nbsp;<input type="text" id="findUserText" name="findUserText">
              <input type="submit" name="findUserTextS" value="검색" formaction="find_user">
              <input type="button" name="birthIssue" id="birthIssue" value="생일쿠폰발급" onclick="location.href='happyBirthDay'">
              <input type="button" value="맴버쉽발급" onclick="location.href='Membership'">
                <table class="table table-bordered" id="dataTable" cellspacing="0">
                    <tr>
					  <th>회원번호</th>
        			  <th>아이디</th>
                      <th>이름</th>
                      <th>등급</th>
                      <th>생일</th>
                    </tr>
                    <c:if test="${!empty foundUser}">
                  <tbody>
                  	<tr>
                  	  	<td>
                  	  		${foundUser.m_num}
                  	  		<input type="hidden" id="hiddenUserNum" name="hiddenUserNum" value="${foundUser.m_num}">
                  	  	</td>
					  	<td>${foundUser.m_id}</td>
                      	<td>${foundUser.m_name}</td>
                     	 <td>${foundUser.m_class}</td>
                      	<td><fmt:formatDate value='${foundUser.m_birth}' type='date' pattern='yyyy-MM-dd' /></td>
                  	</tr>
					
                  </tbody>
                  </c:if>
                </table>
                쿠폰선택 :&nbsp;<select name="choiceType" id="choiceType">
                	<option>-----</option>
                	<option value="영화">영화</option>
                	<option value="생일">생일</option>
                	<option value="VIP">맴버쉽</option>
                <c:forEach items="${menuTypes}" var="mt" step="1">
                	<option value="${mt.menu_type}">${mt.menu_type}</option>
                </c:forEach>
                		
                	</select>
               <div id="findCoupon">
                <table class="table table-bordered" id="dataTable" cellspacing="0">
                    <tr>
                      <th>쿠폰번호</th>
					  <th>쿠폰종류</th>
        			  <th>쿠폰이름</th>
                      <th>내용</th>
                      <th>할인률</th>
                    </tr>
                  <tbody>
                  	<tr>
                  		<td>쿠폰번호</td>
                  	  	<td>쿠폰종류</td>
					  	<td>쿠폰이름</td>
                      	<td>내용</td>
                     	 <td>할인률</td>
                  	</tr>
                  </tbody>
                </table> 
                </div>
              	만료일 : &nbsp;<input type = "text" id="manryo" name="manryo" placeholder="ex)5 => 오늘날짜 + 5일">
                <input type="submit" value="발급" id="balgb" name="balgb" formaction="CouponIssue" formmethod="post">
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
<script>
$(function() {
	$( document ).ready( function() {
        $( '.select_all' ).click( function() {
          $( '.select' ).prop( 'checked', this.checked );
        });
        
    });
});
$(function(){
	$("#choiceType").change(function(){
		$.ajax({
			type:"POST",
			url:"coupon_issue2",
			data:{"couponType": $("#choiceType").val(), "userNum" : $("#hiddenUserNum").val()},
			datatype:"html",
			success: function(data1){
				$("#findCoupon").html(data1);
			}
			
		});
	});
});
</script>

</body>
</html>