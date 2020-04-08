<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChulgnButton</title>
</head>
<body>
<input type="hidden" id="chulgnTimeHidden" name="chulgnTimeHidden" value="${chulgnTime}">
<input type="button" class="wowButton" id="tuegn" name="tuegn" value="퇴근" style="text-align:center;color:white;font-size:10px;">
<script>
$(function(){
	$("#tuegn").click(function(){
		var Now = new Date();
		var NowTime = Now.getFullYear();
		NowTime += '-' + (Now.getMonth() + 1);
		NowTime += '-' + Now.getDate();
		NowTime += ' ' + Now.getHours();
		NowTime += ':' + Now.getMinutes();
		var tuegnTime = $("#tuegn").val(NowTime);
		alert("tuegnTime의 값 ===="+tuegnTime);
		var chulgnTime = $("#chulgnTimeHidden").val();
	
	});
});

</script>
</body>
</html>