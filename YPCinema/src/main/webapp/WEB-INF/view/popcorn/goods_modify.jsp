<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn1").click(function() {
			if ($("#btn1").attr("value") == "삭제") {
				$("#btn1").attr("value", "삭제취소");
				$("#fileDel").val("${goods.goodsImage}");
				$("#imageView").html("<input type='file' name='goodsImage' >");
			} else {
				$("#btn1").attr("value", "삭제");
				$("#fileDel").val("");
				$("#imageView").html("");
			}
		});
	});
</script>

</head>
<body>
	<div id="wrap">

		<!-- 헤더시작 -->
	

		<header class="header-area">
			<%@ include file="../navigation.jsp"%>
		</header>
		<!-- 헤더 종료 -->

		<!-- 컨테이너 시작 -->
		<div id="container">
			<!-- 메인 컨텐츠 -->
			<div class="contents">
				<div class="contentsTop">
					<h2>상품 수정</h2>
				</div>
				<br>
				<div class="relCon">

					<div class="table11" id="modify" align="center">
						<form action="goodsModifyPro" method="post" id="frm"
							name="modifyform" enctype="multipart/form-data">
							<table>
								<tr>
									<th style="width: 100px;">상품 번호</th>
									<td>${goods.goodsNum }</td>
								</tr>
								<tr>
									<th style="width: 100px;">상품종류</th>
									<td><select name="goodsType" id="goodsType" class="select"
										style="width: 100px">
											
											<option value="팝콘"
												<c:if test="${goods.goodsType eq '팝콘' }">selected</c:if>>팝콘</option>
											<option value="음료"
												<c:if test="${goods.goodsType eq '음료' }">selected</c:if>>음료</option>
											<option value="스낵"
												<c:if test="${goods.goodsType eq '스낵' }">selected</c:if>>스낵</option>
											<option value="떡볶이"
												<c:if test="${goods.goodsType eq '떡볶이' }">selected</c:if>>떡볶이</option>
									</select></td>
								</tr>

								<tr>
									<th style="width: 100px;">상품명</th>
									<td><input type="text" name="goodsName" id="goodsName"
										value="${goods.goodsName }" /></td>
								</tr>

								<tr>
									<th style="width: 126px;">상품단가(원)</th>
									<td><input type="text" name="goodsPrice" id="goodsPrice"
										value="${goods.goodsPrice }" /></td>
								</tr>
								<tr>
									<th style="width: 100px;">이미지</th>
									<td><img src="popcorn/update/${goods.goodsImage }"
										width="30" height="30" /> <input type="button" id="btn1"
										value="삭제" /></td>
								</tr>
							</table>
							<input type="hidden" name="fileDel" id="fileDel" /> 
							<input type="hidden" name="goodsNum" id="goodsNum" value="${goods.goodsNum }" />
							<input type="submit" value="수정 완료"> 
							<input type="button" id="goodsDelete" value="상품삭제" onclick="location.href='goodsDelete?num=${goods.goodsNum }'">

						</form>
					</div>

				</div>
				<!-- 메인 컨텐츠 종료 -->

			</div>
			<!-- 컨테이너 종료 -->
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