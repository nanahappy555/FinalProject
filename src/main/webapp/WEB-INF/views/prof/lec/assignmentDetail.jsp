<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">

	<!-- 111111 -->
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card mb-0">
				<h2 class="card-header">과제 상세보기</h2>
				<form role="form" method="post"
					action="<%=request.getContextPath()%>/prof/lec/assignment/remove"
					name="registForm">
					<div class="card-body">
						<div class="row">

							<table class="table table-bordered">

								<tbody>
									<tr>
										<th style="width: 10%">제목</th>
										<td class="table-title">${detail.title }(${detail.evalRate })
											<input type="hidden" name="assBno" value="${detail.assBno }">
											<input type="hidden" name="lecCd" value="${detail.lecCd }">

										</td>
										<th style="width: 10%">시작날짜</th>
										<td class="table-title"><fmt:formatDate
												value="${detail.createDate}" pattern="yyyy-MM-dd HH:ss" /></td>

									</tr>
									<tr>
										<th style="width: 10%">첨부파일</th>









										<c:if test="${not empty detail.attachList}">
											<td><c:forEach items="${detail.attachList}" var="attach">
													<div
														class="col-md-12 col-sm-4 col-xs-12 d-flex justify-content-front"
														style="cursor: pointer;"
														onclick="location.href='<%=request.getContextPath()%>/getFile?anoCd=${attach.anoCd}&anoSeq=${attach.anoSeq}'">

														<i class="fa fa-copy"></i> <span class="info-box-number">${attach.filename }</span>
													</div>
												</c:forEach></td>
										</c:if>

										<c:if test="${empty detail.attachList}">
											<td><span>첨부파일 없음</span></td>
										</c:if>

										<th style="width: 10%">마감날짜</th>
										<td class="table-title"><fmt:formatDate
												value="${detail.dueDate}" pattern="yyyy-MM-dd HH:ss" /></td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td colspan="4" class="table-title">
											<p class="m-3">${detail.content }</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>


						<!-- ================================================= -->
						<!-- 버튼 시작 -->
						<!-- ================================================= -->
						<div class="row justify-content-end mt-3" float="right">
							<button class="btn btn-outline-primary" type="button"
								onclick="pageMove('<%=request.getContextPath()%>/prof/lec/assignment/eval/list?lecCd=${detail.lecCd }&assBno=${detail.assBno }')">평가하러가기</button>
							&nbsp;&nbsp;
							<button class="btn btn-outline-primary" type="button"
								onclick="pageMove('<%=request.getContextPath()%>/prof/lec/assignment/modifyForm?lecCd=${detail.lecCd }&assBno=${detail.assBno }')">수정</button>
							&nbsp;&nbsp;
							<button class="btn btn-outline-danger" type="button"
								onclick="remove_go();">삭제</button>
							&nbsp;&nbsp;
							<button class="btn btn-primary" type="button"
								onclick="window.close();">닫기</button>
							&nbsp;&nbsp;
						</div>
						<!-- ================================================= -->
						<!-- 버튼 끝 -->
						<!-- ================================================= -->
					</div>
				</form>

			</div>
		</div>
	</div>

	<!-- 11111끝 -->

</div>

<c:if test="${from eq 'remove' }">
	<script>
	window.onload = function(){
Swal.fire(
		  'The Internet?',
		  'That thing is still around?',
		  'question'
		).then(()=>{
			
		CloseWindow();
		})
	}
</script>
</c:if>

<script>
function remove_go(){
	Swal.fire({
		title: '삭제하시겠습니까?',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		if (result.isConfirmed) {
			
			document.querySelector("form").submit();
		
			}
		});
}
</script>

