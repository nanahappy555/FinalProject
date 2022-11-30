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
			<div class="card">
				<h2 class="card-header">
					<i class="fas fa-align-justify">&nbsp;상세보기</i>
				</h2>

				<div class="card-body m-3">
					<div class="row">
						<table class="table table-bordered">

							<tbody>
								<tr>
									<th style="width: 10%">제목</th>
									<td colspan="5" class="table-title" style="word-break:break-all" >${detail.title}</td>

								</tr>

								<tr>
									<th style="width: 10%">작성자</th>
									<td style="width: 20%" class="table-title">${detail.stuName}</td>
									<th style="width: 10%">날짜</th>
									<td style="width: 20%" class="table-title"><fmt:formatDate
											value="${detail.cdate}" pattern="yyyy-MM-dd" /></td>
									<th style="width: 10%">조회수</th>
									<td style="width: 10%" class="table-title">${detail.viewCnt}</td>
								</tr>



								<tr>
									<td colspan="6" class="table-title">
										<p class="m-3">${detail.content}</p>
									</td>
								</tr>

							</tbody>
						</table>
					</div>


					<!-- ================================================= -->
					<!-- 버튼 시작 -->
					<!-- ================================================= -->
					
		<!-- 게시글 버튼 -->			
					<div class="row justify-content-end mt-3">
						<%-- <button class="btn btn-outline-primary m-1" type="button" style="display:${memId eq scqnaDetail.writer ? 'inline' : 'none'};" 
							onclick="pageMove('<%=request.getContextPath()%>/common/scqna/modifyForm')">수정</button> --%>
						<button class="btn btn-outline-danger m-1" type="button" style="display:${memClassCd eq 'prof' ? 'inline' : 'none'};" 
							onclick="deleteDetail();">삭제</button>
							<button class="btn btn-outline-primary m-1" type="button" onclick="window.close();">닫기</button>&nbsp;&nbsp;
					</div>
					<!-- ================================================= -->
					<!-- 버튼 끝 -->
					<!-- ================================================= -->
				</div>
			</div>
		</div>
	</div>

	<!-- 11111끝 -->



	<!-- 답변 부분-->

	<div class="row">

		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<h3 class="card-header">
					<i class=" fas fa-comment">&nbsp;답변</i>
				</h3>
				<!-- 버튼 -->
				<div class="card-body">
					<!-- <label for="qnaans">답변</label> -->
					<div class="timeline">
						<!-- 여기 댓글목록이 handlebars로 들어옴 -->
						<div class="card replyDIV">
							<span
								class="card-header d-flex justify-content-between align-items-center">
								<c:choose>
									<c:when test="${empty detail.response}">
										<span>관리자</span>
									</c:when>
									<c:otherwise>
										<span>관리자&nbsp;&nbsp;<fmt:formatDate value="${detail.rdate}" pattern="yyyy-MM-dd" />	</span>
														
										<span> <a href="#"
												class="btn btn-rounded btn-outline-primary btn-sm"
												data-toggle="modal" data-target="#modifyModal" 
												>수정</a>&nbsp;
												<!--  <a href="#" class="btn btn-rounded btn-outline-danger btn-sm" onclick="deleteReply();">삭제</a>
										 -->
										</span> 
										
									</c:otherwise>
								</c:choose>
							

							</span>
							
							 <span class="card-body"> 
							 <c:choose>
									<c:when test="${empty detail.response}">
										<strong>답변 대기 중</strong>
									</c:when>
									<c:otherwise>
										<strong>${detail.response}</strong>
									</c:otherwise>
								</c:choose>
							</span>
						</div>

					</div>

					<div class='text-center'>
						<ul id="pagination" class="pagination justify-content-center m-0">

						</ul>
					</div>
				</div>

<!-- 답변작성부분  -->

<form action="<%=request.getContextPath()%>/prof/lec/qna/updateReply" method="post" role="form" name="" id="registReplyForm"
style="display:${memClassCd eq 'prof' ? 'inline' : 'none'};">

				<c:if test="${empty detail.response}">
					<div class="card-footer" >
						<div class="col-xl-12">
							<div class="d-flex justify-content-between align-items-center">
								<input type="hidden" name="lecqBno" value="${detail.lecqBno}" > 
								<input type="hidden" name="lecCd" value="${detail.lecCd}" > 



								<h3>답변 작성</h3>
								<span>
								
									<button type="button" class="btn btn-primary" id="replyAddBtn" 
										onclick="replyRegist_go();">등록</button>
								</span>
							</div>
						</div>
						<div class="col-xl-12 mt-1">
							<textarea class="form-control"  placeholder="입력하세요." name="response"
								id="response">${detail.response} </textarea>
						</div>
					</div>
				</c:if>
</form>






			</div>
		</div>

	</div>
</div>
<!-- 22222끝 -->



<!-- Modal -->
<form action="<%=request.getContextPath()%>/prof/lec/qna/updateReply" method="post" role="form" name="" id="modifyForm">

	<div id="modifyModal" class="modal modal-default fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">댓글 수정</h4>
					<input type="hidden" name="lecqBno" value="${detail.lecqBno}" > 
								<input type="hidden" name="lecCd" value="${detail.lecCd}" > 
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control" value="${detail.response}" name="response" >
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="replyModBtn"
						onclick="replyModify_go();">수정하기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
</form>
<!-- Modal End -->














<script>
function replyRegist_go(){
	
	$("#registReplyForm").submit();
}

</script>

<script>
function replyModify_go(){
	
	$("#modifyForm").submit();
}
</script>

<script>

var lecqBno = '<%=request.getParameter("lecqBno")%>';
function deleteDetail() {

  if (confirm("삭제하시겠습니까?")) {
	  
	  window.location.href='<%=request.getContextPath()%>/prof/lec/qna/delete?lecqBno='+lecqBno;
	  alert("삭제되었습니다.");
	  CloseWindow();
	  return;
}else{
	alert("취소되었습니다");
	
}
	

  
}
</script>


 
