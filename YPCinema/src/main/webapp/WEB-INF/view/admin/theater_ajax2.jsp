<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinemae</title>
</head>
<body>
 <div class="card shadow mb-4"style="width:30%;float: left; margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">직무별</h6>
            </div>
            <div class="card-body" style="height:auto;">
              <div class="table-responsive">
              
                <table class="table table-bordered" id="dataTable"cellspacing="0" >
                    <tr>
                      <th colspan="2">Job Type</th>
                    </tr>
                  <tfoot>
                    <tr>
                      <th colspan="2">Job Type</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  	<c:forEach items="${jicmuList}" var="j" step="1">
                  		<tr>
                  			<td>
                  				<input type="hidden" name="jic_num" id="jic_num" value="${j.jic_num}">
                  				<input type="button" name="jic_name" id="jic_name" value="${j.jic_name}">
                  			</td>
                  			<td>
                  				<input type="button" name="jic_del" id="jic_del" value="삭제">
                  			</td>
                  		</tr>
                 	</c:forEach>
                  </tbody>
                 
                </table>
               
            	 <input type ="button" id= "job_add" value= "직무추가">
            	<div id="loadingDiv">
            		<form action ="jicmu_add" method="post" >
            			Job Name:<input type="text" name="job_plus" id="job_plus">
            			<input type ="submit" value="추가" >
            		</form>
					<input type ="button" id="btnss" value="취소">
            	</div>
              </div>
            </div>
          </div>
<script type="text/javascript">
 	$(function(){
 		$("#theater_add").click(function(){
 			location.href="theater_add";
 		});
 	})
 	//window onload 
	$(document).ready(function(){
		// 배경 조절 버튼 클릭시 클릭 이벤트 
		$("#job_add").click(function(){
			var width = $("#page-top").width(); 
			var height = $("#page-top").height(); 
			//화면을 가리는 레이어의 사이즈 조정 
			$(".backLayerssss").width(width); 
			$(".backLayerssss").height(height); 
			//화면을 가리는 레이어를 보여준다 (0.5초동안 30%의 농도의 투명도) 
			$(".backLayerssss").fadeTo(500, 0.3); 
			//팝업 레이어 보이게 
			var loadingDivObj = $("#loadingDiv"); 
			loadingDivObj.css("top", $(document).height()/2-500); 
			loadingDivObj.css("left",$(document).width()/2-500); 
			loadingDivObj.fadeIn(500); }); }); 
	//esc키 누르면 화면 잠김 해제
	$(document).keydown(function(event){
		if(event.which=='27'){ 
			$("#loadingDiv").fadeOut(300); 
			$(".backLayerssss").fadeOut(1000); } }); 
	//button 누르면 화면 잠김 해제
	$(document).ready(function(){
		$("#btnss").click(function(event){
				$("#loadingDiv").fadeOut(300); 
				$(".backLayerssss").fadeOut(1000); }); 
	}); 
	//윈도우가 resize될때마다 backLayer를 조정 
	$(window).resize(function(){
		var width = $(window).width(); 
		var height = $(window).height();
		$(".backLayerssss").width(width).height(height); });
</script>
</body>
</html>