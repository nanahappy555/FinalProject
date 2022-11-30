<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


  <!-- Content Wrapper. Contains page content -->
<div class="card">
	<h3 class="card-header"><i class="fas fa-id-card"></i>&nbsp;&nbsp;${student.name }님의 정보 수정</h3>
		<div class="card-body">

  <!-- Main content -->
		<div class="card">	
			<div class="card-body">	
			<form role="form" method="post" action="<%=request.getContextPath()%>/stu/aca/modify_success" name="modifySuccess">
				<div class="row">						 
					<input type="file" id="inputFile" onchange="changePicture_go();" name="picture" style="display:none" />
					<div class="input-group col-md-12 mb-3">
						<div class="col-md-12" style="text-align: center;">
							<div class="manPicture mb-3" data-id="${student.stuCd }" id="pictureView" style="border: 1px solid #5969FF; height: 200px; width: 140px; margin: 0 auto; margin-bottom:5px;"></div>														
							<div class="input-group input-group-sm">
								<label for="inputFile" class="col-3 col-lg-1 col-form-label btn-sm btn btn-secondary">사진변경</label>
								<input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled
									value=""/>
								<input id="picture" class="form-control" type="hidden" name="uploadPicture" />
							</div>						
						</div>												
					</div>
				</div>	
				
<%-- 				<div class="form-group row">
					<label for="clubCd" class="col-sm-3 control-label text-center" >비밀번호 변경</label>

					<div class="col-sm-9">
						<input name="memPwd" type="text" class="form-control" id="memPwd" value="${member.memPwd }">
					</div>
				</div> --%>
				
				<div class="form-group row">
					<label for="addres" class="col-sm-3 control-label text-center" >주소</label>

					<div class="col-sm-9">
						<input name="add1" type="text" class="form-control" id="add1"
							 value="${student.add1 }">
						 <input name="add2" type="text" class="form-control" id="add2"
						 value="${student.add2 }">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="email" class="col-sm-3 control-label text-center">이메일</label>

					<div class="col-sm-9">
						<input name="email" type="email" class="form-control" id="email" value="${student.email }">
					</div>
				</div>
				<div class="form-group row">
                  <label for="phone" class="col-sm-3 control-label text-center">연락처</label>
                  <div class="col-sm-9">   
                  	<input name="phone" type="text" class="form-control" id="phone" value="${student.phone }">	                
                  </div>                  
                </div>  
				<div class="form-group row">
					<label for="bankName2" class="col-sm-3 control-label text-center" >거래은행</label>

					<div class="col-sm-9">
						<input name="bankName" type="text" class="form-control" id="bankName2" value="${student.bankName }">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="accNum2" class="col-sm-3 control-label text-center" >계좌번호</label>

					<div class="col-sm-9">
						<input name="accNum" type="text" class="form-control" id="accNum2" value="${student.accNum }">
					</div>
				</div>				
				
			</form>
				<div class="card-footer row" style="margin-top: 0; border-top: none;">						
					<button type="button" id="modifyBtn"  onclick="modify_go();"
						class="btn btn-outline-primary pull-right col-sm-4 text-center" >수정완료</button>
					<div class="col-sm-4"></div>
					<button type="button" id="cancelBtn" onclick="CloseWindow();"
						class="btn btn-outline-danger pull-right col-sm-4 text-center">취 소</button>
				</div>	
			</div>
		</div>
	</div>
    <!-- /.content -->
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




