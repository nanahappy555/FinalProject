<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="lecNoticeList" value="${dataMap.lecNoticeList }" /> 
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
		<!-- ================================================= -->
		<!-- 탭LIST 시작 -->
		<!-- ================================================= -->
		<div class="pills-regular col-xl-12">
			<ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
				<li class="menuMove nav-item"><a class="nav-link active show"
					data-url="<%=request.getContextPath() %>/mylecture/notice/list?lecCd=${lecCd}"
					id="Stulenotice-tab" data-toggle="pill" href="#"
					role="tab" aria-controls="home" aria-selected="true">공지사항</a></li>
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath()%>/stu/lec/mylecture/assign/list?lecCd=${lecCd}"
					id="Stulecassignment-tab" data-toggle="pill" href="#"
					role="tab" aria-controls="profile" aria-selected="false">과제게시판</a>
				</li>
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/syllabus.do?lecCd=${lecCd}"
					id="Stureviews-tab" data-toggle="pill" href="#"
					role="tab" aria-controls="contact" aria-selected="false">강의계획서</a>
				</li>
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/pds/list?lecCd=${lecCd}"
					id="StuReference-tab" data-toggle="pill" href="#"
					role="tab" aria-controls="contact" aria-selected="false">자료실</a></li>
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/qna/list?lecCd=${lecCd}"
					id="StuQna-tab" data-toggle="pill" href="#"
					role="tab" aria-controls="contact" aria-selected="false">Q&A</a></li>

			</ul>
		
		<!-- ================================================= -->
		<!-- 탭 LIST 끝 -->
		<!-- ================================================= -->



		<!-- ================================================= -->
		<!-- 카드 시작 -->
		<!-- ================================================= -->
		<div class="card">
			<div class="card-body">
				<div class="main-content-jsp">
					<div class="card-header">
							<h1 id="header" class="header-title"
								style="text-align: left; margin-top: 20px; margin-left: 20px; display: inline">
								<strong>공지사항</strong>
							</h1>
						</div>
					<!-- ================================================= -->
					<!-- 검색바 시작 -->
					<!-- ================================================= -->
					<div class="input-group mb-3 justify-content-end">
						<select class="form-control col-md-1" name="perPageNum"
							id="perPageNum" onchange="list_go('1','<%=request.getContextPath()%>/mylecture/notice/list');">
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
								id="searchBtn" onclick="list_go('1','<%=request.getContextPath()%>/mylecture/notice/list');">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
					<!-- ================================================= -->
					<!-- 검색바 끝 -->
					<!-- ================================================= -->



					<!-- ================================================= -->
					<!-- 카드헤더 끝 -->
					<!-- ================================================= -->

					<!-- ================================================= -->
					<!-- 카드바디 시작 -->
					<!-- ================================================= -->
			<div class="card">
				<div class="card-body">
					<table class="table table-hover">
						<thead>
							<tr style="background-color:rgba(102,178,255,0.2); font-size: 18px;">
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">날짜</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty lecNoticeList }">
								<tr>
									<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${lecNoticeList }" var="list" varStatus="status">
								<tr class="evalRow"
									onclick="pageMove('<%=request.getContextPath()%>/mylecture/notice/detail?lecNoticeNo=${list.lecNoticeNo}&lecCd=${lecCd}')">
									<td>${pageMaker.totalCount - (status.index + ((cri.page-1)*20)) }</td>
									
							<c:choose>
								<c:when test="${fn:length(list.title)>50}">
									<td class="shortening" data-toggle="tooltip" data-placement="top" title=""
	                                       data-original-title="${list.title}" style="width:20%">${list.title}</td>
								</c:when>
								<c:otherwise>
                                   	<td style="width:20%">${list.title}</td>
                                </c:otherwise>
							</c:choose>
									<td><fmt:formatDate value="${list.cdate }"
											pattern="yyyy/MM/dd" /></td>
									<td>${list.viewCnt }</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				</div>
					<!-- ================================================= -->
					<!-- 게시판 끝 -->
					<!-- ================================================= -->

					<!-- ================================================= -->
					<!-- 등록 버튼 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-end mt-2 mr-2">
					<sec:authorize access="hasAuthority('prof')">	
						<button class="btn btn-outline-primary" type="button"
							onclick="pageMove('<%=request.getContextPath()%>/mylecture/notice/registForm');">작성하기</button>
					</sec:authorize>
					</div>
					<!-- ================================================= -->
					<!-- 등록 버튼 끝 -->
					<!-- ================================================= -->

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
					<a class="page-link" href="javascript:list_go(1,'<%=request.getContextPath()%>/mylecture/notice/list');">
						<i class="fas fa-angle-double-left"></i>
					</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}','<%=request.getContextPath()%>/mylecture/notice/list');">
						<i class="fas fa-angle-left"></i>
					</a>						
				</li>
			
			<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
				<li class="page-item ${cri.page == pageNum?'active':''}">
					<a class="page-link" href="javascript:list_go('${pageNum}','<%=request.getContextPath()%>/mylecture/notice/list');" >${pageNum }</a>
				</li>
			</c:forEach>
				<li class="page-item">
					<a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :cri.page}','<%=request.getContextPath()%>/mylecture/notice/list');">
						<i class="fas fa-angle-right" ></i>
					</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:list_go('${pageMaker.realEndPage}','<%=request.getContextPath()%>/mylecture/notice/list');">
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
			<!-- ================================================= -->
			<!-- 카드 끝 -->
			<!-- ================================================= -->
			</div>
		</div>
	</div>
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
<script>
	var evalRow = document.querySelectorAll('.evalRow');
	for (var i = 0; i < evalRow.length; i++) {
		evalRow[i].style.cursor = "pointer";
	}
	
	var menus = document.querySelectorAll('.menuMove');
	for (var i = 0; i < menus.length; i++) {
		menus[i].addEventListener("click", function() {
			location.href = event.target.getAttribute('data-url');
		});
	}
</script>