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
				<h2>메뉴등록</h2>
			</div>
			<br>
			<div class="relCon">
				<div class="table11" id="menu" align="center">
					<form action="menuPro" method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<th style="width: 100px;">메뉴타입</th>
								<td><select name="menuType" id="menuType" class="select"
									style="width: 100px">
										<option value="콤보">콤보</option>
										<option value="팝콘">팝콘</option>
										<option value="음료">음료</option>
										<option value="스낵">스낵</option>
										<option value="떢볶이">떡볶이</option>
										<option value="닭강정">닭강정</option>
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
								<th style="width: 100px;">메뉴명</th>
								<td><input name="menuName" type="text" size="20"
									maxlength="30" /></td>
							</tr>
							<tr>
								<th style="width: 126px;">메뉴가격 (원)</th>
								<td><input name="menuPrice" type="text" size="20"
									maxlength="30" /></td>
							</tr>
							<tr>
								<th style="width: 100px;">상품설명</th>
								<td><textarea name="menuContent" cols="50" rows="3"
										maxlength="2000"
										style="font-family: 'Nanum Gothic', sans-serif;"></textarea></td>
							</tr>
							<tr>
								<th style="width: 100px;">메뉴이미지</th>
								<td><input type="file" name="menuImage" id="menuImage"></td>
							</tr>
						</table>
				</div>
				<div class="btnJoin2">
					<input type="submit" value=메뉴등록 />
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