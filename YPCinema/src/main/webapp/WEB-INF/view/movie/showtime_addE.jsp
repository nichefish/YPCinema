<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	$("#show_start").change(function() {
		var standard = $("#previous_endtime").text();
// 		alert("standard: " + standard);
		var start = $("#show_start").val().replace(":", "");
		if (Number(start) < 800) {
			alert("영화관 오픈시간(8시) 이전으로 상영일정을 배정할 수 없습니다!");
			$("#show_start").val(standard);
			return false;
		} else if (Number(start) >= 2400) {
			alert("24시 이후로 상영일정을 배정할 수 없습니다!");
			$("#show_start").val(standard);
			return false;
		} else if (Number(start) < Number(standard.replace(":", ""))) {
			alert("이전 상영일정 종료시간과 겹치게 배정할 수 없습니다!");
			$("#show_start").val(standard);
			return false;
		}
		alert("상영종료시간을 자동으로 산정합니다.");
		var runtime = "${movieCommand.movie_runtime}";
		var hour = parseInt(Number(runtime) / 60);
		var minute = parseInt(Number(runtime) % 60);
		if (Number(start)%100 + minute >= 60) {
			hour = hour + 1;
			minute = minute + (Number(start)%100) - 60;
		}
		var temp = Number(start) + (hour*100) + minute;
		alert(temp);
		var result = lpad( String(temp), 4, 0).replace(/(.{2})/, "$1:");
		alert("result: " + result);
		$("#show_end").val(result);
		$("#show_end_show").val(result);
	});
	$("#frm").submit(function() {
		var standard = $("#previous_endtime").text();
// 		alert("standard: " + standard);
		var start = $("#show_start").val().replace(":", "");
		if (Number(start) < 800) {
			alert("영화관 오픈시간(8시) 이전으로 상영일정을 배정할 수 없습니다!");
			$("#show_start").val(standard);
			return false;
		} else if (Number(start) >= 2400) {
			alert("24시 이후로 상영일정을 배정할 수 없습니다!");
			$("#show_start").val(standard);
			return false;
		} else if (Number(start) < Number(standard.replace(":", ""))) {
			alert("이전 상영일정 종료시간과 겹치게 배정할 수 없습니다!");
			$("#show_start").val(standard);
			return false;
		}
		alert("상영종료시간을 자동으로 산정합니다.");
		var runtime = "${movieCommand.movie_runtime}";
		var hour = parseInt(Number(runtime) / 60);
		var minute = parseInt(Number(runtime) % 60);
		var temp = Number(start) + (hour*100) + minute;
		var result = String(temp).replace(/(.{2})/, "$1:");
// 		alert("result: " + result);
		$("#show_end").val(result);
		$("#show_end_show").val(result);
	});
});
function lpad(str, padLen, padStr) {
    if (padStr.length > padLen) {
        console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
        return str;
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str = padStr + str;
    str = str.length >= padLen ? str.substring(0, padLen) : str;
    return str;
}
</script>
</head>
<body>
<table width="100%" align="center" border="0">
	<tr>
		<td width="240" align="center"><u>상영시작시간</u></td>
		<td colspan="3">
			<input type="text" name="show_start" id="show_start" size="16" placeholder="hh:mm" value="<fmt:formatDate value='${show.show_end}' type='time' pattern='HH:mm' />" pattern="\d{2}:\d{2}"/>
			<form:errors path="show_start" />
			<p style="display:inline;">(해당 상영관 상영시작가능시간: <span id="previous_endtime"><fmt:formatDate value='${show.show_end}' type='time' pattern='HH:mm' /></span>)</p>
		</td>
	</tr>
 	<tr>
 		<td width="240" align="center"><u>상영종료시간</u></td>
		<td colspan="3">
			<input type="hidden" name="show_end" id="show_end">
			<input type="text" name="show_end_show" id="show_end_show" size="16" placeholder="hh:mm" pattern="\d{2}:\d{2}" disabled="disabled" />
		</td>
	</tr>
</table>
</body>
</html>