<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>YPcinema - Blog &amp; Magazine Template</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
</head>
<body>
   <div id="preloader">
        <div class="preload-content">
            <div id="world-load"></div>
        </div>
    </div>
    
	<header class="header-area">
		<%@ include file="../navigation.jsp" %>
    </header>
   

    <!-- ********** Hero Area Start ********** -->
    <div class="hero-area height-400 bg-img background-overlay" style="background-image: url(img/blog-img/bg4.jpg);"></div>
    <!-- ********** Hero Area End ********** -->

    <section class="contact-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Contact Form Area -->
                <div class="col-12 col-md-10 col-lg-8">
                    <div class="contact-form">
                        <h3><strong>*채용공고*</strong></h3>
                        <!-- Contact Form -->
                        
                            <div class="row">
                                <div class="col-12 col-md-6">
                                 	채용공고에 관한 이야기가 우루루쾅쾅
                                 	※주의사항도 한번 쓰갈겨주고
                                </div>
                            </div>
                    </div>
                </div>
                     </div>
   </div>
</section>
        <!-- 영화관 이름 검색-->
  
        <!-- 채용게시판 -->
        <div class="lalala" style="margin-left:150px;">
        	<form>
        		<input type="text" id="theaterName">
        		<input type="submit" value="검색">
        	</form>
		<table class="table table-bordered" id="dataTable" cellspacing="0"  style="margin-top:10px;width:1250px;" >
        	<thead>
        		<tr>
<%--         			<c:if test="${authInfo.m_admin eq '1'}"> --%>
        				<th style="width:5px;height:5px">
        					<input type = "checkBox" class = "select_all" name = "select_all">
        				</th>
<%--         			</c:if> --%>
                	<th>채용번호</th>
                	<th>영화관</th>
                	<th>제목</th>
                 	<th>인원</th>
                    <th>접수기간</th>
                    <th>진행현황</th>
                </tr>
            </thead>
            <tbody>

            <c:forEach items="${cheyongLists}" var="c" step="1">
            	<tr>
        			<td style="width:5px;height:5px">
        				<input type = "checkBox" class = "select_all" name = "select_all">
        			</td>
                	<td>${c.che_num}</td>
                	<td>${c.che_jijom}</td>
                	<td><a href="staff_postDetail?che_num=${c.che_num}">${c.che_subject}</a></td>
                 	<td>${c.che_person}명</td>
                    <td>${c.che_sijac_string} ~ ${c.che_magam_string}</td>
                    <td>진행현황</td>
                </tr>
                </c:forEach>
             </tbody>
         </table>                              
	</div>
	
	<div class="buttonDiv" style="margin-left: 10%; margin-bottom: 10px;">
		<input type="button" value="등록" onclick="location.href='staff_add'">
		<input type="button" value="삭제">
   	</div>

    <!-- Google Maps: If you want to google map, just uncomment below codes -->
    <!--
    <div class="map-area">
        <div id="googleMap" class="googleMap"></div>
    </div>
    -->

    <!-- ***** Footer Area Start ***** -->
    <footer class="footer-area">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-4">
                    <div class="footer-single-widget">
                        <a href="#"><img src="img/core-img/logo.png" alt=""></a>
                        <div class="copywrite-text mt-30">
                            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="footer-single-widget">
                        <ul class="footer-menu d-flex justify-content-between">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Fashion</a></li>
                            <li><a href="#">Lifestyle</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Gadgets</a></li>
                            <li><a href="#">Video</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="footer-single-widget">
                        <h5>Subscribe</h5>
                        <form action="#" method="post">
                            <input type="email" name="email" id="email" placeholder="Enter your mail">
                            <button type="button"><i class="fa fa-arrow-right"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ***** Footer Area End ***** -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    <!-- Google Maps: If you want to google map, just uncomment below codes -->
    <!--
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwuyLRa1uKNtbgx6xAJVmWy-zADgegA2s"></script>
    <script src="js/map-active.js"></script>
    -->

</body>
</html>