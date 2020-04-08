<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
  <link rel="icon" type="image/png" href="images/favicon.png" />
<link rel="stylesheet" type="text/css" href="css/safemall/goodsList.css" />

<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">
<script type="text/javascript">
function checkQty(num, qty){
	if(qty > 1){
		location.href="cartQtyDown.sm?goodsNum="+num;
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
		location.href = "safeMallGoodsBuy.sm?chkNum="+ num;
	}

}


</script>
</head>
<body>
	<div id="wrap">


		<!-- 헤더시작 -->
		<!-- 카테고리 -->
		
		

		<!-- 메인  -->
		<div id="container" align="center">
			<div id="contents">


				<div class="xans-element- xans-product xans-product-menupackage ">
					<div
						class="xans-element- xans-product xans-product-headcategory title ">
						<p class="banner"></p>
						<h2>

							<span>장바구니!</span>
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
							<p class="prdCount">CART LIST</p>
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
					<form action="goodsCartDelete" method="post" name="frm" id = "frm">
						<table align="center" width="600">
							<tr align="center">
								
								<td></td>
								<td>상품명</td>
								<td>가격</td>
								<td>수량</td>
								<td align="center"><input type="submit" value="삭제" /></td>
							</tr>
							<c:forEach var="cart" items="${cartList }" step="1">
								<tr align="center">
									
									<td><img src="popcorn/update/${cart.goodsImage }"
										width="100" /></td>
									<td>${cart.goodsName }</td>
									<td>${cart.goodsPrice }</td>
									<td><a href="cartQtyUp?goodsNum=${cart.goodsNum }">
											+ </a> ${cart.qty } <a
										href="javascript:checkQty('${cart.goodsNum }',${cart.qty })">
											- </a></td>
									<td align="center"><input type="checkbox" name="delete" id = "delete"
										value="${cart.goodsNum  }" /></td>
								</tr>
							</c:forEach>
						</table>
					</form>
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

			<!-- footer시작 -->
			<!-- footer종료 -->
		</div>
		<!-- wrap종료 -->
</body>
</html>