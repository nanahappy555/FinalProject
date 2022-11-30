<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container-fluid">
	<div class="col-xl-4">
		<div class="card">
			<div class="card-header">일지작성하기</div>
			<div class="card-body">
				<form role="form" method="post" action="regist.do" name="registForm">
							<div class="form-group">
								<textarea class="textarea" name="content" id="content" rows="20"
									placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
							</div>
							</form>
			</div>
			<div
				class="card-footer p-0 text-center d-flex justify-content-center ">
				<div class="card-footer-item card-footer-item-bordered">
					<a href="#" class="card-link">저장</a>
				</div>
				<div class="card-footer-item card-footer-item-bordered">
					<a href="#" class="card-link">취소</a>
				</div>
				
			</div>
		</div>
	</div>
</div>
<script>
window.onload=function(){
	summernote_go($('#content'),'<%=request.getContextPath()%>'); 
}
</script>