<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- userId & photo -->
	<ul class="navbar-nav ml-auto">
		<li class="nav-item dropdown no-arrow">
	       	<c:if test="${empty authInfo}">
			<a href="<c:url value='/login' />" class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size:10px;float:right;">로그인</a></a>
			</c:if>
			<c:if test="${!empty authInfo}">
			<a href="<c:url value='/logout' />" class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size:10px;float:right;">로그아웃</a>
			<a href="<c:url value='/myPage' />" class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size:10px;float:right;">마이페이지</a>
			</c:if>
			
			<a href="#" class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size:10px;float:right;">고객센터</a>
			<c:if test="${!empty authInfo}">
			<a href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-right:20px; float:right;">
				<img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60" style="width:35px;length:35px;padding-top: 10px;">&nbsp;&nbsp;&nbsp;
				<span class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size:10px;">
					<c:if test="${authInfo.m_admin eq '0'}"><span style="color:white">"${authInfo.m_name}"</span>님</c:if>
					<c:if test="${authInfo.m_admin eq '1'}"><span style="color:blue">관리자 "${authInfo.m_name}"님</span></c:if>
					<c:if test="${authInfo.m_admin eq '2'}"><span style="color:blue">직원 "${authInfo.m_name}"님</span></c:if>
					환영합니다.<br />
				</span>
			</a>
			</c:if>
		</li>
	</ul>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="navbar navbar-expand-lg">
					<!-- Logo -->
					<a class="navbar-brand" href="index.html"><img src="img/core-img/logo.png" alt="Logo"></a>
					<!-- Navbar Toggler -->
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#worldNav" aria-controls="worldNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
					<!-- Navbar -->
					<div class="collapse navbar-collapse" id="worldNav">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item active">
								<a class="nav-link" href="<c:url value='/main' />">Home <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">영화</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="<c:url value='/movie/register' />">영화 등록</a>
									<a class="dropdown-item" href="<c:url value='/member/list' />">멤버리스트</a>
									<a class="dropdown-item" href="popcorn">영화후기</a>
									<a class="dropdown-item" href="jobList">직원관리</a>
									<a class="dropdown-item" href="regular-page.html">주차</a>
									<a class="dropdown-item" href="regular-page.html">협력업체</a>
									<a class="dropdown-item" href="world/contact.jsp">오시는 길 </a>
								</div>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="popcorn">매점</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="jobList">직원관리</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">주차</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">협력업체</a>
							</li>
						</ul>
                            <!-- Search Form  -->
                            <div id="search-wrapper">
                                <form action="#">
                                    <input type="text" id="search" placeholder="Search something...">
                                    <div id="close-icon"></div>
                                    <input class="d-none" type="submit" value="">
                                </form>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>


</body>

</html>