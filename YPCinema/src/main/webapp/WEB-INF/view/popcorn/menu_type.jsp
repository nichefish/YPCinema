<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:forEach items="${menuType }" var="menu" varStatus="status">
		<div class="col-12 col-md-6">
			<!-- Single Blog Post -->
			<div class="single-blog-post post-style-2 d-flex align-items-center" style="height: 200px">
				<!-- Post Thumbnail -->
				<div class="post-thumbnail">
					<img src="popcorn/update/${menu.menuImage}" />
				</div>
				<!-- Post Content -->
				<div class="post-content">
					<a href="menuDetail?num=${menu.menuNum }" class="headline">
						<h5>${menu.menuName  }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;${menu.menuPrice}원</h5>
					</a>

					<!-- Post Meta -->
					<div class="post-meta">
						<p>
							<a href="menuDetail?num=${menu.menuNum }" class="post-date"><h5>${menu.menuContent }</h5></a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>