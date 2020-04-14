<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>

<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/goodsUp.css" />
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<body>
	<div id="wrap">

		<!-- 헤더시작 -->
		<header class="header-area">
			<%@ include file="../navigation.jsp"%>
		</header>
		<!-- 헤더끝 -->

		<div id="container">
			<!-- 메인 컨텐츠 -->
			<div class="contents">
				<div class="contentsTop">
					<h2>상품리스트</h2>
				</div>
				<br>

				<div class="relCon">
					<div class="table11" id="goods" align="center">
						<table border="1" cellpadding="0" cellspacing="0">
							<tr align="center" valign="middle">
								<td colspan="5">상품리스트</td>
							</tr>
							<tr>
								<td width="50" align="center">상품타입</td>
								<td width="50" align="center">번호</td>
								<td width="80" align="center">이미지</td>
								<td width="90" align="center">상품명</td>
								<td width="70" align="center">단가(원)</td>
							</tr>
							<c:forEach var="goods" items="${goodsList }" varStatus="status">
								<tr>
									<td>${goods.goodsType}</td>
									<td>${status.count }</td>
									<td><c:forTokens items="${goods.goodsImage }" delims="-"
											var="goodsImage" varStatus="status" >
											<c:if test="${status.count == 1}">
												<img src="/YPCinema/popcorn/update/${goodsImage }"   style="height:100px"/>
											</c:if>
										</c:forTokens></td>
									<td><a href="goodsModify?num=${goods.goodsNum }">
											${goods.goodsName  }</a></td>
									<td>${goods.goodsPrice  }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="btnJoin2">
						<input type="button" value="상품등록"
							onclick="location.href='goodsUp' " /> <input type="button"
							value="메인으로" onclick="location.href='popcorn' " />

					</div>
				</div>
			</div>
		</div>
		<!-- footer 시작 -->
		<footer class="footer-area">
			<%@ include file="../footer.jsp"%>
		</footer>
		<!-- footer종료 -->
	</div>
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="js/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>
</body>
</html>