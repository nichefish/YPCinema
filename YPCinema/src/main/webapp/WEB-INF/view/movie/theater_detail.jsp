<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="icon" href="../img/fvc.jpg">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
</head>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 		<h2>양평시네마 <b>${numTheater.theater_name}</b> 상세정보</h2>
 		<p>찾아오는 길:</p>
		<div id="map" style="width:55%;height:350px; border:1px solid red;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eda433c823b7e3d4d428f970b8755896&libraries=services"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var geocoder = new kakao.maps.services.Geocoder();
		
		geocoder.addressSearch("${numTheater.theater_addr1}", function(result, status) {
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${numTheater.theater_name}</div>'
		        });
		        infowindow.open(map, marker);
		        map.setCenter(coords);
		    } 
		});    
		</script>
 		<table width="60%" border="0">
 			<tr>
 				<td align="right">
 					<p><br /></p>
 					<p>
						<c:if test="${authInfo.m_admin eq '0' || authInfo.mode eq '0' || empty authInfo}">	<!-- 비로그인 + 관리자빼고 다... -->
						<input type="button" onclick="location.href='../showtime/list?theater=${numTheater.theater_num}'" value="지점 상영일정 보기" />
						</c:if>
						<input type="button" onclick="location.href='list'" value="목록으로" />
					</p>
 				</td>
 			</tr>
 		</table>
		<table width="60%" border="1" cellpadding="0" cellspacing="0" >
			<tr>
				<td align="center" width="160">지점 고유번호</td>
				<td colspan="2">${numTheater.theater_num}</td>
			</tr>
			<tr>
				<td align="center" width="160">지점 주소</td>
				<td colspan="2">${numTheater.theater_addr1} ${numTheater.theater_addr2} ${numTheater.theater_zip}</td>
			</tr>
			<tr>
				<td align="center" width="160">지점 연락처</td>
				<td colspan="2">☎${numTheater.theater_ph}</td>
			</tr>
			<tr>
				<td align="center" width="160">지점 특화장르</td>
				<td>
					<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!-- 이용자 및 비로그인 아니면 -->
					<form method="post">
						<input type="hidden" name="theater_num" value="${numTheater.theater_num}">
						<select name="theater_special">
							<option value="${numTheater.theater_special}" selected>[${numTheater.theater_special}]</option>
							<option value="0" label="없음">0</option>
							<option value="드라마">드라마</option>
							<option value="판타지">판타지</option>
							<option value="공포">공포</option>
							<option value="스릴러">스릴러</option>
							<option value="코미디">코미디</option>
							<option value="액션">액션</option>
							<option value="로맨스">로맨스</option>
							<option value="가족">가족</option>
							<option value="애니메이션">애니메이션</option>
						</select>
						<input type="submit" value="특화장르 수정" />
					</form>
					</c:if>
					<c:if test="${authInfo.m_admin eq '0' || authInfo.mode eq '0' || empty authInfo}">	<!-- 비로그인 + 관리자빼고 다... -->
						${numTheater.theater_special}
					</c:if>
				</td>
			</tr>
			<tr>
				<td align="center" >지점 규모등급</td>
				<td colspan="2">${numTheater.theater_rating}</td>
			</tr>
		</table>
		<p><br /></p>
		<p>
			양평시네마 <b>${numTheater.theater_name}</b> 상영관 정보
			<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!-- 이용자 및 비로그인 아니면 -->
			<input type="button" onclick="location.href='addScreen?num=${numTheater.theater_num}'" value="상영관 등록" />
			</c:if>
		</p>
		<table width="60%" border="1" cellpadding="0" cellspacing="0" >
			<c:forEach items="${lists}" var="screen">
			<tr align="center" valign="middle">
				<td align="center" width="160"><a href="<c:url value='/theater/detailScreen?num=${screen.screen_num}' />">${screen.screen_name}</a></td>
				<td align="center">${screen.screen_max_seat}석 (${screen.screen_row})</td>
			</tr>
			</c:forEach>
		</table>
		<p><br /></p>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 사용하세요&libraries=services"></script>
</body>
</html>