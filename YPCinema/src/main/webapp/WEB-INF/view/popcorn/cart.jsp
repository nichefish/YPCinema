<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/goodsList.css" />

<script type="text/javascript">
function checkQty(num, qty){
	if(qty > 1){
		location.href="cartQtyDown?menuNum="+num;
	}else{
		return false;
	}
}
function buy1() {
	var chkbox = document.getElementsByName('delete'); 
	var chk = 0; 
	var num = "";
	for(var i=0 ; i<chkbox.length ; i++) 
	{ 
		if(chkbox[i].checked) 
		{ 
			chk += 1;
			num+=chkbox[i].value +",";
		} 
 	}
	if(chk == 0) {
		alert("구매 상품을 선택해 주세요.");
	}else { 
		location.href = "menuBuy?chkNum="+ num;
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
						<!-- 상품 수 출력 종료 -->
					</div>
				</div>
				<!-- 메인 종료 -->
				<div>
					<br /> <br /> <br />
				</div>
<c:if test = "${!empty cartList }">
   

				<div id="productList" float="left">
					<form action="cartRemove" method="post" name="frm" id = "frm">
						<table align="center" width="600" border="1">
							<tr align="center">
								<td></td>
								<td>이미지</td>
								<td>메뉴명</td>
								<td>가격</td>
								<td>수량</td>
								<td align="center"><input type="submit" value="삭제" /></td>
							</tr>
							<c:forEach var="cart" items="${cartList }" step="1">
								<tr align="center">
									<td><img src="popcorn/update/${cart.menuImage }"
										width="100" /></td>
									<td>${cart.menuName }</td>
									<td>${cart.menuPrice }</td>
									<td><a href="cartQtyUp?num=${cart.menuNum }">+ </a>
									 ${cart.qty } <a href="javascript:checkQty('${cart.menuNum }',${cart.qty })">- </a></td>
									<td align="center">
									<input type="checkbox" name="delete" id = "delete"
										value="${cart.menuNum  }" /></td>
								</tr>
							</c:forEach>
						</table>
					</form>
					<table align="center" width="600" border="0">
	<tr align="center" bgcolor="yellow">
		<td align="right" colspan="6">
		<font color ="gray" size="5">총 결제금액 : ${totalMoney }</font>
		<font color ="black" size="5">원</font>
		</td>
	</tr>
</table>
					<table align="center" width="600" border="0">
						<tr align="center">
							<td align="right" colspan="6"> 
									<input type = "button" value = "구매하기" onclick="buy1();"></td>
						</tr>
					</table>
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