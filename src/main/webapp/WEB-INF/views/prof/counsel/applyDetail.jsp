<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.tui-datepicker {
	z-index: 999;
}
</style>

<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">
<div class="row">

	<div class="col-xl-6">
		<div class="card mb-0" style="height:476px;">
			<div class="card-header">신청 상세보기</div>
			<div class="card-body">

				<div class="form-group">
					<label for="inputText3" class="col-form-label">신청자</label> <input
						id="inputText3" type="text" class="form-control"
						value="${detail.stuName }" readonly> <label
						for="inputText3" class="col-form-label">신청날짜</label>
					<div class="form-control" style="background-color: #e9ecef;">
						<fmt:formatDate value="${detail.applyDate }"
							pattern="yyyy-MM-dd HH:ss" />
					</div>
					<label for="inputText3" class="col-form-label">상담요청사유</label>
					<div class="form-control" style="background-color: #e9ecef;">${detail.appContent }</div>
					
					<label for="inputText3" class="col-form-label">반려사유</label>
					<input type="text" id="rejReason" style="width: 100%;"
							 value="${detail.rejReason }" />
					

					<label for="inputText3" class="col-form-label">장소</label>
					<div id="inputText3" class="form-control"
						style="background-color: #e9ecef;">

						<input type="text" id="classroomInput" style="width: 100%;"
							list="classroomList" value="${detail.csLocation }" />

						<datalist id="classroomList">
						</datalist>
					</div>
				</div>

			</div>
			<div
				class="card-footer  p-0 text-center d-flex justify-content-center">
				<button class="btn btn-outline-primary btn-sm" type="button"
					onclick="changeStatus('ok')" style="width: 100%">승인</button>
				<button class="btn btn-outline-danger btn-sm" type="button"
					onclick="changeStatus('nok')" style="width: 100%">반려</button>
			</div>
		</div>
	</div>

	<div class="col-xl-6">





		<div class="card mb-0">
			<div class="card-header">상담일지</div>
			<div class="card-body">

				<div class="form-group">
				<textarea class="textarea" name="content" id="content" rows="20"
					placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
			</div>

			</div>
			<div class="card-footer  p-0 text-center d-flex justify-content-center">
				<button class="btn btn-outline-primary btn-sm" type="button" onclick="saveCounselContent()" style="width: 100%">상담일지저장</button>
			</div>
		</div>


		
	</div>
</div>
</div>
<script>
var counselNo = "<%=request.getParameter("counselNo")%>";

function changeStatus(status){
	var rejReason = $("#rejReason").val();
	var classroom = $("#classroomInput").val();
	
	var status_ko = "승인";
	
	if (status == "nok") status_ko = "반려";
	
	
	
	if (status == "nok" && rejReason == "") {
		
		Swal.fire({
			  icon: 'error',
			  title: '반려시',
			  text: '반려사유는 필수입니다.!',
			})

		
		return;
	}
	
	if (status == "ok" && $('#classroomInput').val() == "") {
		Swal.fire({
			  icon: 'error',
			  title: '승인시',
			  text: '장소는 필수입니다.!',
			})
		return;
	}
	
	if (status == "ok") {
		rejReason="";
	}
	console.log("교실" + classroom);
	var paramss = {
			status:status,
			rejReason:rejReason,
			counselNo:counselNo,
			csLocation:classroom
		};
	
	$.ajax({
		method:'post',
		url:"<%=request.getContextPath()%>/prof/counsel/apply/changeClassroom",
				data : JSON.stringify(paramss),
				contentType : 'application/json; charset=utf-8',
				success : function(data) {
					
					Swal.fire(
							'성공적으로 ' + status_ko+'했습니다.',
							  '',
							  'success'
							).then(()=>{
								opener.parent.location.reload();
								window.close();
							});
				},
				error : function() {
					alert("에러");

				}
			});
}






			
</script>
<script>
window.onload=function(){
	summernote_go($('#content'),'<%=request.getContextPath()%>');
	
	$('#content').summernote('code', "${detail.counselContent}");
	
	
	}
	
	
	
</script>
<script>
$(function(){
	$.ajax({
		method:"get",
		url:"<%=request.getContextPath()%>/prof/counsel/getClassroomList",
		dataType:"json",
		success:function(data){

			var optionStr = "";
			for (var i = 0; i < data.length; i++) {
				optionStr += `<option value="`+data[i]+`"></option>`
			}
			
			$('#classroomList').html(optionStr);
			
		},
		error:function(){
			
		}
	})
});

</script>

<script>
function saveCounselContent(){
	
	var counselContent =  $('#content').val();
	
	var param = {
			counselNo:counselNo,
			counselContent:counselContent
	};
	
	$.ajax({
		method:"post",
		url:"<%=request.getContextPath()%>/prof/counsel/apply/updateCounselContent",
		data : JSON.stringify(param),
		contentType : 'application/json; charset=utf-8',
		success:(data)=>{
			alert("성공");
		},
		error:()=>{
			alert("에러");
			
		},
		
	});
}

</script>

