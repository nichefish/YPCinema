<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	$("#screen").change(function() {
		$.ajax({
			type : "post",
			url : "registerC",
			data : "theater=" + $("#theater").val() + "&screen=" + $("#screen").val(),
			datatype : "html",
			success : function(data2) {
				$("#selectMovie").html(data2);
			},
			error : function(data2) {
				$("#selectMovie").html(data2);
			}
		})
	});
});
</script>
</head>
<body>
	상영관: <br/>
	<select name="screen_num" size="8" id="screen">
		<c:forEach items="${lists}" var="screen">
		<option value="${screen.screen_num}" label="${screen.screen_name} (${screen.screen_rating})" />
		</c:forEach>
	</select>
</body>
</html>