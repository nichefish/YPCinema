<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품</title>
</head>
<body>
번호 &nbsp;&nbsp;&nbsp;&nbsp;
상품명&nbsp;&nbsp;&nbsp;&nbsp;
이미지&nbsp;&nbsp;&nbsp;&nbsp;
가격<br />
<c:forEach items="${wishList }" var="menu">
${menu.menuNum } &nbsp;&nbsp;&nbsp;&nbsp; 
<a href="menuDetail?num=${menu.menuNum }" >${menu.menuName }</a>&nbsp;&nbsp;&nbsp;&nbsp;
<c:forTokens items="${menu.menuImage } " var="menuImage" delims="-" varStatus="ii">
	<c:if test="${ii.index == 0 }">
		<img src="../popcorn/update/${menuImage }" width="30" height="30" />
	</c:if>
</c:forTokens>
&nbsp;&nbsp;&nbsp;&nbsp;${menu.menuPrice }
</c:forEach>

</body>
</html>