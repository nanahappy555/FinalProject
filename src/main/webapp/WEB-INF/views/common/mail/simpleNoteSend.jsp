<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<div class="card">
				<h3 class="card-header"><i class="fas fa-envelope"></i>&nbsp;&nbsp;쪽지 보내기</h3>
			<form id="form" method="post" action="${webPath}/common/sendSimpleNote">
   				<div class="card-body">
					
					<div class="to">
						<div class="form-group row pt-0" >
							<label class="col-md-1 control-label" ><strong>&nbsp;&nbsp;받는사람</strong></label>
	
					<div class="col-md-6">
						<input class="form-control" type="text" id="receiverId" name="receiverId" value="${receiverId}">
					</div>
						</div>
					</div>
			<div class="subject">
				<div class="form-group row pt-2">
					<label class="col-md-1 control-label"><strong>&nbsp;&nbsp;제 목</strong></label>
						<div class="col-md-6">
							<input class="form-control" type="text" id="title" name="title">
						</div>
				</div>
			</div>
			
						<br>

		
	</div>

		<div class="email editor">
			<div class="col-md-12 p-0">
				<div class="form-group">
					<label class="control-label sr-only" for="summernote">Descriptions </label>
						<textarea class="textarea" id="content" name="content" rows="20"
							placeholder="1000자 내외로 작성하세요." style="display: none;">${myAssignSub.subContent} </textarea>
						<div id="summernote"></div>
				</div>
			</div>
		</div>
			<div class="form-group col-md-12" align="right">
				<button onclick="subMessage()" type="button" class="btn btn-primary float-right">전송</button>
				<button onclick="CloseWindow();"type="button" class="btn btn-secondary btn-space"><i class="icon s7-close"></i>취소</button>
			
		</div>
			</form>	
			</div>
<%-- <div class="card">
		<div class="card-body" style="width:650px;">
			<form id="form" method="post" action="${webPath}/common/sendSimpleNote">
				<div class="row">
					<label for="receiverId" class="form-control col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3">받는 사람</label>
					<input id="receiverId" name="receiverId" type="text" value="${receiverId}" class="form-control col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
				</div>
				<div class="row">
					<label for="title" class="form-control col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3">제목</label>
					<input id="title" name="title" type="text" class="form-control col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
				</div>
				<textarea style="display: inline"
								class="form-control col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6"
								id="content" name="content" rows="3">${myAssignSub.subContent} </textarea>
				<button onclick="subMessage()" class="btn btn-primary float-right">전송</button>
			</form>
		</div>
	</div> --%>
<c:if test="${from eq 'regist'}">
<script>
$(function(){
	Swal.fire(
			  '쪽지를 성공적으로 보냈습니다.',
			  '',
			  'success'
			).then(()=>{
				
	CloseWindow();
			});
});
	
</script>
</c:if>
<script type="text/javascript">

   function goBack(){
      window.history.back();
   }

</script>
<script>
window.onload=function(){
  summernote($('#content'),'<%=request.getContextPath()%>');	

 }
 


function summernote(target,context){
	
	contextPath = context;
	
	target.summernote({
		placeholder:'여기에 내용을 적으세요.',
		lang:'ko-KR',
		height:200,

		disableResizeEditor: true,
		callbacks:{
			onImageUpload : function(files, editor, welEditable) {
				for(var file of files){
					//alert(file.name);
					
					if(file.name.substring(file.name.lastIndexOf(".")+1).toUpperCase() != "JPG"){
						alert("JPG 이미지형식만 가능합니다.");
						return;
					}
					if(file.size > 1024*1024*5){
						alert("이미지는 5MB 미만입니다.");
						return;
					}	
					
				}
				
				for (var file of files) {
					sendFile(file,this);
				}
			},
			onMediaDelete : function(target) {
				deleteFile(target[0].src);	
			}
		}
	});
}
</script>
<script>
function subMessage(){
	 
	
	Swal.fire({
		  title: '쪽지를 보내시겠습니까?',
		  text: "",
		  icon: 'warning',
		  showDenyButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '확인',
		  denyButtonText:'취소',
		}).then((result) => {
		  if (result.isConfirmed) {
		   
			  var form = $('#form');
				 form.attr("action","${webPath}/common/sendSimpleNote");
				 form.attr("method","POST");
				 form.submit();
		  }
		})
	
	
	
	
	
	
	
	
	
	
	
	
}

</script>