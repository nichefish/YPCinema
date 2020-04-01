<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>상세보기</title>
<head>

<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="http://img.cgv.co.kr/R2014/css/layout.css" />
<link rel="stylesheet" type="text/css" href="http://img.cgv.co.kr/R2014/css/reset.css" />



<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>

<!-- 각페이지 Header Start-->

<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/common/jquery.bxslider.min.js"></script>


<script type="text/javascript">
	var pIdx = "0";
	var gidx = "100068";
	var loginstatus = "False";

	var categoryid = "5";
	var invithtml = "";

	var ggOfferType = "";

	$(document)
			.ready(
					function() {
						$.giftstore_fixObj(this, $('.category_contents_wrap'),
								$('.category_content'), $('.giftstore_logo'));
						$
								.giftstore_togetherView('category_product_together_view_wrap');
						$.fn.focusSet1(
								$('.category_product_together_view_wrap li'),
								'active');

						$.giftstore_hotdeal('category_product_detail_wrap', []);

						//영역 문제로 gift_store 클래스 추가
						$("#contents").addClass("gift_store");

						//네비게이션의 카테고리명 변경
						$(".sect-linemap .sect-bcrumb .last").html("팝콘");
						$("#cm" + categoryid).addClass("active");

						$(".com_pop_wrap").append(addTheaterHtml());

						if (invithtml != "") {
							$(".com_pop_wrap").append(invithtml);

							$("#reginvit").click(function() {
								fnCheckInviteCode(gidx);
							});
						}

						$(window)
								.bind(
										"pageshow",
										function(event) {
											if (!!window.performance
													&& window.performance.navigation.type == 2) {
												fnGetRefreshInfo();
											}
										});
					});

	function fnAddCart(_idx, _pidx) {
		if ("False" == "False") {
			app.goLogin();
		}

		var _Cnt = 0;
		var _SubNo = "";
		if ($(".com_form_count0").length > 0) {
			_Cnt = $(".com_form_count0").text().replace(/,/g, "");
		} else if ($(".com_form_count").length > 0) {
			_Cnt = $(".com_form_count").text().replace(/,/g, "");
			$(".com_checkbox_list")
					.find('li')
					.each(
							function(idx) {
								if ($(this).hasClass('active')) {
									_SubNo += ","
											+ $(this).find(
													'.add_product_info_img')[0].id
													.replace(/GG_/g, "");
								}
							});
		}

		if ($("#btn_style0").attr("inviteYN") == "N") {
			_pidx = "0";
		}

		var params = {
			UserId : encodeURIComponent(""),
			idx : encodeURIComponent(_idx),
			Quantity : encodeURIComponent(_Cnt),
			SubGG : encodeURIComponent(_SubNo),
			ProIdx : encodeURIComponent(_pidx)
		};

		$
				.ajax({
					type : "POST",
					url : "/culture-event/popcorn-store/product-detail.aspx/SetAddCartItem",
					data : "{ requestData: '" + JSON.stringify(params) + "'}",
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					async : true,
					success : function(data) {
						if (data.d.ResultCode == "00000") {
							if (data.d.ResultMessage <= 10) {
								$("#cartviewcnt").text(data.d.ResultMessage);
								if (confirm("장바구니에 등록되었습니다.\n확인하시겠습니까?")) {
									location
											.replace("/culture-event/popcorn-store/user-cart.aspx");
								} else {
									return false;
								}
							} else {
								alert("최대 10개의 상품을 장바구니에 담을 수 있습니다.");
								window.location.reload();
								//return false;
							}
						} else {
							if (data.d.ResultMessage == null) {
								app.goLogin();
								//window.location.reload();
							} else {
								if (data.d.ResultCode != "") {
									alert(data.d.ResultMessage);
								}
								// 전체판매수량 소진시 새로고침해준다
								if (data.d.ResultCode == "99994"
										|| data.d.ResultCode == "99997"
										|| data.d.ResultCode == "99999") {
									alert(data.d.ResultMessage);
									window.location.reload();
								}
							}
						}
					},
					error : function(xhr, status, err) {
						var err = eval("(" + xhr.responseText + ")");
						//alert(err.Message);
						alert("장애가 발생하였습니다. 잠시 후 다시 시도해 주세요.");
						window.location.reload();
					}
				});

	}

	function fnBuyGoods(_idx, pidx, type, cnt) {

		var ggOfferType = "";
		if (loginstatus == "False") {
			app.goLogin();
		}

		if (_idx != gidx) {
			fnCheckPromotionGoods(_idx);
		}

		var _Cnt = cnt;
		var _SubNo = "";
		var _pidx = pidx;

		if ($("#btn_style0").attr("inviteYN") == "N"
				|| $("#btn_style0").attr("inviteYN") == "undefined") {
			_pidx = "0";
		}

		if (cnt == 0) {
			if ($(".com_form_count0").length > 0) {
				_Cnt = $(".com_form_count0").text().replace(/,/g, "");
			} else if ($(".com_form_count").length > 0) {
				_Cnt = $(".com_form_count").text().replace(/,/g, "");
				$(".com_checkbox_list")
						.find('li')
						.each(
								function(idx) {
									if ($(this).hasClass('active')) {
										_SubNo += ","
												+ $(this)
														.find(
																'.add_product_info_img')[0].id
														.replace(/GG_/g, "");
									}
								});
			} else {
				_Cnt = $(".com_custom_selectbox_btn").text().replace(/,/g, "");
			}
		}

		var params = {
			idx : encodeURIComponent(_idx),
			Quantity : encodeURIComponent(_Cnt),
			SubGG : encodeURIComponent(_SubNo),
			ProIdx : encodeURIComponent(_pidx),
			Type : encodeURIComponent(type),
			UserId : encodeURIComponent("")
		};

		$
				.ajax({
					type : "POST",
					url : "/culture-event/popcorn-store/product-detail.aspx/SetPurchaseItem",
					data : "{ requestData: '" + JSON.stringify(params) + "'}",
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					async : true,
					success : function(data) {
						if (data.d.ResultCode == "00000") {
							if (ggOfferType === "02") {
								NetFunnel_Action({
									"skin_id" : "template1",
									"action_id" : "act_01"
								}, {
									success : function(ev, ret) {

										$('#divAction').append(
												data.d.ResultHtml);
										$('#frmBuyAction').submit();

									},
									block : function(ev, ret) {

										alert("상품이 모두 판매되었습니다.");
										return false;
										//  location.reload();

									}
								});
							} else {

								$('#divAction').append(data.d.ResultHtml);
								$('#frmBuyAction').submit();
							}
						} else {
							if (data.d.ResultMessage == null) {
								app.goLogin();
								//window.location.reload();
							} else {
								alert(data.d.ResultMessage);

								if (data.d.ResultCode == "99999") {
									var additems = $(
											".com_custom_checkbox_wrap p")
											.hasClass(
													"com_custom_checkbox_title");

									if (additems) {
										window.location.reload();
									} else {
										location
												.replace("/culture-event/popcorn-store/");
									}
								}
								// 전체판매수량 소진시 새로고침해준다
								else if (data.d.ResultCode == "99994") {
									window.location.reload();
								}
							}
						}
					},
					error : function(xhr, status, err) {
						var err = eval("(" + xhr.responseText + ")");
						//alert(err.Message);
						alert("장애가 발생하였습니다. 잠시 후 다시 시도해 주세요.");
						window.location.reload();
					}
				});
	}

	function fnAddGoodsName(obj) {
		var addgoods = "";
		var cnt = 0;

		if ($(obj).attr("chkstatus") == "Y") {
			$(obj).attr("chkstatus", "N");
		} else {
			$(obj).attr("chkstatus", "Y");
		}

		$(".com_custom_checkbox").each(
				function() {

					if ($(this).attr("chkstatus") == "Y") {
						if (addgoods == "") {
							addgoods = "(추가 : ";
							addgoods += $(this).parent().find(
									".add_product_title").text();
						} else {
							addgoods += ", "
									+ $(this).parent().find(
											".add_product_title").text();
						}

					}
				});

		if (cnt >= 4) {
			alert("최대 3개까지 구매가 가능합니다.");
			return false;
		}

		if (addgoods != "") {
			addgoods += ")";
		}

		$(".com_form_number_subtitle").text(addgoods);
	}

	function fnSetLeftPrice(obj) {
		var setprice = $(obj).text();
		$(".com_total_price").text(setprice);
	}
