<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>

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
				<h2>굿즈 등록</h2>
			</div>
			<br>

			<div class="relCon">

				<div class="table11" id="partnerGoods" align="center">
					<form action="goodsPro" method="post" enctype="multipart/form-data">

						<table>
							<tr>
								<th style="width: 100px;">굿즈 종류</th>
								<td><select name="partnerGoodsType" id="partnerGoodsType" class="select"
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
								<th style="width: 100px;">굿즈명</th>
								<td><input name="partnerGoodsName" type="text" size="20"
									maxlength="30" /></td>
							</tr>
							<tr>
								<th style="width: 126px;">굿즈단가(원)</th>
								<td><input name="partnerGoodsPrice" type="text" size="20"
									maxlength="30" /></td>
							</tr>
							<tr>
								<th style="width: 100px;">굿즈이미지</th>
								<td><input type="file" name="partnerGoodsImage" id="partnerGoodsImage"></td>
							</tr>
						</table>
				</div>
				<div class="btnJoin2">
					<input type="submit" value="굿즈 등록" />
				</div>
			</div>
		</div>
	</div>
	</form>

	<footer class="footer-area">
		<%@ include file="../footer.jsp"%>
	</footer>

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