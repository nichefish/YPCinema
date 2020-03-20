<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
	
<link href="https://https://fonts.google.com/specimen/Do+Hyeon" rel="stylesheet">
  <link rel="icon" type="image/png" href="images/favicon.png" />
<link rel="stylesheet" type="text/css" href="css/goods.css" />

</head>
<body>
<div id="wrap">

	<!-- 헤더시작 -->
	<div id="top_fixed">
      <div class="top_cate">
         <div id="logo">
         <img src="#" alt="관리자" />
         </div>
      </div>
    </div>
    <!-- 헤더끝 -->
         
    <div id="container">
    <!-- 메인 컨텐츠 -->
   		<div class="contents">
            <div class="contentsTop">
         		<h2>메뉴등록</h2>
      		</div>
     		 <br>
          
            <div class="relCon">
         
	<div class="table11" id="goodsUp" align="center">
		<form action="goodsPro" method="post" enctype="multipart/form-data">

		<table>
			<tr>
				<th style="width: 100px;">종류</th>
				<td>
					콤보<input type="radio" name="type" value="1"> 
					팝콘<input type="radio" name="type" value="2"> 
					음료<input type="radio" name="type" value="3"> 
					스낵<input type="radio" name="type" value="4">
					떡볶이<input type="radio" name="type" value="5">
					치킨<input type="radio" name="type" value="6">
				</td>
			</tr>
			<tr>
				<th style="width: 100px;">메뉴번호</th>
				<td>
					<input name="menuNum" type="text" size="10" maxlength="30"
					value="" />
				</td>
			</tr>
			<tr>
				<th style="width: 100px;">메뉴명</th>
				<td>
					<input name="menuName" type="text" size="20"
					maxlength="30" value="" /></td>
			</tr>
			<tr>
				<th style="width: 100px;">상품설명</th>
				<td>
					<textarea name="menuContent" cols="50" rows="3" maxlength="2000" value="" style="font-family:'Nanum Gothic', sans-serif;" ></textarea>
				</td>
			</tr>
			<tr>
				<th style="width: 100px;">메뉴이미지</th>
				<td>
					<input type="file" name="menuImage" id="menuImage">
				</td>
			</tr>
		</table>
</form>
		</div>
		<div class="btnJoin2">
			<input type="submit" value="상품등록"/>&nbsp;&nbsp;
		</div>
	</div>
</div>
</div>
		
		<!-- footer 시작 -->
       
         <!-- footer종료 -->
</div>
</body>
</html>