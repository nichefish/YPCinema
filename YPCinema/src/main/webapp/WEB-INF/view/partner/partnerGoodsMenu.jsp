<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴등록</title>

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

</head>
<body>
	<header class="header-area">
		<%@ include file="../navigation.jsp"%>
	</header>

	<div id="container">
		<!-- 메인 컨텐츠 -->
		<div class="contents">
			<div class="contentsTop">
				<h2>기프트샵 굿즈</h2>
			</div>
			<br>
			<div class="relCon">
				<div class="table11" id="partnerGoodsMenu" align="center">
					<form action="partnerGoodsMenuPro" method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<th style="width: 100px;">굿즈타입</th>
								<td><select name="partnerGoodsMenuType" id="partnerGoodsMenuType" class="select"
									style="width: 100px">
										<option value="굿즈 캐릭터">캐릭터</option>
										<option value="굿즈 카드">카드</option>
										<option value="굿즈 학용품">학용품</option>
										<option value="굿즈 식기류">식기류</option>
										<option value="굿즈 전자제품">전자제품</option>
										<option value="굿즈 잡화">잡화</option>
								</select></td>
							</tr>
							<tr>
								<th style="width: 100px;">지점선택</th>
								<td><select name="theaterNum" id="theaterNum" class="select"
									style="width: 100px">
										<option value="공통">공통</option>
										<option value="0">YP양평점</option>
										<option value="1">YP홍대입구점</option>
								</select></td>
							</tr>
							<tr>
								<th style="width: 100px;">굿즈 명</th>
								<td><input name="partnerGoodsMenuName" type="text" size="20"
									maxlength="30" /></td>
							</tr>
							<tr>
								<th style="width: 126px;">굿즈 가격 (원)</th>
								<td><input name="partnetGoodsMenuPrice" type="text" size="20"
									maxlength="30" /></td>
							</tr>
							<tr>
								<th style="width: 100px;">굿즈 상품설명</th>
								<td><textarea name="partnerGoodsMenuContent" cols="50" rows="3"
										maxlength="2000"
										style="font-family: 'Nanum Gothic', sans-serif;"></textarea></td>
							</tr>
							<tr>
								<th style="width: 100px;">굿즈 이미지</th>
								<td><input type="file" name="partnerGoodsMenuImage" id="partnerGoodsMenuImage"></td>
							</tr>
						</table>
				</div>
				<div class="btnJoin2">
					<input type="submit" value= 등록 />
				</div>
			</div>
		</div>
	</div>
	</form>

	<!-- footer 시작 -->
	<footer class="footer-area">
		<%@ include file="../footer.jsp"%>
	</footer>

	<!-- footer종료 -->

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