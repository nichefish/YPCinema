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
	var test = confirm("예매신청내역을 저장하고 매점주문으로 넘어가시겠습니까?");
	if (test) {
		location.href = "YPCinema/popcorn";
	}
}
</script>
</head>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 		<form action="/YPCinema/kakaoPay" method="post">
			<table width="600" border="1">
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
							${seat }
						</c:forEach>
					</td>
					<td><input type="hidden" name="seat_price" value="${showReserveStored.seat_price}"/>
						<c:forEach items="${showReserveStored.seat_price_array}" var="seat">
							${seat}
						</c:forEach>
					</td>
					<td>
						<input type="hidden" name="seat_total_price" value="${showReserveStored.seat_total_price}"/>${showReserveStored.seat_total_price}
					</td>
				</tr>
				<tr>
					<td>이메일 주소</td>
					<td colspan="4"><input type="text" name="payment_email"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td colspan="4"><input type="text" name="payment_ph"></td>
				</tr>
			</table>
			<input type="submit" value="결제">
			<input type="button" value="결제 계속?">
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