</script>


<!--/각페이지 Header End-->
<script type="text/javascript">
	//<![CDATA[

	function getCookieVal(offset) {
		var endstr = document.cookie.indexOf(";", offset);
		if (endstr == -1)
			endstr = document.cookie.length;
		return unescape(document.cookie.substring(offset, endstr));
	}
	function GetCookieAd(name) {
		var arg = name + "=";
		var alen = arg.length;
		var clen = document.cookie.length;
		var i = 0;
		while (i < clen) { //while open
			var j = i + alen;
			if (document.cookie.substring(i, j) == arg)
				return getCookieVal(j);
			i = document.cookie.indexOf(" ", i) + 1;
			if (i == 0)
				break;
		} //while close
		return null;
	}
	function setCookieAD(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setTime(todayDate.getTime()
				+ (expiredays * 24 * 60 * 60 * 1000));
		document.cookie = name + "=" + escape(value) + "; expires="
				+ todayDate.toGMTString() + "; path=/; domain=cgv.co.kr";
	}
</script>
<script type="text/javascript"
	src="https://nsso.cjone.com/findCookieSecured.jsp?cjssoq=KmKemd3SKuGXtJ0mxz8dZDEOFfzpnPtgY7jfNhjM%2fV2QUsCGricCcwjr6FCN9MdFCH19u2Eff4s2RmpTxrDZVUZtNExZb3lPSmQydGx2MkI5UW04MmhmVHo4YnRnQURMMEFvQ2NsWm52VnFieXc0OHIrZzJvR0llMnRoNTZxN0o%3d"></script>
