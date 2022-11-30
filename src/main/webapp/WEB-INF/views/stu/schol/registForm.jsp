<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


  <!-- Content Wrapper. Contains page content -->
<div class="card">
	<h3 class="card-header"><i class="fas fa-edit"></i>&nbsp;&nbsp;신청 페이지</h3>	
		<div class="card-body">

  <!-- Main content -->
		<div class="card">	
			<div class="card-body">		
					<form role="form" id="registForm" method="post" action="<%=request.getContextPath()%>/stu/schol/apply" name="registForm">
					<input type="hidden" name="scholCd" value="${scholCd}">			
					<div class="form-group row">
						<label for="id" class="col-sm-3 control-label text-center">학번</label>	
						<div class="col-sm-9">
							<input readonly name="id" type="text" class="form-control" id="id"value="${stuInfo.stuCd }">
						</div>
					</div>
					<div class="form-group row">
						<label for="MAJOR" class="col-sm-3 control-label text-center">학부(과)</label>	
						<div class="col-sm-9">
							<input readonly name="MAJOR" type="text" class="form-control" id="MAJOR"value="${stuInfo.firMajName}">
						</div>
					</div>					
					
					<div class="form-group row">
						<label for="name" class="col-sm-3 control-label text-center">예금주</label>	
						<div class="col-sm-9">
							<input readonly name="name" type="text" class="form-control" id="name"value="${stuInfo.accHolder }">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="bankName" class="col-sm-3 control-label text-center">거래은행</label>	
						<div class="col-sm-9">
							<input readonly name="bankName" type="text" class="form-control" id="bankName"value="${stuInfo.bankName }">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="bankNum" class="col-sm-3 control-label text-center">계좌번호</label>	
						<div class="col-sm-9">
							<input readonly name="bankNum" type="text" class="form-control" id="bankNum"value="${stuInfo.accNum}">
						</div>
					</div>
	
					<div class="form-group">
						<div class="card card-outline card-success">
							<div class="card-header">
								<h5 class="ml-3" style="display:inline;line-height:40px;"><strong>파일첨부 </strong></h5>
									&nbsp;&nbsp;<button class="btn btn-xs btn-light"
									onclick="addFile_go();"	type="button" id="addFileBtn">+</button>
							</div>
							<div class="card-footer fileInput"></div>
						</div>
					</div>
					<div class="card-footer row" style="margin-top: 0; border-top: none;">					
						<button type="button" id="modifyBtn"  onclick="apply();"
							class="btn btn-outline-primary pull-right col-sm-4 text-center" >신청</button>
							
						<div class="col-sm-4"></div>
						<button type="button" id="cancelBtn" onclick="CloseWindow();"
							class="btn btn-outline-danger pull-right col-sm-4 text-center">취 소</button>
					</div>
					</form>
					<input type="hidden" name="abc">
			</div>		
		</div>
	</div>
</div>

  <script>
    window.onload=function(){
	   MemberPictureThumb('<%=request.getContextPath()%>');
	}
	function CloseWindow(){
		
		window.opener.location.reload(true);		
		window.close();
	
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
  
  
function apply(){
	var form=$('#registForm');
	console.log(form);
	form.submit();
}
  	var dataNum=0;

  	function addFile_go(){
  		//alert("click add btn");
  		

  		if($('input[name="uploadFile"]').length >=5){
  			alert("파일추가는 5개까지만 가능합니다.");
  			return;
  		}
  		
  		var div=$('<div>').addClass("inputRow").attr("data-no",dataNum).css("padding-top","20px");
  		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
  		
  		var button="<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge-danger' type='button'>X</button>";
  		
  		div.append(input).append(button);
  		$('.fileInput').append(div);
  		
  		
  		dataNum++;
  	}

  	function remove_go(dataNum){
  		$('div[data-no="'+dataNum+'"]').remove();
  	}

</script>  




