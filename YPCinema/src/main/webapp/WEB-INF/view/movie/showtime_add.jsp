<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="js/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="js/plugins.js"></script>
<!-- Active js -->
<script src="js/active.js"></script>
<script type="text/javascript">
// $(document).ready(function() {
// 	var theater = window.location.search.split("=").pop();
// 	$("#theater_num").val(theater);
// // 	$("#theater").attr("selected", "selected");
// });
$(function() {
	$("#theater").change(function() {
		$.ajax({
			type : "post",
			url : "registerB",
			data : "theater=" + $("#theater").val(),
			datatype : "html",
			success : function(data) {
				$("#selectScreen").html(data);
			},
			error : function(data) {
				$("#selectScreen").append(data);
			}
		})
	});
// 	$("#screen").change(function() {
// 		location.href="register?theater=" + $("#theater").val() + "&screen=" + this.value;
// 	});
	$("#show_date").change(function(){
		var dt = new Date();
		var today = dt.getFullYear() + ("00"+(dt.getMonth() + 1)).slice(-2) + ("00" + dt.getDate()).slice(-2);
		today = Number(today);
		var selectedDate = $("#show_date").val().replace(/-/g, "");
		selectedDate = Number(selectedDate);
		var dateCheck = selectedDate - today;	// 작으면 안됨...
		if (dateCheck <= 0) {
			alert("당일 혹은 이전 날짜에는 상영일정을 등록할 수 없습니다.");
			$("#show_date").val("");
			return false;
		}
	});
});
</script>
</head>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 	 	<p>양평시네마 상영일정 정보</p>
 		<p>ㅂㅂ$!@#$!....</p>
		<form:form name="frm" id="frm" method="post" commandName="showtimeCommand">
			<table width="60%" align="center" border="1">
			 	<tr>
			 		<td width="20%" align="center">
			 			지점: <br/>
			 			<form:select path="theater_num" size="6" id="theater">
			 				<option label="지점 선택" />
			 				<c:forEach items="${theaters}" var="theater">
			 				<form:option value="${theater.theater_num}" label="${theater.theater_name} ${theater.theater_rating }" />
			 				</c:forEach>
			 			</form:select>
			 		</td>
			 		<td width="20%" align="center">
			 			<div id="selectScreen">
			 			상영관: <br/>
						<form:select path="screen_num" size="6" id="screen">
							<option label="상영관 선택" />
			 			</form:select>
			 			</div>
			 		</td>
			 		<td width="20%" align="center">
			 			영화: <br/>
			 			<form:select path="movie_num" size="6"  maxlength="10" >
			 				<option label="영화 선택" />
			 			</form:select>
			 			<form:errors path="movie_num" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td>상영일자</td>
			 		<td colspan="2">
			 			<form:input path="show_date" type="date" id="show_date" maxlength="10" placeholder="yyyy-MM-dd" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
			 			<form:errors path="show_date" />
			 			(<u>yyyy-MM-dd</u>)
			 		</td>
			 	</tr>
				<tr>
					<td>상영시작시간</td>
					<td colspan="3">
						<form:input path="show_start" id="userPh1" size="16.5" maxlength="28" placeholder="hh:mm" pattern="\d{2}:\d{2}"/>
						<form:errors path="show_start" />
					</td>
				</tr>
			 	<tr>
			 		<td>상영종료시간</td>
					<td colspan="3">
						<form:input path="show_end" id="userPh1" size="16.5" maxlength="28" placeholder="hh:mm" pattern="\d{2}:\d{2}"/>
						<form:errors path="show_end" />
					</td>
				</tr>
			</table>
					<table width="60%" align="center" border="0">
			<tr>
				<td align="center">
					<input type="submit" value="상영일정 등록" />
					<input type="reset" value="리셋" />
					<input type="button" value="뒤로가기" />
				</td>
			</tr>
		</table>
		</form:form>
	</div>
</div>
<footer class="footer-area">
      <%@ include file="../footer.jsp"%>
</footer>
</body>
</html>