</head>
<body class="">

	<form name="ssologinfrm"
		action="https://www.cgv.co.kr/user/login/login-sso.aspx" method="post">
		<input type="hidden" id="cjssoq" name="cjssoq" /> <input
			type="hidden" name="returnURL"
			value="/culture-event/popcorn-store/product-detail.aspx?GG_NO=100068" />
	</form>



	<div id="cgvwrap">

		<!-- Header -->
			<header class="header-area">
			<%@ include file="../navigation.jsp"%>
		</header>

		<!-- /Header -->
		<!-- Contaniner -->
		<div id="contaniner" class="">
			<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->

			<!-- LineMap -->


			<!-- //LineMap -->

			<!-- Contents Area -->
			<div id="contents" class="">

				<!-- Contents Start -->


				<!-- /Contaniner -->
				<!-- S 카테고리 메뉴 & 받은선물/장바구니 -->


				<script type="text/javascript"
					src="http://img.cgv.co.kr/R2014/js/giftstore/giftstore.js"></script>
				<script type="text/javascript"
					src="http://img.cgv.co.kr/R2014/js/giftstore/commonstore.js"></script>

				<link rel="stylesheet" media="all" type="text/css"
					href="http://img.cgv.co.kr/R2014/css/giftstore/giftstore.css" />

				<script language="javascript" type="text/javascript">
					var cname = "";

					history.navigationMode = 'compatible';
					$(document).ready(
							function() {
								$.giftstore_fixObj(this,
										$('.category_contents_wrap'),
										$('.category_content'),
										$('.giftstore_logo'));

								//영역 문제로 gift_store 클래스 추가
								$("#contents").addClass("gift_store");

								if (cname != "") {
									$(".sect-linemap .sect-bcrumb .last").html(
											"");
								}

							});

					function fnCategoryData(cno) {
						location.href = "/culture-event/popcorn-store/store-category.aspx?CategoryIdx="
								+ cno;
					}
				</script>


				<div class='category_wrap'>
					<div class='category_contents_wrap'>
						<ul class='category_content'>
							<li class='giftstore_logo'><a
								href='/culture-event/popcorn-store/default.aspx'>cgv 스토어</a></li>
							<li id='cm1' name='categorymenu' class=''><a href='#'
								onclick="javascript:fnCategoryData('1');">패키지</a></li>
							<li id='cm2' name='categorymenu' class=''><a href='#'
								onclick="javascript:fnCategoryData('2');">영화관람권</a></li>
							<li id='cm3' name='categorymenu' class=''><a href='#'
								onclick="javascript:fnCategoryData('3');">기프트카드</a></li>
							<li id='cm4' name='categorymenu' class=''><a href='#'
								onclick="javascript:fnCategoryData('4');">콤보</a></li>
							<li id='cm5' name='categorymenu' class=''><a href='#'
								onclick="javascript:fnCategoryData('5');">팝콘</a></li>
							<li id='cm6' name='categorymenu' class=''><a href='#'
								onclick="javascript:fnCategoryData('6');">음료</a></li>
							<li id='cm7' name='categorymenu' class=''><a href='#'
								onclick="javascript:fnCategoryData('7');">스낵</a></li>
							<li id='cm10' name='categorymenu' class=''><a href='#'
								onclick="javascript:fnCategoryData('10');">플레이존</a></li>
							<li><a href='#'
								onclick="javascript:location.href='/culture-event/popcorn-store/introduce-gift-card.aspx?CategoryIdx=0';">상품권소개</a></li>
						</ul>
						<ul class='cart_content'>
							<li><a href='#'
								onclick='javascript:app.goLogin();return false;'>내 기프트콘</a><span
								id='giftconcnt'>0</span></li>
							<li><a href='#'
								onclick='javascript:app.goLogin();return false;'>장바구니</a><span
								id='cartviewcnt'>0</span></li>
						</ul>
					</div>
				</div>

				<!-- E 카테고리 메뉴 & 받은선물/장바구니 -->

				<!-- 상품정보 -->
				<div class='category_product_detail_wrap'>
					<strong class='category_product_detail_title'>달콤팝콘(L)<span>기프트콘</span></strong>
					<div class='category_product_detail_contents'>
						<div class='category_product_detail_contents_img_wrap'>
							<ul class='bxslider'>
								<li><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463244218630.jpg'
									alt='달콤팝콘(L)'></li>
							</ul>
						</div>
						<div class='category_product_detail_contents_wrap'>
							<p class='category_product_detail_sale_price_wrap'>
								<span class="store_deatail_sale_price" id="spnSalePrice">6,000</span>
							</p>
							<dl class='category_product_detail_add_info'>
								<dt>상품구성</dt>
								<dd>달콤팝콘(L)</dd>
								<dt>유효기간</dt>
								<dd>구매일로부터 6개월 이내</dd>
								<dt>원산지</dt>
								<dd>옥수수: 미국산</dd>
							</dl>
							<div class='category_product_detail_price_wrap'>
								<div class='com_form_number'>
									<a href="#none"
										onclick="javascript:$.fn.comFormNumberCnt('com_form_count0', 'com_total_price' ,'com_total_price0', -1, 1, 10);"
										class="com_btn_minus">-</a> <span
										class='com_form_count com_form_count0'>1</span> <a
										href="#none"
										onclick="javascript:$.fn.comFormNumberCnt('com_form_count0','com_total_price', 'com_total_price0', 1, 1, 10);"
										class="com_btn_plus">+</a> <span class='com_total_price'
										id='spantotalprice'>6,000</span>
								</div>
								<div class='category_product_detail_total_price'>
									<p class='com_form_total_price'>
										총 구매금액<span class='com_total_price0 com_product_total_price'>6,000</span>
									</p>
								</div>
							</div>
							<div class='category_product_detail_btn_wrap'>
								<a href='#' onclick='javascript:app.goLogin();return false;'
									class='btn_cart'>장바구니</a> <a href='#'
									onclick='javascript:app.goLogin(); return false;'>장바구니</a> <a
									href='#' onclick='javascript:app.goLogin();return false;'>구매하기</a>
							</div>
						</div>
					</div>
					<p class='category_product_detail_txtbox'>달콤한 카라멜 향이 가득한 달콤팝콘을
						즐겨보세요!</p>
					<dl class='category_product_detail_dlist'>
						<dt>이용안내</dt>
						<dd>
							• 해당 기프트콘은 오프라인 매점에서 실제 상품으로 교환할 수 있는 온라인 상품권입니다.<br /> • • 매점상품
							기프트콘은 극장 매점에서 상품 교환 후 수령한 영수증으로 CJ ONE 적립이 가능합니다.<br /> • 수신자는
							선물받은 기프트콘의 수신거절을 요청할 수 있으며, 이 경우 구매자에게 취소 및 환불에 대한 안내가 이루어집니다. <br />
							• 결제취소 가능 기간이 경과한 후 수신자가 수신거절을 요청할 경우 구매자에게 기프트콘이 재발송됩니다.<br />
							• CGV고객센터 1544-1122
						</dd>
						
						
					</dl>
				</div>
				<!-- 추가상품 -->

				<!-- 같이본상품 -->
				<div class='category_product_together_view_wrap'>
					<strong class='category_product_together_view_title'>이 상품과
						함께 본 상품</strong>
					<ul class='bxslider com_list_style'>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100047'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463237411110.jpg'
									alt='더블초콜렛 팝콘(L)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>더블초콜렛 팝콘(L)</span> <span
									class='com_list_text_name'>더블초콜렛 팝콘(L)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>6,500</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100081'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15464078827160.jpg'
									alt='더블치즈팝콘(M)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>더블치즈팝콘(M)</span> <span
									class='com_list_text_name'>더블치즈팝콘(M)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>5,500</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100069'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463244802080.jpg'
									alt='고소팝콘(L)'></span> <span class='com_list_text_wrap'> <span
									class='com_list_text_title'>고소팝콘(L)</span> <span
									class='com_list_text_name'>고소팝콘(L)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>5,000</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100066'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463242306110.jpg'
									alt='달콤팝콘(M)'></span> <span class='com_list_text_wrap'> <span
									class='com_list_text_title'>달콤팝콘(M)</span> <span
									class='com_list_text_name'>달콤팝콘(M)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>5,500</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100071'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463247060090.jpg'
									alt='더블치즈팝콘(L)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>더블치즈팝콘(L)</span> <span
									class='com_list_text_name'>더블치즈팝콘(L)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>6,000</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100045'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463238760220.jpg'
									alt='크리미카라멜 팝콘(M)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>크리미카라멜 팝콘(M)</span> <span
									class='com_list_text_name'>크리미카라멜 팝콘(M)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>4,500</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100048'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463236810830.jpg'
									alt='스위트랜치 팝콘(L)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>스위트랜치 팝콘(L)</span> <span
									class='com_list_text_name'>스위트랜치 팝콘(L)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>6,500</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100070'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463246055890.jpg'
									alt='바질어니언팝콘(L)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>바질어니언팝콘(L)</span> <span
									class='com_list_text_name'>바질어니언팝콘(L)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>6,000</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100049'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463236166390.jpg'
									alt='리얼치즈 팝콘(L)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>리얼치즈 팝콘(L)</span> <span
									class='com_list_text_name'>리얼치즈 팝콘(L)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>6,000</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100043'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463239952060.jpg'
									alt='스위트랜치 팝콘(M)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>스위트랜치 팝콘(M)</span> <span
									class='com_list_text_name'>스위트랜치 팝콘(M)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>5,000</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100050'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463235184670.jpg'
									alt='크리미카라멜 팝콘(L)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>크리미카라멜 팝콘(L)</span> <span
									class='com_list_text_name'>크리미카라멜 팝콘(L)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>6,000</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100082'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15464079703730.jpg'
									alt='바질어니언팝콘(M)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>바질어니언팝콘(M)</span> <span
									class='com_list_text_name'>바질어니언팝콘(M)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>5,500</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100044'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463239425560.jpg'
									alt='리얼치즈 팝콘(M)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>리얼치즈 팝콘(M)</span> <span
									class='com_list_text_name'>리얼치즈 팝콘(M)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>4,500</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100051'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463231091190.jpg'
									alt='카라멜&치즈 믹스팝콘(L)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>카라멜&치즈 믹스팝콘(L)</span> <span
									class='com_list_text_name'>카라멜&치즈 믹스팝콘(L)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>6,000</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100046'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463237970220.jpg'
									alt='카라멜&치즈 믹스팝콘(M)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>카라멜&치즈 믹스팝콘(M)</span> <span
									class='com_list_text_name'>카라멜&치즈 믹스팝콘(M)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>4,500</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100067'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463243503300.jpg'
									alt='고소팝콘(M)'></span> <span class='com_list_text_wrap'> <span
									class='com_list_text_title'>고소팝콘(M)</span> <span
									class='com_list_text_name'>고소팝콘(M)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>4,500</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
						<li class=''><a
							href='/culture-event/popcorn-store/product-detail.aspx?GG_NO=100042'
							class='btn_category_product'> <span class='com_list_img_wrap'><img
									src='http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/15463240575280.jpg'
									alt='더블초콜렛 팝콘(M)'></span> <span class='com_list_text_wrap'>
									<span class='com_list_text_title'>더블초콜렛 팝콘(M)</span> <span
									class='com_list_text_name'>더블초콜렛 팝콘(M)</span> <span
									class='com_list_sale_price_wrap'> <span
										class='store_deatail_source_price'>5,000</span>
								</span>
							</span>
						</a> <a href='#' onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_cart'>장바구니</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_gift'>선물하기</a> <a href='#'
							onclick='javascript:app.goLogin();return false;'
							class='btn_category_product_buy'>구매하기</a></li>
					</ul>
				</div>


				<!--/ Contents End -->

			</div>
			<!-- /Contents Area -->
		</div>
		<!-- /Contaniner -->

		<!-- Footer -->
		<footer class="footer-area">
			<%@ include file="../footer.jsp"%>
		</footer>
		<!-- /Footer -->
	</div>
</body>
</html>