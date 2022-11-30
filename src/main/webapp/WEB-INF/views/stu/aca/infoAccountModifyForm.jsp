<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


  <!-- Content Wrapper. Contains page content -->
<div class="card">
	<h3 class="card-header">계좌 정보 수정</h3>	
		<div class="card-body">

  <!-- Main content -->
		<div class="card">	
			<div class="card-body">	
				<form role="form" method="post" action="<%=request.getContextPath()%>/stu/aca/info/account/modify_success">
				<div class="form-group row">
					<label for="name" class="col-sm-3 control-label text-center">이름</label>	
					<div class="col-sm-9">
						<input readonly type="text" class="form-control" id="name"value="${student.name }">
					</div>
				</div>
				<div class="form-group row">
					<label for="bankName1" class="col-sm-3 control-label text-center">현재 계좌은행</label>	
					<div class="col-sm-9">
						<input readonly type="text" class="form-control" id="bankName1"value="${student.bankName }">
					</div>
				</div>
				<div class="form-group row">
					<label for="accNum1" class="col-sm-3 control-label text-center">현재 계좌번호</label>	
					<div class="col-sm-9">
						<input readonly type="text" class="form-control" id="accNum1"value="${student.accNum }">
					</div>
				</div>
				
				
				<div class="form-group row">
					<label for="bankName2" class="col-sm-3 control-label text-center" >변경 계좌은행</label>

					<div class="col-sm-9">
						<input name="bankName" type="text" class="form-control" id="bankName2" value="${student.bankName }">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="accNum2" class="col-sm-3 control-label text-center" >변경 계좌번호</label>

					<div class="col-sm-9">
						<input name="accNum" type="text" class="form-control" id="accNum2" value="${student.accNum }">
					</div>
				</div>
				</form>
				<div class="card-footer row" style="margin-top: 0; border-top: none;">						
					<button type="button" id="modifyBtn"  onclick="modify_go();"
						class="btn btn-outline-primary pull-right col-sm-4 text-center" >수정하기</button>
					<div class="col-sm-4"></div>
					<button type="button" id="cancelBtn" onclick="CloseWindow();"
						class="btn btn-outline-danger pull-right col-sm-4 text-center">취 소</button>
				</div>	
			</div>
		</div>

    <!-- /.content -->
  </div>
</div>  
  <script>
    window.onload=function(){
	   MemberPictureThumb('<%=request.getContextPath()%>');
	}
  </script>
  
  
<script>
  function changePicture_go(){
	//alert("click file btn");
	  
	var picture = $('input#inputFile')[0];
	var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
	  

	//이미지 확장자 jpg 확인
	if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
		alert("이미지는 jpg 형식만 가능합니다.");
		return;
	} 
	//이미지 파일 용량 체크
	if(picture.files[0].size>1024*1024*1){
		alert("사진 용량은 1MB 이하만 가능합니다.");
		return;
	};
  
	document.getElementById('inputFileName').value=picture.files[0].name;
	
	// 이미지 변경 확인
	$('input[name="uploadPicture"]').val(picture.files[0].name);
	
	if (picture.files && picture.files[0]) {
		var reader = new FileReader();
		 
		 reader.onload = function (e) {
	        	//이미지 미리보기	        	
	        	$('div#pictureView')
	        	.css({'background-image':'url('+e.target.result+')',
					  'background-position':'center',
					  'background-size':'cover',
					  'background-repeat':'no-repeat'
	        		});
	        }
	        
	       reader.readAsDataURL(picture.files[0]);
	}
	
	
  }
  
  
function modify_go(){
	
		var form=$('form[role="form"]');	
		form.submit();
}
	
function CloseWindow(){
	
	window.opener.location.reload(true);		
	window.close();

}
</script>  




