<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YPCinema</title>
</head>
<body>
 <div class="card shadow mb-4"style="width:30%;float: left; margin-right: 20px;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">직무별</h6>
            </div>
            <div class="card-body" height:367.6px;>
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
                  				<input type="button" name="jic_name" id="jic_name" value="${j.jic_name}">
                  			</td>
                  			<td>
                  				<input type="button" name="" id="" value="수정"><br />
                  				<input type="button" name="" id="" value="삭제">
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
		

</body>
</html>