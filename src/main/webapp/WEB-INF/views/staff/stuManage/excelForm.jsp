<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<meta charset="UTF-8">
</head>


<div class="card">
		<div class="card-body">
<div class="main-content-jsp">
    
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->

	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<h3 class="card-header"><i class="fas fa-download"></i>&nbsp;&nbsp;사용자등록</h3>
				
				<div class="card-body">
					<ul>
						<li>양식파일을 다운로드 하시고 파일내에 있는 모든 항목들을 채워서 업로드하셔야 정상적으로 등록됩니다.</li>
			        </ul>
				</div>
			</div>
		</div>
	</div>
	<!-- ================================================= -->
	<!-- 본문1 끝 -->
	<!-- ================================================= -->

	<!-- ================================================= -->
	<!-- 본문 2 -->
	<!-- ================================================= -->
	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	<div class="card">	
		<div class="card-body">
			<table class="table table-hover">       	
				<button  onclick="location.href='/ai/resources/doc/사용자등록양식.xlsx'" download="사용자등록양식.xlsx">양식다운로드</button>     	
			</table>
		</div>
	</div>
		</div>
	</div> 
	<!-- ================================================= -->
	<!-- 본문2 끝 -->
	<!-- ================================================= -->

		<div class="card">	
			<div class="card-body">
				<div class="form-group row">
					<form action="" method="post" enctype="multipart/form-data" style=margin-left:15px;>
	          			<input type="file" name="myExcel" id="myExcel"  value="" accept=".xlsx"><br>
	     			</form>
				</div>
			</div>
		</div>

		
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
		<div class="row justify-content-end mr-1" >
			<input class="btn btn-primary" style="width:120px; margin-right:20px;" value="업로드" onclick="excelUpload()" >
			<button class="btn btn-danger" type="button" style="width:120px; margin-padding:5px;"
								onclick="window.close();">닫기</button>
		</div>
	</div>
</div>


	<!-- <body>
	    <h1>사용자등록</h1><br>
	    <p> 양식파일을 다운로드 하시고 파일내에 있는 모든 항목들을 채워서 업로드하셔야 정상적으로 등록됩니다.</p>
	    <a class="button" href="/ai/resources/doc/사용자등록.xlsx" download="사용자등록양식.xlsx">양식다운로드</a><br><br>
	     <button  onclick="location.href='/ai/resources/doc/사용자등록양식.xlsx'" download="사용자등록양식.xlsx">양식다운로드</button> <br><br> 
	     <form action="" method="post" enctype="multipart/form-data"  >
	          <input type="file" name="myExcel" id="myExcel"  value="" accept=".xlsx"><br>
	     </form><br>
	     <input type="button"  value="업로드" onclick="excelUpload()"> -->
 

<script>
	function excelUpload(){
		var vfile = document.querySelector("#myExcel").files[0];
		console.log(vfile);
		var vformData = new FormData();
		vformData.append("excelFile",vfile);  // 요게 있어야 함
		
		$.ajax({
			url : "${webPath}/staff/stuManage/upload",
			type : 'post',
		 	data : vformData,
			cache : false,
		 	contentType: false,  // 필수
		 	processData: false,	// 필수
			success : function(data) {
				console.log(data);
				
				Swal.fire(
						  '업로드성공!',
						  'success'
						);
				
	        },
	        error:function(){
	        	alert("실패");
	        }
		});
		
	}
</script>
</body>
</html>