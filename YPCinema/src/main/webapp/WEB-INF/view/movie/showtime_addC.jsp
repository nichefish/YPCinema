<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script>
$(function() {
	$("#movie").change(function() {
		$.ajax({
			type : "post",
			url : "registerD",
			data : "theater=" + $("#theater").val() + "&screen=" + $("#screen").val() + "&movie=" + $("#movie").val(),
			datatype : "html",
			success : function(data3) {
				$("#selectDate").html(data3);
			},
			error : function(data3) {
				$("#selectDate").html(data3);
			}
		});
		$.ajax({
			type : "post",
			url : "registerE",
			data : "theater=" + $("#theater").val() + "&screen=" + $("#screen").val() + "&movie=" + $("#movie").val(),
			datatype : "html",
			success : function(data3) {
				$("#selectTime").html(data3);
			},
			error : function(data3) {
				$("#selectTime").html(data3);
			}
		});
	});
});
</script>
</head>
<body>
	영화: <br/>
	<select name="movie_num" size="8" id="movie">
		<c:if test="${!empty lists }">
		<c:forEach items="${lists}" var="movie">
		<option value="${movie.movie_num}" label="${movie.movie_title} (${movie.movie_rating + movie.movie_rating_plus})" />
		</c:forEach>
		</c:if>
		<c:if test="${empty lists }">
		<option value="${movie.movie_num}" label="[해당 영화 없음]" />
		</c:if>
	</select>
</body>
</html>