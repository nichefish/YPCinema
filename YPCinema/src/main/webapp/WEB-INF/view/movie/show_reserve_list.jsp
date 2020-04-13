<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="icon" href="../img/fvc.jpg">
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
	$("#btn").click(function() {
		if ($("#payment_num").val() == "") {
			alert("검색값을 입력하셔야 합니다.");
			return false;
		}
		$("#num").val($("#payment_num").val());
		$("#frm").submit();
	});
	$("#select_all").change(function() {
		if ($(this).is(":checked", true)) {
			$("input:checkbox[name='select']").prop("checked", true);
		} else {
			$("input:checkbox[name='select']").prop("checked", false);
		}
	});
	$("#borBtn").click(function() {
		$("#seat_issue").val(0);		// 보류!
		alert("선택한 티켓(들)이 보류 처리되었습니다...");
		$("#ticket_form").submit();
	});
	$("#balBtn").click(function() {
		$("#seat_issue").val(1);		// 발권!
		alert("선택한 티켓(들)이 발권 처리되었습니다.");
		$("#ticket_form").submit();
	});
	$("#ippBtn").click(function() {
		$("#seat_issue").val(2);		// 입장!
		alert("선택한 티켓(들)이 입장 처리되었습니다.");
		$("#ticket_form").submit();
	});
	$("#hwanBtn").click(function() {
		$("#seat_issue").val(3);		// 입장!
		alert("선택한 티켓(들)이 환불 처리되었습니다.");
		$("#ticket_form").submit();
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
 		<p>양평시네마 표 관리 정보 (직원전용!)</p>
 		<form id="frm" method="get">
 			<p>
 				현재 날짜:시간: #$!@#@T--1234!-!@#$@!<br/><br/>
 				<input type="text" name="payment_num" id="payment_num" placeholder="예매번호 검색" /> <input type="button" id="btn" value="예매정보 검색"><br/>
 				!@#!#@...
 			<p>ㅂㅂ$!@#$!....</p>
 		</form>
 		<form id="ticket_form" method="post">
 			<input type="text" name="num" id="num" value="${payment_num}">
 			<input type="text" name="seat_issue" id="seat_issue">
			<table width="60%" border="1">
	 		 	<tr>
	 		 		<td>-</td>
	 		 		<td>결제번호</td>
	 		 		<td>회원번호</td>
	 				<td>좌석예약번호</td>
	 				<td>상영번호</td>
	 				<td>좌석번호</td>
	 				<td>좌석가격</td>
	 				<td>좌석상태</td>
	 				<td align="center">[<input type="checkbox" name="select_all" id="select_all">]</td>
	 			</tr>
	 			<c:forEach items="${showReserveList}" var="showReserve" varStatus="var">
	 			<tr>
	 				<td width="30" style="background-color:black;"><img src="../img/ticket3-5.png" width="30px"></td>
		 			<td>${showReserve.payment_num}!!</td>
		 			<td>${showReserve.m_num}!!</td>
		 			<td>${showReserve.seat_reserve_num}!!</td>
		 			<td>${showReserve.show_num}!!</td>
		 			<td>${showReserve.seat_num}!!</td>
		 			<td>${showReserve.seat_price}!!</td>
		 			<td>${showReserve.seat_issue}!!</td>
		 			<td align="center"><input type="checkbox" name="select" value="${showReserve.seat_num}"></td>
	 			</tr>
	 			</c:forEach>
	 		</table>
	 		<table width="60%" border="0">
	 			<tr>
	 				<td align="center">
	 					<p>&nbsp;<input type="button" id="borBtn" value="보류...">&nbsp;&nbsp;&nbsp;<input type="button" id="balBtn" value="발권!">&nbsp;&nbsp;<input type="button" id="ippBtn" value="입장!">&nbsp;&nbsp;<input type="button" id="hwanBtn" value="환불ㅠ">&nbsp;</p>
	 				</td>
				</tr>	 		
	 		</table>
 		</form>
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