<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class=container-fluid">

		<!-- 111111 -->
		<div class="row">

			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="card" style="padding-bottom: 0px;">
					<h2 class="card-header">강의 공지사항 작성</h2>

					<div class="card-body">

						<div class="row">
							<div class="col-xl-8">
								<form action="regist.do" role='form' method="post" name="registForm">
									<input type="hidden" name="lecCd" value="${lecCd }">
									<table class="table table-bordered" width="1500">
				
										<tbody>
											<tr>
												<th style="width:10%">제목</th>
												<td class="table-title" colspan="3">
													<input type="text" id="title"
													name='title' class="form-control" placeholder="제목을 쓰세요">
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



							<div class="col-xl-4">

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

function regist_go(){
	var form = document.registForm;
	if(form.title.value==""){
		alert("제목은 필수입니다.");
		return;
	}
	
	form.submit();
}
/* 파일첨부기능이 추가되면 이걸로 교체해야됨
function regist_go(){
	
	var files = $('input[name="uploadFile"]');
	for(var file of files){
		console.log(file.name+" : "+file.value);
		if(file.value==""){
			alert("파일을 선택하세요.");
			file.focus();
			file.click();
			return;
		}
	}	
	
	if($("input[name='title']").val()==""){ //form.title.value
		alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
	}
	
	
	$("form[role='form']").submit()
}
*/

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
