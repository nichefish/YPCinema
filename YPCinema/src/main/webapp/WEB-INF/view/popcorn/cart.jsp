<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">


<script type="text/javascript">
function checkQty(num, qty) {
	if (qty > 1) {
		location.href="cartQtyDown?num="+num;
	} else {
		return false;
	}
}

function checkupQty(num, qty) {
	if (qty >= 10) {
		alert("최대 10개까지 입력할수있습니다.");
		return;
	} 
	location.href="cartQtyUp?num="+num;
}

function buy1() {
	var chkbox = document.getElementsByName('select'); 
	var chk = 0; 
	var num = "";
	for (var i=0 ; i<chkbox.length ; i++) { 
		if (chkbox[i].checked) { 
			chk += 1;
			num += chkbox[i].value + ",";
		} 
 	}
	if (chk == 0) {
		alert("구매 상품을 선택해 주세요.");
	} else { 
		location.href = "cartCart?select=" + num;
	}
}
</script>
</head>
<body>
	<header class="header-area">
		<%@ include file="../navigation.jsp"%>
	</header>
		<div id="container" align="center">
			<div id="contents">
				<div class="xans-element- xans-product xans-product-menupackage ">
					<div
						class="xans-element- xans-product xans-product-headcategory title ">
						<p class="banner"></p>
						<h2>
							<span>장바구니</span>
						</h2>
					</div>
				</div>
				<div>
					<br /> <br /> <br />
				</div>

				<div class="xans-element- xans-product xans-product-normalpackage ">
					<div class="xans-element- xans-product xans-product-normalmenu ">
						<!-- 상품 수 출력 -->
						<div class="function">
							<p class="prdCount">장바구니</p>
						</div>
						
					</div>
				</div>
				<c:if test = "${!empty cartList }">
				<div id="productList" float="left">
				
				<c:if test="${!empty showReserveStored}">
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
								</table>
							</c:if>
				
					<form action="cartCart" method="post" name="frm" id="frm">
						<table align="center" width="600" border="1">
							<tr align="center">
								<td><input type="checkbox" name="selectAll" id="selectAll" /></td>
								<td>이미지</td>
								<td>메뉴명</td>
								<td>가격</td>
								<td>수량</td>
							</tr>
							<c:set var="totalPrice" value="0" />
							<c:forEach var="cart" items="${cartList }" step="1">
								<tr align="center">
									<td><input type="checkbox" name="select" id="select" value="${cart.menuNum }" /></td>
									<td><img src="popcorn/update/${cart.menuImage}" width="100" /></td>
									<td>${cart.menuName }</td>
									<td>${cart.menuPrice }</td>
									<c:set var="totalPrice" value="${totalPrice + cart.menuPrice * cart.menuQty }" />
									<td><a href="javascript:checkupQty('${cart.menuNum }',${cart.menuQty })">+ </a> ${cart.menuQty } <a href="javascript:checkQty('${cart.menuNum }',${cart.menuQty })">- </a></td>
								</tr>
							</c:forEach>
						</table>
						<table align="center" width="600" border="0">
							<tr align="center" bgcolor=black>
								<td align="right" colspan="6">
								<font color ="white" size="5">총 결제금액 : ${totalPrice }</font>
								<font color ="white" size="5">원</font>
								</td>
							</tr>
						</table>
						<table align="center" width="600" border="0">
							<tr align="center">
								<td align="right" colspan="6">
									<input type="hidden" id="submit_mode" name="submit_mode" >
									<input type="button" id="buy_Btn" value="선택상품 구매하기" onclick="buy1();">
									<input type="button" id="delete_Btn" value="선택상품 삭제" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</c:if>
			<c:if test = "${empty cartList }">
	  		<div id = "cartEmpty">
	  		 	<table>
	  		 		<tr align="center" valign="middle">
	      				<td align=right>
	         				<font size=2>장바구니가 비어있습니다.</font>
	      				</td>
	 				</tr>
	 		  	</table>
			</div>
			</c:if>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	$("#selectAll").change(function() {
		if ($(this).is(":checked", true)) {
			$("input:checkbox[name='select']").prop("checked", true);
		} else {
			$("input:checkbox[name='select']").prop("checked", false);
		}
	});
	$("#delete_Btn").click(function() {
		$("#submit_mode").val("delete");
		$("#frm").submit();
	});
	$("#buy_Btn").click(function() {
		$("#submit_mode").val("buy");
		$("#frm").submit();
	});
});
</script>
</body>
</html>