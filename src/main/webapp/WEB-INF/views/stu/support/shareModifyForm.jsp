<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">

	<!-- 111111 -->
	<div class="row">

		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card" style="padding-bottom: 0px;">
				<h2 class="card-header">학습법 공유 수정</h2>

				<div class="card-body">

					<div class="row">
						<div class="col-xl-12">
							<form action="modify">
								<input type="hidden" id="shaBno" name="shaBno" value="${share.shaBno }" />
								<table class="table table-bordered" width="1500">
			
									<tbody>
										<tr>
											<th style="width:10%">제목</th>
											<td colspan="3" class="table-title">
												<input type="text" id="title" value="${share.title }"
												name='title' class="form-control" placeholder="제목을 쓰세요">
											</td>
											
										</tr>
			
										<tr>
											<th style="width:10%">과목명</th>
											<td class="table-title">${subjName}</td>
											<th style="width:10%">등록날짜</th>
											<td class="table-title"><fmt:formatDate value="${share.cdate }" pattern="yyyy-MM-dd"/></td>
										</tr>
										<tr>
											<th style="width:10%">첨부파일</th>
											<td colspan="3" class="table-title">
												<input type="file" id="fileUpload" multiple>
												<c:forEach items="${share.attachList }" var="attach">
													<div class="col-md-6 col-sm-6 col-xs-12 attach-item${attach.anoCd}${attach.anoSeq }" style="cursor:pointer;" >
														<div class="info-box">
															<span class="info-box-icon bg-yellow">
																<i class="fa fa-copy"></i>
															</span>
															<span class ="info-box-text">
																<fmt:formatDate value="${share.cdate}" pattern="yyyy/MM/dd" />	
															</span>
															<span class ="info-box-number">${attach.filename }</span>
															<button type="button" onclick="removeFile_go(${attach.anoCd},${attach.anoSeq });" style="border:0;outline:0;" 
																class="badge bg-red">X</button>
														</div>
													</div>
												</c:forEach>
											</td>
										</tr>
									</tbody>
								</table>
							<div>
								<div class="form-group">
									<textarea class="textarea" name="content" id="content"
										rows="20" placeholder="1000자 내외로 작성하세요."
										style="display: none;">${fn:escapeXml(share.content)}</textarea>
								</div>
							</div>
							</form>

						</div>



					</div>
					<!-- ================================================= -->
					<!-- 버튼 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-center">

						<button class="btn btn-primary" type="button" onclick="modifyPOST_go();">등록</button>
						&nbsp;&nbsp;
						<button class="btn btn-danger" type="button"
							onclick="history.go(-1)">취소</button>
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
	function modifyPOST_go(){
		if($("input[name='title']").val()==""){ //form.title.value
			alert("제목은 필수입니다.");
			$("input[name='title']").focus();
			return;
		}

		var formData = new FormData(); 
		var v_shaBno = $('#shaBno').val();
		var v_title = $('#title').val();
		var v_content = $('#content').val();
		var uploadFile = $('#fileUpload');
		
		formData.append("shaBno",v_shaBno);
		formData.append("title",v_title);
		formData.append("content",v_content);
		
		for(var i=0; i<uploadFile[0].files.length; i++){
			formData.append("uploadFile",uploadFile[0].files[i]);
		}
		
		$.ajax({
			method:'POST',
			url:'${webPath}/stu/support/share/modify',
			contentType: false,
			processData: false,
			data: formData,
//	 		dataType:"json",
			success: function(result) {
				alert("등록이 완료됐습니다");
				pageMove('${webPath}/stu/support/share');
			},
			error: function() {
				alert("등록 실패");
			}
		});
		
// 		$("form[role='modifyForm']").submit();
	}    

function removeFile_go(anoCd,anoSeq){
	var className = "attach-item" + anoCd + anoSeq;
	
	if (confirm("삭제하시겠습니까?")) {
		$.ajax({
			method:"get",
			url:"${webPath}/removeSelectedFile?anoCd="+anoCd+"&anoSeq="+anoSeq,
			dataType:"text",
			success:function(data){
				alert("삭제되었습니다.");
				$('div[class='+className+']').remove();
			},
			error:function(){
			}
		});
		
		return;
	}else{
		alert("삭제하지 않았습니다");
	}
	
}
</script>   

