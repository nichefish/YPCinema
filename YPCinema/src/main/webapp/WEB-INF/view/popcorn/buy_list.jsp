<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품결제</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<header class="header-area">
			<%@ include file="../navigation.jsp"%>
		</header>
		<!-- 메인  -->
		<div id="container" align="center">
			<div id="contents">


				<div class="xans-element- xans-product xans-product-menupackage ">
					<div
						class="xans-element- xans-product xans-product-headcategory title ">
						<p class="banner"></p>
						<h2>

							<span>결제</span>
						</h2>
					</div>
				</div>
				<div>
			
				</div>

				
				<!-- 메인 종료 -->
				<div>
					<br /> <br />
				</div>
				
				<div class="xans-element- xans-product xans-product-normalpackage ">
					<div class="xans-element- xans-product xans-product-normalmenu ">
						<!-- 상품 수 출력 -->
						<div class="function">
							<p class="prdCount">메뉴리스트</p>
						</div>
						<!-- 상품 수 출력 종료 -->
					</div>
				</div>
				<div>
					<br /> <br /> <br />
					</div>
					<div id="productList" float="left">
						
							<table align="center" width="600">
								<tr align="center">

									<td></td>
									<td>상품명</td>
									<td>가격</td>
									<td>수량</td>
									
								</tr>
								<c:forEach var="cart" items="${cartList }" step="1">
										<tr align="center">
												<td><img src="popcorn/update/${cart.menuImage }"
												width="100" /></td>
											<td>${cart.menuName }</td>
											<td>${cart.menuPrice }원</td>
											<td><a href="cartQtyUp?num=${cart.menuNum }">
													</a> ${cart.menuQty }개 <a
												href="javascript:checkQty('${cart.menuNum }',${cart.menuQty })">
													</a></td>
											<c:set var="totalPrice" value="${totalPrice + cart.menuPrice * cart.menuQty }" />
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
					</div>
					<div>
					<br /> <br /> <br />
					</div>
					<div class="xans-element- xans-product xans-product-normalpackage ">
					<div class="xans-element- xans-product xans-product-normalmenu ">
						
					</div>
				</div>
				<div>
				
					</div>
				
				<div class="relCon">
					
					<div class="table11" id="" align="center">
					<form action="#" method="post" id = "frm" name="">
					
						
						<input type = "hidden" value = "${ chkNum }" name = "chkNum"/>
						<input type = "submit" value = "결제하기" >
					</form>
					</div>
				
				</div>
			</div>

			<!-- 컨텐츠 종료-->
			<!-- footer시작 -->
		<footer class="footer-area">
			<%@ include file="../footer.jsp"%>
		</footer>
		<!-- footer종료 -->
	</div>
	<!-- wrap종료 -->
</body>
</html>