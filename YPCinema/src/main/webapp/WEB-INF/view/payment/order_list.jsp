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
</head>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 		<form action="/YPCinema/kakaoPay" method="post">
			<table border="1">
				<tr>
					<td><input type="hidden" name="show_num" value="${showReserveStored.show_num}" /> 상영번호: ${showReserveStored.show_num}</td>
					<td><input type="hidden" name="m_num" value="${showReserveStored.m_num}"/> 회원번호: ${showReserveStored.m_num}</td>
					<td><input type="hidden" name="seat_num" value="${showReserveStored.seat_num}"/> 좌석번호: 
						<c:forEach items="${showReserveStored.seat_num_array}" var="seat">
							${seat }
						</c:forEach>
					</td>
					<td><input type="hidden" name="seat_name" value="${showReserveStored.seat_name}"/> 좌석이름: 
						<c:forEach items="${showReserveStored.seat_name_array}" var="seat">
							${seat }
						</c:forEach>
					</td>
					<td><input type="hidden" name="seat_price" value="${showReserveStored.seat_price}"/> 좌석가격:
						<c:forEach items="${showReserveStored.seat_price_array}" var="seat">
							${seat}
						</c:forEach>
					</td>
					<td><input type="hidden" name="seat_total_price" value="${showReserveStored.seat_total_price}"/> 전체가격:
						${showReserveStored.seat_total_price}
					</td>
				</tr>
				<tr>
					<td>회원번호: <input type="text" name="m_num" value="${authInfo.m_num }"> (${authInfo.m_num })</td>
					<td>이메일 주소: <input type="text" name="payment_email"></td>
					<td>전화번호: <input type="text" name="payment_ph"></td>
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