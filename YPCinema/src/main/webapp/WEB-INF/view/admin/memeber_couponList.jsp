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
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="icon" href="img/fvc.jpg">
</head>
<body>
<header class="header-area">
	<%@ include file="../navigation.jsp"%>
</header>
<div class="main-content-wrapper section-padding-100">
 	<div class="container" align="center">
 	 <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800"><b>쿠폰목록페이지</b></h1>
          <div style="float:right;">
          <input type = "button" id="totalButton" name="totalButton" value="Total" onclick="location.href='memeber_couponList'">
          <input type = "button" id="movieButton" name="movieButton" value="영화">
          <input type = "button" id="snackButton" name="snackButton" value="매점">
          </div>
      <div id="buttonResult">
 		<table class="table table-bordered" id="dataTable" cellspacing="0">
                    <tr>
        			  <th>발급번호</th>
                      <th>이름</th>
                      <th>종류</th>
                      <th>내용</th>
                      <th>할인률</th>
                      <th>제공일</th>
                      <th>만료일</th>
                    </tr>
                  <tbody>
                  <c:if test="${!empty selectLists}">
                  <c:forEach items="${selectLists}" var="sl" step="1">
                 
                  <tr>
                  	  <td>${sl.balcuNum}</td>
                      <td>${sl.c_name}</td>
                      <td>${sl.c_spe}</td>
                      <td>${sl.c_content}</td>
                      <c:if test="${sl.c_symbol eq '-' }">
                      	<td>${sl.c_symbol}${sl.c_score} 할인</td>
                      </c:if>
                      <c:if test="${sl.c_symbol eq '%' }">
                      	<td>${sl.c_score}${sl.c_symbol} 할인</td>
                      </c:if>
                      <c:if test="${sl.c_symbol eq '*' }">
                      	<td>무료권</td>
                      </c:if>
                      <td><fmt:formatDate value='${sl.cDate}' type='date' pattern='yyyy-MM-dd' /></td>
                      <td><fmt:formatDate value='${sl.cEDate}' type='date' pattern='yyyy-MM-dd' /></td>
                  </tr>
                  </c:forEach>
                  </c:if>
                   <c:if test="${empty selectLists}">
                   	<tr>
                   		<td colspan="7" style="text-align:center;'">
                   			등록된 쿠폰이 없습니다.
                   		</td>
                   </c:if>
                  </tbody>
                </table>
          </div>
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
<script>

$(function(){
	$("#movieButton").click(function(){
		$.ajax({
			type:"POST",
			url:"memeber_couponList2",
			data:{"type": $("#movieButton").val()},
			datatype:"html",
			success: function(data1){
				$("#buttonResult").html(data1);
			}
			
		});
	});
});
$(function(){
	$("#snackButton").click(function(){
		$.ajax({
			type:"POST",
			url:"memeber_couponList2",
			data:{"type": $("#snackButton").val()},
			datatype:"html",
			success: function(data1){
				$("#buttonResult").html(data1);
			}
			
		});
	});
});
</script>
</body>
</html>