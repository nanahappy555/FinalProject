<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">

	<!-- 111111 -->
	<div class="row">

		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card" style="padding-bottom: 0px;">
				<h2 class="card-header">학습법 공유 작성</h2>

				<div class="card-body">

					<div class="row">
						<div class="col-xl-12">
							<form id="registForm" >
								<input type="hidden" id="lecCd" name="lecCd" value="${lecCd}"/>
								
								<table class="table table-bordered" width="1500">
			
									<tbody>
										<tr>
											<th style="width:10%">제목</th>
											<td colspan="3" class="table-title">
												<input type="text" id="title" value=""
												name='title' class="form-control" placeholder="제목을 쓰세요">
											</td>
											
										</tr>
			
										<tr>
											<th style="width:10%">과목명</th>
											<td style="width:30%" class="table-title">${subjName}</td>
											<th style="width:10%">작성자</th>
											<td style="width:30%" class="table-title">${loginUser.name} &nbsp;&nbsp;<span class="text-secondary">※작성자명은 노출되지 않습니다.</span></td>
										</tr>
										<tr>
											<th style="width:10%">첨부파일</th>
											<td colspan="3" class="table-title">
												<input type="file" id="fileUpload" multiple>
											</td>
										</tr>
									</tbody>
								</table>
							<div>
								<div class="form-group">
									<textarea class="textarea" name="content" id="content"
										rows="20" placeholder="1000자 내외로 작성하세요."
										style="display: none;"></textarea>
								</div>
							</div>
							
							</form>

						</div>



					</div>
					<!-- ================================================= -->
					<!-- 버튼 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-center">

						<button class="btn btn-primary" type="button" onclick="regist_go();">등록</button>
						&nbsp;&nbsp;
						<button class="btn btn-danger" type="button"
							onclick="f_alert();">취소</button>
						&nbsp;&nbsp;
					</div>
				</div>
				<!-- ================================================= -->
				<!-- 버튼 끝 -->
				<!-- ================================================= -->
			</div>
		</div>
	</div>
</div>

<!-- 11111끝 -->



<script>
window.onload=function(){
	summernote_go($('#content'),'<%=request.getContextPath()%>'); 
}
</script>

<script>
function f_alert(){
	CloseWindow();     
}

function regist_go(){
// 	console.log("왜");
	if($("input[name='title']").val()==""){ //form.title.value
		
	
		Swal.fire({
			  icon: 'error',
			  title: '제목은 필수입니다.'
			})
	
		$("input[name='title']").focus();
		return;
	}

	var formData = new FormData(); 
	var v_lecCd = $('#lecCd').val();
	var v_title = $('#title').val();
	var v_content = $('#content').val();
	var uploadFile = $('#fileUpload');
	
	formData.append("lecCd",v_lecCd);
	formData.append("title",v_title);
	formData.append("content",v_content);
	
	for(var i=0; i<uploadFile[0].files.length; i++){
		formData.append("uploadFile",uploadFile[0].files[i]);
	}
	
// 	console.log("폼데이터",formData);
	$.ajax({
		method:'POST',
		url:'${webPath}/stu/support/share/regist',
		contentType: false,
		processData: false,
		data: formData,
// 		dataType:"json",
		success: function(result) {
			
			Swal.fire(
					  '등록이 완료됐습니다!',
					  '학습법 공유 게시판에서  확인 가능합니다.',
					  'success'
					).then(()=>{
						CloseWindow();
					});
		},
		error: function() {
// 			alert("등록 실패");
		}
	});
	
// var form = $('#registForm');
// 	form.attr("action","${webPath}/stu/support/share/regist");
// 	form.attr("method","POST");
// 	form.submit();
}

</script>


<script>
</script>
<c:if test="${from eq 'regist'}">
	<script>
		
	  	alert("학습법 등록이 완료됐습니다. 학습법 공유 게시판에서  확인 가능합니다.");
	  	
	  	
	  	
	  	window.close();
// 		location.replace(locatio.href);
	
	</script>
</c:if>