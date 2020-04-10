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
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<header class="header-area">
		<%@ include file="../navigation.jsp"%>
	</header>

<script type="text/javascript">
$(function(){
	$("#wishBtn").click(function(){
		$.ajax({
			type: "POST",
			url: "wishAdd",
			data : "num=${menu.menuNum }", 
			dataType:"html",
			success:wish_ok,
		});
	});
});
function cart_ok(responseText, statusText, xhr, $form){
	if(statusText == "success"){
			location.href="cartList";		
	}
}
function wish_ok(responseText, statusText, xhr, $form){
	var i = responseText.trim();
	if(statusText == "success"){
		if( i == "1"){
			alert("관심상품에 등록되었습니다.")
		}else{
			alert("관심상품에 삭제되었습니다.")
		}
	}
}
</script>
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
									<img src="popcorn/update/${menu.menuImage}" />
								</div>
							</div>
						</div>
						<div class="infoArea">
							<div class="detail_title ">${menu.menuName }</div>

							<div class="xans-element- xans-product xans-product-detaildesign">
								<table border="1" summary="">
									<tbody>
										<tr class=" xans-record-">
											<th scope="row"><span style="font-size: 16px;">메뉴타입</span></th>
											<td><span style="font-size: 16px;"> <strong
													id="span_product_price_text">${menu.menuType }
												</strong> <input id="product_price" name="product_price"
													type="hidden" /></span></td>
										</tr>
										<tr class=" xans-record-">
											<th scope="row"><span style="font-size: 16px;">가격</span></th>
											<td><span style="font-size: 16px;"> <strong
													id="span_product_price_text">${menu.menuPrice }&nbsp;원
												</strong> <input id="product_price" name="product_price"
													type="hidden" /></span></td>
										</tr>
										<tr class=" xans-record-">
											<th scope="row"><span style="font-size: 15px;">메뉴간략설명</span></th>
											<td><span style="font-size: 13px;">${menu.menuContent }</span></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="xans-element- xans-product xans-product-action ">
								<br /> <br /> <br /> <br /> <br /> 
								 <a href="menuModify?num=${menu.menuNum }" class="bt_cart">메뉴수정</a>
								 <input type="button" class="bt_cart" id="menuDelete" value="메뉴삭제" onclick="location.href='menuDelete?num=${menu.menuNum }'">
								 <br/><br/><br/>
							 	<input type="button" class="bt_cart" id="cartAdd" value="장바구니" onclick="location.href='cartAdd?num=${menu.menuNum}'">
								<a href="order?num=${menu.menuNum }" class=" bt_order">구매하기</a>
								<button id="wishBtn" class="bt_cart">관심상품</button>
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