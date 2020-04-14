<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	$("#coupon").change(function() {
		alert("쿠폰이 적용되었습니다.");
		alert($("#idid").val());
		alert($("#coupon").val());
		$("#seat_total_price").val($("#idid").val() - Number($("#coupon").val()));
	});
});
</script>
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
					<form:form action="/YPCinema/kakaoPay" id="frm" method="post" commandName="showReserveCommand">
					<div>
					<br /> <br /> <br />
					
					
					
					
								<table>
									<tr>
										<td colspan="2" align="right">
											적용쿠폰: <select id="coupon">
												<option value="0" label="[쿠폰을 선택해주세요.]">
												<c:forEach items="${selectLists}" var="coupon">
													<option value="${coupon.c_score}" label="${coupon.c_name}">
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td>총 가격</td>
										<td colspan="4">
										<c:if test="${!empty showReserveStored}">
											<input type="hidden" name="idid" id="idid" value="${showReserveStored.seat_total_price + totalPrice}">
											<input type="text" name="seat_total_price" id="seat_total_price" value="${showReserveStored.seat_total_price + totalPrice}">
										</c:if>
										<c:if test="${empty showReserveStored}">
											<input type="hidden" name="idid" id="idid" value="${totalPrice}">
											<input type="text" name="seat_total_price" id="seat_total_price" value="${totalPrice}">
										</c:if>
										</td>
									</tr>
									<tr>
										<td>이메일 주소</td>
										<td colspan="4"><input type="text" name="payment_email" id="payment_email" value="${memberCommand.m_email }"></td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td colspan="4"><input type="text" name="payment_ph" id="payment_ph" value="${memberCommand.m_ph }"></td>
									</tr>
								</table>
								
								</div>
					<div class="xans-element- xans-product xans-product-normalpackage ">
					<div class="xans-element- xans-product xans-product-normalmenu ">
						
						</div>
					</div>
				
				<div class="relCon">
					<div class="table11" id="" align="center">
						<input type = "submit" value = "결제하기" >
					</div>
				</div>
				
				</form:form>
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