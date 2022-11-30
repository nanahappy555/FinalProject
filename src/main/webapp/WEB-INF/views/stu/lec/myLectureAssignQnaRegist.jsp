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
					<h2 class="card-header">강의 Q&A 작성</h2>

					<div class="card-body">
					<form role="form" method="post"action="<%=request.getContextPath() %>/prof/lec/assignment/regist"name="registForm">
						<div class="row">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>제목</th>
										
										<td class="table-title"><input class="form-control"
											id="title" name="title" type="text" style="width:100%"/>
											</td>
											<th>비밀글 여부</th><td><input type="checkbox" value='sec' id="input_check"/></td>
									</tr>

								</tbody>
							</table>
							</div>
							<div class="row">
							<div class="col-xl-8">
								<div class="form-group">
									<label for="content"></label>
									<textarea class="textarea" name="content" id="content"
										rows="20" placeholder="1000자 내외로 작성하세요."
										style="display: none;"></textarea>
								</div>
							</div>
						
				</div>
			
</form>


					<!-- ================================================= -->
					<!-- 버튼 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-end mt-3">
						<!--                <button class="btn btn-info" type="button" onclick="">수정</button>&nbsp; -->
						<!--                <button class="btn btn-secondary" type="button" onclick="">삭제</button>&nbsp; -->
						<!--                <button class="btn btn-primary" type="button" onclick="">목록</button>&nbsp; -->
						<!--                <br> -->
						<div class="col-xl-8">
							<button class="btn btn-outline-primary" type="button"
								onclick="regist_go();">등록</button>
							&nbsp;&nbsp;
							<button class="btn btn-outline-danger" type="button"
								onclick="f_alert();">취소</button>
							&nbsp;&nbsp;
						</div>
					</div>
					<!-- ================================================= -->
					<!-- 버튼 끝 -->
					<!-- ================================================= -->
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
	
	if(!$('input[name="title"]').val()){
		  alert("제목은 필수입니다.");
		  return;
		}
	
	if(!$('textarea[name="content"]').val()){
		  alert("내용은 필수입니다.");
		  return;
	}
	
	
	
	var secChk =  document.getElementById('input_check').checked;
	var secretCd = "";
	if(secChk){
		secretCd = "sec";
	}else{
		secretCd = "open";
	}
	var title = $('input[name="title"]').val();
	var content = $('textarea[name="content"]').val();
	var lecCd = "<%=request.getParameter("lecCd")%>";
	var stuCd = '${loginUser.memId}';
	
	
	var params = {
			title:title,
			content:content,
			lecCd:lecCd,
			stuCd:stuCd,
			secretCd:secretCd
	}
	
$.ajax({
	
	method:"post",
	url: "<%=request.getContextPath()%>/stu/lec/mylecture/assign/qna/regist",
	data:JSON.stringify(params),
	contentType: 'application/json; charset=utf-8',
	success:function(data){
		console.log(data);
		alert("성공적으로 질문등록했습니다.");
		CloseWindow();
	},
	error:function(){
		alert("실패");
	}
});

}
</script>
