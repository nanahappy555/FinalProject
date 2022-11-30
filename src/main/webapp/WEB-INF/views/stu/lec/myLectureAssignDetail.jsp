<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>

<style>
.title{
	text-align: center;
	font-size: 30px;

}

th{
 background-color: rgba(204, 204, 255,0.3);
}

</style>
</head>

<div class="container-fluid">
	<div class="pills-regular col-xl-12">

		<!-- ================================================= -->
		<!-- 탭LIST 시작 -->
		<!-- ================================================= -->
		<ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
			<li class="menuMove nav-item"><a class="nav-link"
				data-url="<%=request.getContextPath() %>/mylecture/notice/list?lecCd=${lecCd}"
				id="Stulenotice-tab" data-toggle="pill" href="#pills-lecnotice"
				role="tab" aria-controls="home" aria-selected="true">공지사항</a></li>
			<li class="menuMove nav-item"><a class="nav-link active show"
				data-url="<%=request.getContextPath()%>/stu/lec/mylecture/assign/list?lecCd=${lecCd}"
				id="Stulecassignment-tab" data-toggle="pill" href="#pills-lecqna"
				role="tab" aria-controls="profile" aria-selected="false">과제게시판</a></li>
			<li class="menuMove nav-item"><a class="nav-link"
				data-url="<%=request.getContextPath()%>/stu/lec/mylecture/assign/syllabus.do?lecCd=${lecCd}"
				id="Stureviews-tab" data-toggle="pill" href="#pills-lecassignment"
				role="tab" aria-controls="contact" aria-selected="false">강의계획서</a></li>
			<li class="menuMove nav-item"><a class="nav-link"
				data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/pds/list?lecCd=${lecCd}"
				id="StuReference-tab" data-toggle="pill" href="#pills-lecmarks"
				role="tab" aria-controls="contact" aria-selected="false">자료실</a></li>
			<li class="menuMove nav-item"><a class="nav-link"
				data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/qna/list?lecCd=${lecCd}"
				id="StuQna-tab" data-toggle="pill" href="#pills-lecattend"
				role="tab" aria-controls="contact" aria-selected="false">Q&A</a></li>

		</ul>
		<!-- ================================================= -->
		<!-- 탭 LIST 끝 -->
		<!-- ================================================= -->

		<!-- 게시판상세 -->
		<!-- ================================================= -->
		<!-- MAIN-CONTENT -->
		<!-- ================================================= -->
		<div class="card">
			<div class="card-body">
				<div class="main-content-jsp">

					<div class="card">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<h5 class="card-header">
								<i class="fas fa-archive"></i>&nbsp;&nbsp;과제게시판
							</h5>

							<div class="card-body m-3">
							<div class="title"><i class="fas fa-book"></i> 제출과제내용</div>
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th>작성자</th>
											<td class="table-title" style="text-align: center">${myLecAssign.name}</td>
											<th>제출 유무</th>
											<td style="text-align: center">${myAssignSub.subEvalStatusCd}</td>
										</tr>
										<tr>
											<th>등록일시</th>
											<td class="table-title" style="text-align: center"><fmt:formatDate value="${myLecAssign.createDate}" pattern="yyyy/MM/dd"/></td>
											<th>마감날짜</th>
											<td class="table-title" style="text-align: center"><fmt:formatDate value="${myLecAssign.dueDate}" pattern="yyyy/MM/dd"/></td>
										</tr>
										<tr>
											<th>첨부파일</th>
											<td class="table-title">
												<c:if test="${fn:length(myLecAssign.attachList) > 0}">
													<c:forEach items="${myLecAssign.attachList}" var ="attach" >
															<div class="col-md-6 col-sm-6 col-xs-12" style="cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/stu/lec/getFile?anoCd=${attach.anoCd}&anoSeq=${attach.anoSeq}'">
																<div class="info-box">
																	<span class="info-box-icon bg-yellow">
																		<i class="fa fa-copy"></i>
																	</span>
																	
																		<span class ="info-box-text">
																			<fmt:formatDate value="${myLecAssign.createDate}" pattern="yyyy/MM/dd" />	
																		</span>
																		<span class ="info-box-number">${attach.filename }</span>
					
																
																</div>
															</div>
													</c:forEach>
												</c:if>
												<c:if test="${fn:length(myLecAssign.attachList) eq 0}">
													<div style="text-align:center">없음</div>
												</c:if>
											</td>
											<th>조회수</th>
											<td style="text-align: center">${myLecAssign.viewCnt}</td>
										</tr>
										<tr>
											<td colspan="6" class="table-title">
													<p>${myLecAssign.content}</p>
											</td>
										</tr>

									</tbody>
								</table>
				       	 	
							 	<br>
								<button class="btn btn-outline-primary float-right" type="button" onclick="pageMove('<%=request.getContextPath()%>/stu/lec/mylecture/assign/list?lecCd=${lecCd}')">목록</button>
								<button class="btn btn-outline-secondary float-right" onclick="OpenWindow('<%=request.getContextPath()%>/stu/lec/mylecture/assign/submitForm?lecCd=${lecCd}&assBno=${assBno}','과제제출',1650,850)">과제 제출/수정하기</button>
							</div>
							
							
						
						
							<!-- ================================================= -->
							<!-- 버튼 시작 -->
							<!-- ================================================= -->
						
							<!-- ================================================= -->
							<!-- 버튼 끝 -->
							<!-- ================================================= -->
						</div>
					</div>

				</div>

			</div>
		</div>

	</div>
</div>


<script>
function remove(){
	alert();
}
</script>

<script>
	var menus = document.querySelectorAll('.menuMove');
	for (var i = 0; i < menus.length; i++) {
		menus[i].addEventListener("click", function() {
			location.href=event.target.getAttribute('data-url');
		});
	}
	
	
</script>

 
