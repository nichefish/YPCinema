<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
</head>
<body>
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
</body>
</html>