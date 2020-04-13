<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	if (dd<10) {
		dd='0'+dd;
	} 
	if(mm<10){
		mm='0'+mm;
	} 
	today = yyyy+'-'+mm+'-'+dd;
	$("#date").attr("min", today);
	$("#date").change(function() {
		var dt = new Date();
		var today = dt.getFullYear() + ("00"+(dt.getMonth() + 1)).slice(-2) + ("00" + dt.getDate()).slice(-2);
		today = Number(today);
		var selectedDate = $("#date").val().replace(/-/g, "");
		selectedDate = Number(selectedDate);
		var dateCheck = selectedDate - today;	// 작으면 안됨...
		if (dateCheck <= 0) {
			alert("당일 혹은 이전 날짜에는 상영일정을 등록할 수 없습니다.");
			$("#date").val("");
			return false;
		}
		$.ajax({
			type : "post",
			url : "registerE",
			data : "theater=" + $("#theater").val() + "&screen=" + $("#screen").val() + "&movie=" + $("#movie").val() + "&date=" + $("#date").val(),
			datatype : "html",
			success : function(data4) {
				$("#selectTime").html(data4);
			},
			error : function(data4) {
				$("#selectTime").html(data4);
			}
		});
	});
});
</script>
</head>
<body>
<table width="100%" align="center" border="0">
	<tr>
		<td width="240" align="center"><u>상영예정일자</u></td>
		<td colspan="2">
			<input type="date" name="show_date" id="date" maxlength="10" placeholder="yyyy-MM-dd" pattern="\d{4}-\d{1,2}-\d{1,2}"/>
			(<u>yyyy-MM-dd</u>)
		</td>
	</tr>
 </table>
</body>
</html>