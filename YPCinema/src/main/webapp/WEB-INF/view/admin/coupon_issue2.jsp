<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
</head>
<body>
<input type="hidden" id="userName2" value="${userNum}">
<table class="table table-bordered" id="dataTable" cellspacing="0">
                    <tr>
                      <th style="width:5px;height:5px">
					  	<input type = "checkBox" class = "select_all" name = "couponSelect">
        			  </th>
        			  <th>쿠폰번호</th>
					  <th>쿠폰종류</th>
        			  <th>쿠폰이름</th>
                      <th>내용</th>
                      <th>할인상태</th>
                      <th>할인률</th>
                    </tr>
                  <tbody>

                  	<c:forEach items="${selectCouponsM}" var="scm" step="1">
                  		<tr>
                  			<td>
                  				<input type = "checkBox" class = "select" name = "cNum" id="cNum" value="${scm.c_num}">
                  			</td>
                  			<td>${scm.c_num}</td>
                  	  		<td>${scm.c_spe}</td>
					  		<td>${scm.c_name}</td>
                      		<td>${scm.c_content}</td>
                      		<td>${scm.c_symbol}</td>
                     		<td>${scm.c_score}</td>
                  		</tr>
                  	</c:forEach>
                  </tbody>                         
                </table>
                
              	
<script>
$(function() {
	$( document ).ready( function() {
        $( '.select_all' ).click( function() {
          $( '.select' ).prop( 'checked', this.checked );
        });
        
    });
});
</script>
</body>
</html>