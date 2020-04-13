<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	$(".economy").closest("td").css('background-color', 'yellow');
	$(".normal").closest("td").css('background-color', '#87ceeb');
	$(".prime").closest("td").css('background-color', '#ff8080');
	$(".reserved").closest("td").css('background-color', 'black');
	
	$(".reserved").closest("td").children("input:checkbox[name='seat_num_array']").prop("disabled", true);
	$(".reserved").closest("td").children("input:checkbox[name='seat_num_array']").removeAttr("name");
	$(".reserved").closest("td").children("input:checkbox[name='seat_num_array']").removeClass("unselected");
	
	$("#reserve_people_max").change(function() {
		var str = "총 " + $("#reserve_people_max").val() + "좌석 중 " + $(":checkbox[name='seat_num_array']:checked").length + "좌석 선택되었습니다."
		$("#reserve_people_now").html(str);
		alert("선택할 만큼 선택하셨습니다. 선택을 초기화합니다.");
		$("input:checkbox[name='seat_num_array']").prop("checked", false);
		$("input:checkbox[name='seat_num_array']").prop("disabled", false);
		$("input[name='seat_price_array']").removeAttr("name");
		$("#seat_total_price").val("0");
		$("input:checkbox[name='seat_num_array']").removeClass("selected");
		$("input:checkbox[name='seat_num_array']").attr("class", "unselected");
		$(".economy").closest("td").css('background-color', 'yellow');
		$(".normal").closest("td").css('background-color', '#87ceeb');
		$(".prime").closest("td").css('background-color', '#ff8080');
	});
	$("input:checkbox[name='seat_num_array']").change(function() {
		var str = "총" + $("#reserve_people_max").val() + "좌석 중 " + $(":checkbox[name='seat_num_array']:checked").length + "좌석 선택되었습니다."
		$("#reserve_people_now").html(str);
		if ($(this).is(":checked", true)) {
			var total_price = $("#seat_total_price").val();
			total_price = Number(total_price) + Number($(this).parent().children('.seat_price').val());
			$("#seat_total_price").val(total_price);
			$(this).parent().children('.seat_price').attr("name", "seat_price_array");
			$(this).removeClass("unselected");
			$(this).attr("class", "selected");
			if ($(":checkbox[name='seat_num_array']:checked").length >= $("#reserve_people_max").val()) {
				alert("선택할 만큼 선택하셨습니다.");
				$("input.unselected:checkbox[name='seat_num_array']").prop("disabled", true);
				$(".unselected").closest("td").css('background-color', 'black');
			}
		} else {
			var total_price = $("#seat_total_price").val();
			total_price = Number(total_price) - Number($(this).parent().children('.seat_price').val());
			$("#seat_total_price").val(total_price);
			$(this).parent().children('.seat_price').removeAttr("name");
			$(this).removeClass("selected");
			$(this).attr("class", "unselected");
			if ($(":checkbox[name='seat_num_array']:checked").length == $("#reserve_people_max").val() - 1) {
				alert("...다시 선택하세요.");
				$("input.unselected:checkbox[name='seat_num_array']").prop("disabled", false);
				$(".economy").closest("td").css('background-color', 'yellow');
				$(".normal").closest("td").css('background-color', '#87ceeb');
				$(".prime").closest("td").css('background-color', '#ff8080');
			}
		}
	});
	$("#submit_btn").click(function() {
		var test = confirm('선택한 좌석으로 예매신청하시겠습니까?');
		if (test) {
			var test2 = confirm("예매정보를 저장하고 매점오더 페이지로 이동하시겠습니까?");
			if (test2) {
				$("#order_mode").val("order");
			} else {
				$("#order_mode").val("direct");
			}
			$("#select_seats").submit();
		}
	});
	$("#select_seats").submit(function(){
		if(!$(":checkbox[name='seat_num_array']:checked").val()) {
		    alert("좌석을 선택하지 않으면 진행할 수 없습니다!");                        
		    return false;
		}
	});
});
</script>
</head>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
		<table border="1">
			<tr>
				<td>상영일정번호</td>
				<td>${show.show_num }</td>
			</tr>
			<tr>
				<td>지점</td>
				<td>${show.theater_num}</td>
			</tr>
			<tr>
				<td>상영관 번호</td>
				<td>${show.screen_num}</td>
			</tr>
			<tr>
				<td>영화번호</td>
				<td>${show.movie_num}</td>
			</tr>
			<tr>
				<td>상영일자</td>
				<td>${show.show_date}</td>
			</tr>
			<tr>
				<td>상영시간</td>
				<td>${show.show_start} ~ ${show.show_end}</td>
			</tr>
			<tr>
				<td>상영관 가로 행</td>
				<td>
					${screenCommand.screen_row} (${screenCommand.screen_row_array[0]} // ${screenCommand.screen_row_array[1]} // ${screenCommand.screen_row_array[2]})
					<c:set var="rowRow" value="${screenCommand.screen_row_array[0] + screenCommand.screen_row_array[1] +screenCommand.screen_row_array[2]}"></c:set>
				</td>
			</tr>
			<tr>
				<td>상영관 가로 열</td>
				<td>${screenCommand.screen_col}</td>
			</tr>
			<tr>
				<td>스크린 최대 좌석수</td>
				<td>${screenCommand.screen_max_seat}</td>
			</tr>
		</table>
		<table border="0">
			<tr>
				<td>
					<input type="button" onclick="location.href='list'" value="상영일정표로 돌아가기" >
				</td>
			</tr>
		</table>
		<p><br /></p>
		<form:form action="orderList" id="select_seats" method="post" commandName="showReserveCommand">
			<form:hidden path="show_num" />
			<form:hidden path="theater_num" />
			<form:hidden path="screen_num" />
			인원수를 선택하세요: 
			<select name="reserve_people_max" id="reserve_people_max">
				<option value="1" label="1명" selected>1</option>
				<option value="2" label="2명">2</option>
				<option value="3" label="3명">3</option>
				<option value="4" label="4명">4</option>
			</select>
			<p id="reserve_people_now">총 1좌석 중 0좌석 선택하셨습니다.</p>
			(총 금액: <input type="number" name="seat_total_price" id="seat_total_price" placeholder="0" value="">원)
			<div id="total_price"></div>
			<p><br /></p>
			<div style="width:60%;">
				<img src="../img/screen.png">
				<hr />
			</div>
			<table border="0">
				<tr>
					<c:forEach var="i" begin="1" end="${screenCommand.screen_max_seat}" varStatus="status">
					<c:set var="rowCount1" value="${status.count % rowRow}" />
					<c:set var="rowCount2" value="${status.count / rowRow}" />
					<td align="center" border="1" width="20">
						${status.count}	<br/>
						<input type="checkbox" class="unselected" name="seat_num_array" value="${status.count}">
						<c:set var="test" value="0" />
						<c:forEach items="${showReserveList}" var="showReserve">
							<c:if test="${status.count eq showReserve.seat_num}">
								<div class="reserved"></div>
								<c:set var="test" value="1" />
							</c:if>
						</c:forEach>
						<c:if test="${test eq 0}">
							<c:if test="${rowCount2 <= 2 || ((rowCount2 > 2 && rowCount2 <= (screenCommand.screen_col - 2)) && ((rowCount1 <= screenCommand.screen_row_array[0]) || (rowCount1 > (screenCommand.screen_row_array[0] + screenCommand.screen_row_array[1])))) }">
								<input type="hidden" class="seat_price" value="9000">
								<div class="economy"></div>
							</c:if>
							<c:if test="${(((rowCount2 > 2 && rowCount2 <= (screenCommand.screen_col - 2)) && ((rowCount1 > screenCommand.screen_row_array[0]) && (rowCount1 <= screenCommand.screen_row_array[1] + screenCommand.screen_row_array[2]))) || ((rowCount2 > (screenCommand.screen_col - 2)) && ((rowCount1 <= screenCommand.screen_row_array[0]) || (rowCount1 > (screenCommand.screen_row_array[0] + screenCommand.screen_row_array[1]))))) }">
								<input type="hidden" class="seat_price" value="10000">
								<div class="normal"></div>
							</c:if>
							<c:if test="${(rowCount2 > (screenCommand.screen_col - 2)) && ((rowCount1 > screenCommand.screen_row_array[0]) && (rowCount1 <= (screenCommand.screen_row_array[0] + screenCommand.screen_row_array[1]))) }">
								<input type="hidden" class="seat_price" value="11000">
								<div class="prime"></div>
							</c:if>
						</c:if>
					</td>
					<c:if test="${rowCount1 eq screenCommand.screen_row_array[0] || rowCount1 eq screenCommand.screen_row_array[0] + screenCommand.screen_row_array[1] }">
					<td width="20" border="0">　</td>
					</c:if>
					<c:if test="${rowCount1 eq '0'}">
						</tr> <tr>
					</c:if>
					</c:forEach>
				</tr>
			</table>
			<div style="width:60%;">
				<hr />
				<span style="color:yellow;">■</span> : 이코노미석 (-1,000원)<br />
				<span style="color:#87ceeb;">■</span> : 일반석<br />
				<span style="color:#ff8080;">■</span> : 프라임석 (+1,000원)<br />
			</div>
			<table border="0">
				<tr>
					<td>
						<c:if test="${!empty authInfo && authInfo.m_admin eq '1' && authInfo.mode ne '0'}">	<!-- 관리자 및 관리자모드 -->
						<!--  -->
						</c:if>
						<c:if test="${authInfo.m_admin eq '0' || authInfo.mode eq '0' || empty authInfo}">	<!-- 비로그인 + 관리자빼고 다... -->
						<input type="hidden" name="order_mode" id="order_mode">
						<input type="button" id="submit_btn" value="예매신청" /> 
 						</c:if>
					</td>
				</tr>
			</table>

		</form:form>
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
</body>
</html>