<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세보기</title>

<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/goodsDetail.css" />
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
</head>
<body>
	<header class="header-area">
		<%@ include file="../navigation.jsp"%>
	</header>

	<div id="wrap">
		<div id="container" align="center">
			<div id="contents">
				<div class="xans-element- xans-product xans-product-detail">
					<header class="header-area"> </header>
					<div class="detailArea">
						<div
							class="xans-element- xans-product xans-product-image imgArea ">
							<div class="keyImg">
								<div class="thumbnail">
									<img src="popcorn/update/${goods.goodsImage}" />
								</div>
							</div>
						</div>
						<div class="infoArea">
							<div class="detail_title ">${goods.goodsName }</div>

							<div class="xans-element- xans-product xans-product-detaildesign">
								<table border="1" summary="">
									<tbody>
										<tr class=" xans-record-">
											<th scope="row"><span style="font-size: 18px;">가격</span></th>
											<td><span style="font-size: 18px;"> <strong
													id="span_product_price_text">${goods.goodsPrice }&nbsp;원
												</strong> <input id="product_price" name="product_price"
													type="hidden" /></span></td>
										</tr>
										<tr class=" xans-record-">
											<th scope="row"><span style="font-size: 15px;">상품간략설명</span></th>
											<td><span style="font-size: 15px;">${goods.goodsPrice }</span></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="xans-element- xans-product xans-product-action ">
								<br /> <br /> <br /> <br /> <br />
								<a href="cartAdd?num=${goods.goodsNum }" class="bt_cart"> 장바구니</a>
								<a href="order?num=${goods.goodsNum }" class=" bt_order">구매하기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="xans-element- xans-product xans-product-normalpackage "
					style="width: 1100px">
					<div class="xans-element- xans-product xans-product-normalmenu ">
						<div class="function">
							<p class="prdCount">상세정보</p>
						</div>
						<br>
						<div style="text-align: left; width: 1000px;">
							<dt>이용안내</dt>
							<br> <strong>• 매점상품 기프트콘은</strong> 오프라인 매점에서 실제 상품으로 교환할 수
							있는 온라인 상품권입니다.<br /> • 구매 후 전송받으신 기프트콘은,<br /> - 사용가능한 YP시네마
							매점에서 지정된 해당 상품으로만 교환이 가능합니다.<br /> - 해당 상품 내에서 팝콘 혹은 음료, 스낵 변경 시
							추가 비용이 발생합니다.<br /> - YP오더(주문예약)를 신청하신 고객은 시간을 반드시 지켜주시길 바랍니다.<br />
							- 교환 완료한 상품의 환불 및 반품은 불가합니다.<br /> • 상기 이미지는 실제와 다를 수 있습니다.<br>
							• YP시네마 고객센터 1234-5678
						</div>
					</div>
				</div>
			</div>
			<br /> <br />
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