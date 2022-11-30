<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="assignmentList" value="${dataMap.assignmentList }" /> 
<c:set var="cri" value="${pageMaker.cri }" />

<head>
<style>
.shortening{
	 max-width:10px;
      overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;
}

</style>

</head>

<div class="container-fluid">
	<div class="row">
		<!-- 탭 -->
		<!-- ================================================= -->
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
					data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/syllabus.do?lecCd=${lecCd}"
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
			<!-- ================================================= -->
					
			<div class="card">
				<div class="card-body">
					<div class="main-content-jsp">
					
						<div class="card-header">
							<h1 id="header" class="header-title"
								style="text-align: left; margin-top: 20px; margin-left: 20px; display: inline">
								<strong>과제게시판</strong>
							</h1>
						</div>
						<!-- 검색바 시작 -->
					<!-- ================================================= -->
					<div class="input-group mb-3 justify-content-end">
						<select class="form-control col-md-1" name="perPageNum"
							id="perPageNum" onchange="list_go(1,'<%=request.getContextPath()%>/mylecture/notice/list');">
							<option value="20" ${cri.perPageNum eq 20 ? 'selected' : '' }>정렬개수(20개)</option>
							<option value="50" ${cri.perPageNum eq 50 ? 'selected' : '' }>50개씩</option>
							<option value="100" ${cri.perPageNum eq 100 ? 'selected' : '' }>100개씩</option>
						</select> <select class="form-control col-md-1" name="searchType"
							id="searchType">
							<option value="">검색구분</option>
							<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
							<option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>

						</select>
						<!-- keyword -->
						<input class="form-control col-md-2" type="text" name="keyword"
							placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
							class="input-group-append">
							<button class="btn btn-primary btn-sm" type="button"
								id="searchBtn" onclick="list_go(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
					<!-- ================================================= -->
					<!-- 검색바 끝 -->


						<div class="card">
							<div class="card-body">
								<table class="table table-hover">
									<thead>
										<tr style="background-color:rgba(102,178,255,0.2); font-size: 18px;">
											<th style="width: 10%">글번호</th>
											<th style="width: 25%">제목</th>
											<th style="width: 15%">게시날짜</th>
											<th style="width: 15%">마감날짜</th>
											<th style="width: 15%">제출날짜</th>
											<th style="width: 10%">제출현황</th>
											<th style="width: 10%">점수확인</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${assignmentList}" var="assign">
										<tr style="cursor:pointer" onclick="goAssignDetail('${assign.assBno}');">
											<td>${assign.assBno}</td>
										<c:choose >
											<c:when test="${fn:length(assign.title)>50}">
											<td class="shortening" data-toggle="tooltip" data-placement="top" title=""
	                                       data-original-title="${assign.title}" >${assign.title}</td>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    	<td>${assign.title}</td>
	                                    	</c:otherwise>
	                                    </c:choose> 
											<td><fmt:formatDate value="${assign.createDate}" pattern="yyyy/MM/dd"/></td>
											<td><fmt:formatDate value="${assign.dueDate}" pattern="yyyy/MM/dd"/></td>
											<td><fmt:formatDate value="${assign.submitDate}" pattern="yyyy/MM/dd"/></td>
											<td>${assign.subEvalStatusCd}</td>
											<td>${assign.score}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row justify-content-end mr-2">
							<button type="button" class="btn btn-outline-primary"
								onclick="OpenWindow('${webPath}/stu/lec/mylecture/assign/summaryPage','논문 요약 및 번역',950,630);">논문 요약 및 번역</button>
						</div>
						<div class="row justify-content-center">
											<!-- ================================================= -->
					<!-- 페이지네이션 시작 -->
					<!-- ================================================= -->
					<form id="jobForm">	
						<input type='hidden' name="page" value="" />
						<input type='hidden' name="perPageNum" value=""/>
						<input type='hidden' name="searchType" value="" />
						<input type='hidden' name="keyword" value="" />
						<input type='hidden' name="lecCd" value="${lecCd}" />
					</form>
					
					
				<nav aria-label="Navigation">
					<ul class="pagination justify-content-center m-0">
						<li class="page-item">
							<a class="page-link" href="javascript:list_go(1,'<%=request.getContextPath()%>/stu/lec/mylecture/assign/list');">
								<i class="fas fa-angle-double-left"></i>
							</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}','<%=request.getContextPath()%>/stu/lec/mylecture/assign/list');">
								<i class="fas fa-angle-left"></i>
							</a>						
						</li>
					
						<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
							<li class="page-item ${cri.page == pageNum?'active':''}">
								<a class="page-link" href="javascript:list_go('${pageNum}','<%=request.getContextPath()%>/stu/lec/mylecture/assign/list');" >${pageNum }</a>
							</li>
						</c:forEach>
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :cri.page}','<%=request.getContextPath()%>/stu/lec/mylecture/assign/list');">
								<i class="fas fa-angle-right" ></i>
							</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('${pageMaker.realEndPage}','<%=request.getContextPath()%>/stu/lec/mylecture/assign/list');">
								<i class="fas fa-angle-double-right"></i>
							</a>
						</li>	
					</ul>
				</nav>
				<!-- ================================================= -->
					<!-- 페이지네이션 끝 -->
					<!-- ================================================= -->
						</div>


					</div>

				</div>



			</div>
		</div>
	</div>
</div>
<script>
	var menus = document.querySelectorAll('.menuMove');
	for (var i = 0; i < menus.length; i++) {
		menus[i].addEventListener("click", function() {
			location.href=event.target.getAttribute('data-url');
		});
	}
</script>
<script>
function goAssignDetail(assBno){
	pageMove("<%=request.getContextPath()%>/stu/lec/mylecture/assign/detail?assBno="+assBno+"&lecCd=${lecCd}&from=list")
}

</script>
