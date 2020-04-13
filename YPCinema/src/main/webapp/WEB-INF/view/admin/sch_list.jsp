<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	 
        <!-- 스케줄표 -->
        <form:form id="frm" commandName="scheduleCommand">
        <div class="container-fluid" style="padding-left: 50px;">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">스케줄표 관리</h1>
          <!-- DataTales Example -->
          
          
          <div class="card shadow mb-4"style="width:75%;float: left; margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary" style="text-align:center;">Schedule for 2020</h6>
              <input type="date" id="calendar" name="calendar">
              <select name="theater_num" id="theater">
              	<option value="" label="---지점 선택----" />
			 	<c:forEach items="${theaters}" var="theater">
			 		<option value="${theater.theater_num}" label="${theater.theater_name}" />
			 	</c:forEach>       
              </select>
              <select name="jicmu_num" id="jicmu">
              	<option value="" label="---직무 선택----" />
			 	<c:forEach items="${jicmuList}" var="jicmu">
			 		<option value="${jicmu.jic_num}" label="${jicmu.jic_name}" />
			 	</c:forEach>       
              </select>
            </div>
            <div class="card-body" style="height:500px;text-align:center;">
              <div class="table-responsive">
              
                <table class="table table-bordered" id="dataTable"cellspacing="0">
                   <tr>
                   		<td rowspan="2"></td>
                   		<td>일</td>
                   		<td>월</td>
                   		<td>화</td>
                   		<td>수</td>
                   		<td>목</td>
                   		<td>금</td>
                   		<td>토</td>
                   </tr>
                   <tr>
					<!-- 열마다 해당 지점에서 근무하는 직원.. 향별로 forEach로 출력하면 되고... -->
                   	<c:forEach items="${calendar}" var="c" begin="105" end="111" varStatus="var">
                   		<th id="${var.count}">
                   			<div class="big_date">${c}</div>
                   			<input type="radio" name="gnmu_date" value="2020-0${c}">
                   		</th>
                   	</c:forEach>
                   </tr>
                   
                   	<c:forEach items="${staffLists}" var="staff">
                   	<tr>
                   		<th>
                   			<div class="staff_id">${staff.staff_num}</div>
                   			<input type="radio" name="staff_num" value="${staff.staff_num}">
                   		</th>
                   		<c:forEach items="${calendar}" var="day" begin="105" end="111">
                   		<td>
                   			<c:forEach items="${scheduleList}" var="schedule">
                   				<fmt:formatDate value='${schedule.gnmu_date}' type='date' pattern='M-dd' var="schedule_date" />
                   				<c:if test="${(staff.staff_num eq schedule.staff_num) && (schedule_date eq day)}">
                   				<div class="schedule_day"></div>
                   				</c:if>
							</c:forEach>
                   		</td>
                   		</c:forEach>
                   	</tr>
					</c:forEach>
                </table>
                <input type="button" value="◀">
                <input type="button" value="▶">
              </div>
            </div>
          </div>
		<!-- 근무 일정표 -->
          <!-- DataTales Example -->
          <div id="theater2">
          <div class="card shadow mb-4"style="width:20%; margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary"style="text-align:center;">Gnmu Bunryu</h6>
            </div>
            <div class="card-body" height:500px;>
              <div class="table-responsive">
              	<table class="table table-bordered" id="dataTable" cellspacing="0" style="text-align:center;">
					<c:set var="i" value="0" /> 
					<c:set var="j" value="2" />
					<c:if test="${!empty gnmuLists}">
					<c:forEach items="${gnmuLists}" var="gn" step="1">
						<c:if test="${i%j == 0 }">
							<tr>
						</c:if>
						<c:if test="${gn.gbunTotal eq '00:00'}">
							<td>
								<button style="width:147px;height:72px;">${gn.gbunName}</button><br />
								<input type="radio" name="gbun_num" id="gnmuTime" value="${gn.gbunNum}">
							</td>
						</c:if>
						<c:if test="${gn.gbunTotal ne '00:00'}">
							<td>
								<button style="width:147px;height:72px;">${gn.gbunName}<br />${gn.gbunSTime}~${gn.gbunETime}<br />총 ${gn.gbunTotal}시간</button><br />
								<input type="radio" name="gbun_num" id="gnmuTime" value="${gn.gbunNum}">
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
				
              </div>
              <input type="submit" id="submit" value="근무추가!">
            </div>
          </div>
		</div>
		<!-- 근무일정표 끝 -->
		
        </div>
        </form:form>
        <!-- /.container-fluid -->


      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white" style="margin-top: 200px;">
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
	$(".schedule_day").closest("td").css('background-color', 'yellow');
	$("#theater").change(function() {
		alert($("#theater").val() + "에서 근무하는 직원 목록을 출력(아직 안)합니다.");
		location.href="sch_list?theater=" + $("#theater").val();
		// 해당 지점에 근무하는 직원 목록을 불러와야 되는데...
		// ajax 쓰지말고.. 걍 바로 전부 불러오는 식으로.. 하면 될 거 같다...
	});
	$("#jicmu").change(function() {
		alert($("#jicmu").val() + "직무로 근무하는 목록을 출력(아직 안)합니다.");
		location.href="sch_list?theater=" + $("#theater").val() + "&jicmu=" + $("#jicmu").val();
		// 해당 지점에 근무하는 직원 목록을 불러와야 되는데...
		// ajax 쓰지말고.. 걍 바로 전부 불러오는 식으로.. 하면 될 거 같다...
	});
});
  </script>
</body>
</html>