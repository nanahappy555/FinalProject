<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class=container-fluid style="padding-left: 0px;">
	<div class="container-fluid">

		<!-- 111111 -->
		<div class="row">

			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="card" style="padding-bottom: 0px;">
					<h2 class="card-header">Q&A 작성</h2>

					<div class="card-body">

						<div class="row">
							<div class="col-xl-12">
								<form action="<%=request.getContextPath()%>/common/scqna/regist"
									  method="post" role="form" name="">
									
									<table class="table table-bordered" width="1500">

										<tbody>
											<tr>
												<th style="width: 10%">제목</th>
												<td class="table-title"><input type="text" id="title"
													value="" name="scTitle" class="form-control"
													placeholder="제목을 쓰세요"></td>
												<th style="width: 10%">비밀글 여부</th>
												<td>
									 			 	
									 			 	
									 			 	
									 			 	<input type="checkbox" value='sec' id="input_check"/>
												</td>
											</tr>

											<tr>
												<th style="width: 10%">작성자</th>
												<td class="table-title"><input type="text" class="form-control" name="writer" readonly value="${memId}"></td>
												
											</tr>
										</tbody>
									</table>
									<div>
										<div class="form-group">
											<textarea class="textarea" name="scContent" id="content"
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
						<div class="row justify-content-end">

							<button class="btn btn-primary" type="button"
								onclick="regist_go()">등록</button>
							&nbsp;&nbsp;
							<!-- <button class="btn btn-danger" type="button" onclick="alert();">취소</button> -->
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


	<!-- Modal -->
	<div id="modifyModal" class="modal modal-default fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">댓글 수정</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="replyModBtn"
						onclick="replyModify_go();">Modify</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal End -->


<script>
window.onload=function(){
	summernote_go($('#content'),'<%=request.getContextPath()%>'); 
}
</script>

<script>
<%-- /* function f_alert(){
   Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#5969FF',
        cancelButtonColor: '#EF172C',
        confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
        if (result.isConfirmed) {
          Swal.fire(
            'Deleted!',
            'Your file has been deleted.',
            'success'
          ),
          CloseWindow();
        }
   });
      
}
 */
 
 function alert() {

	  alert("등록을 취소하겠습니까?");

	  window.location.href='<%=request.getContextPath()%>/common/scqna/delete?scqBno=${scqnaDetail.scqBno }';

	} --%>
</script>


<script>
function regist_go(){
	
	
	Swal.fire({
        title: '저장하시겠습니까?',
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {

	if($("input[name='sCtitle']").val()==""){ //form.title.value
		alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
	}
	var form=$("form[role='form']");
	var secChk =  document.getElementById('input_check').checked;
	var secretCd = $('<input type="hidden" name="secretCd">');
	if(secChk){
		secretCd.val("sec")
	}else{
		secretCd.val("open")
	}
	form.append(secretCd);
	form.submit();
	

	
}
		
		  })
		}

</script>


