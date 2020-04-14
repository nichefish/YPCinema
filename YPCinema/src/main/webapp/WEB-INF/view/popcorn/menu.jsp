<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	var str = "";
	$("#menuType").change(function() {
		if ($("#menuType").val() == "콤보") {
			alert("콤보!!!");
			$(".add_more_goods").html("<input type='button' class='add_goods_btn' value='상품 추가'><div class='add_list'></div>");
			str = "";
		} else {
			alert("콤보가 아닙니다.");
			$(".add_more_goods").empty();
			str = "";
		}
	});
	$("#goodsNumSelect").change(function() {
		if ($("#menuType").val() != "콤보") {
			str = $("#goodsNumSelect").val();
			$(".add_more_goods").html("<br/><input type='hidden' name='goodsNum' value='" + str + "'>" + str);
		}
	});
	$(".add_more_goods").click(function() {
		str = str + $("#goodsNumSelect").val() + ",";
		$(".add_more_goods").children(".add_list").html("<br/><input type='hidden' name='goodsNum' value='" + str + "'>" + str);
		alert("추가추가!");
	});
});
</script>
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
				<form:form action="menuPro" method="post" enctype="multipart/form-data" commandName="menuCommand">
					<div class="table11" id="menu" align="center">
						<table>
							<tr>
								<th style="width: 100px;">메뉴타입</th>
								<td>
									<select name="menuType" id="menuType" class="select" style="width: 100px">
										<option value="" selected="selected" disabled="disabled">---선택---</option>
										<option value="콤보">콤보</option>
										<option value="팝콘">팝콘</option>
										<option value="음료">음료</option>
										<option value="스낵">스낵</option>
										<option value="떢볶이">떡볶이</option>
									
									</select>
								</td>
							</tr>
							<tr>
								<th style="width: 100px;">지점선택</th>
								<td>
									<select name="theaterNum" id="theaterNum" class="select" style="width: 100px">
										<option value="" selected="selected" disabled="disabled" >---선택---</option>
										<option value="공통">공통</option>
										<option value="0">YP양평점</option>
										<option value="1">YP홍대입구점</option>
									</select>
								</td>
							</tr>
							<tr>
								<th style="width: 100px;">메뉴명</th>
								<td><input name="menuName" type="text" size="20" maxlength="30" /></td>
							</tr>
							<tr>
								<th style="width: 126px;">메뉴가격 (원)</th>
								<td><input name="menuPrice" type="text" size="20" maxlength="30" /></td>
							</tr>
							<tr>
								<th style="width: 126px;">구성상품</th>
								<td>
									<select name="goodsNumSelect" id="goodsNumSelect" class="goods" style="width: 100px">
										<option value="" selected="selected" disabled="disabled">---선택---</option>
										<c:forEach items="${goodsList}" var="goods">
											<option value="${goods.goodsName}">${goods.goodsName}</option>
										</c:forEach>
									</select>
									<div class="add_more_goods" style="display:inline;"></div>
								</td>
							</tr>
							<tr>
								<th style="width: 100px;">메뉴설명</th>
								<td><textarea name="menuContent" cols="50" rows="3" maxlength="2000" style="font-family: 'Nanum Gothic', sans-serif;"></textarea></td>
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
				</form:form>
			</div>
		</div>
	</div>
	
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