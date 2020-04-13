<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="icon" href="../img/core-img/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/goodsUp.css" />
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	$("#frm").submit(function() {
		if ($("#payment_email").val() == "") {
			alert("수령가능한 이메일 주소를 꼭 입력해주셔야 합니다.");
			$("#payment_email").focus();
			return false;
		}
		if ($("#payment_ph").val() == "") {
			alert("수령가능한 휴대폰 번호를 꼭 입력해주셔야 합니다.");
			$("#payment_ph").focus();
			return false;
		}
	});
	$("#reset").click(function() {
		alert("불러옴!");
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
 		<form:form action="/YPCinema/kakaoPay" id="frm" method="post" commandName="showReserveCommand">
 			<div class="relCon" align="center">
				<table class="table table-bordered" id="dataTable" style="width:600px;align:center;color:black;">
					<tr>
						<td>상영번호</td>
						<td>회원번호</td>
						<td>좌석번호</td>
						<td>좌석가격</td>
						<td>전체가격</td>
					</tr>
					<tr>
						<td><input type="hidden" name="show_num" value="${showReserveStored.show_num}" />${showReserveStored.show_num}</td>
						<td><input type="hidden" name="m_num" value="${showReserveStored.m_num}"/>${showReserveStored.m_num}</td>
						<td>
							<input type="hidden" name="seat_num" value="${showReserveStored.seat_num}"/>
							<c:forEach items="${showReserveStored.seat_num_array}" var="seat">
								${seat} /
							</c:forEach>
						</td>
						<td><input type="hidden" name="seat_price" value="${showReserveStored.seat_price}"/>
							<c:forEach items="${showReserveStored.seat_price_array}" var="seat">
								${seat} /
							</c:forEach>
						</td>
						<td>
							<input type="hidden" name="seat_total_price" value="${showReserveStored.seat_total_price}"/>${showReserveStored.seat_total_price}
						</td>
					</tr>
					<tr>
						<td>이메일 주소</td>
						<td colspan="4"><input type="text" name="payment_email" id="payment_email" value="${memberCommand.m_email }"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td colspan="4"><input type="text" name="payment_ph" id="payment_ph" value="${memberCommand.m_ph }"></td>
					</tr>
				</table>
			</div>
			<input type="submit" value="결제">
			<input type="reset" id="reset" value="회원정보에서 연락처 불러오기">
		</form:form>
	</div>
</div>
<footer class="footer-area">
	<%@ include file="../footer.jsp"%>
</footer>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/active.js"></script>
</body>
</html>