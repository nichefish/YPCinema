<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 검색</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript">
$(function(){
	$('.zonna').click(function(){
   	 var id_check = $(this).attr("id");
   	$(opener.document).find("#che_jijom_show").val($("#"+id_check).val());
   	$(opener.document).find("#che_jijom").val($("#"+id_check).val());
   	window.close();
	});
});

//	$("#"+ i).click(function(){
//		$(opener.document).find("#che_jijom").val($("#"+i).val()); //$(opener.document부모페이지에서 .find 찾는다  val = 값을 갖는다.
//		window.close();
//	});	
//});
</script>
</head>
<body>
<form action="jijomgumsechangs" method="post">
영화관 지점 : <input type="text" id="jijomgumsechang"name="jijomgumsechang">
<input type="submit" value="검색">
</form>
<br />
<c:if test="${!empty jijomgumsec}">
	<c:forEach items="${jijomgumsec}" var="jjc" step="1">
		▶ <input type="button" class="zonna" id="gumsecGG${jjc.theater_num}" name="gumsecGG${jjc.theater_num}" value="${jjc.theater_name}" style="margin-bottom:5px;"><br />
	</c:forEach>
</c:if>
</body>
</html>