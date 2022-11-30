<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="lecQnaList" value="${dataMap.lecQnaList }" />
<c:set var="cri" value="${pageMaker.cri }" />


<!-- <head>
<title>jsp 페이지 제목입니다</title>
</head>
<body>
 -->

<!-- <style>
.lecInfo{

width : 100px;
height: 50px;
background-color: #FF3232;
color:white;
text-align: center;
font-size: large;
font-weight: bold;
border-radius:15px;
line-height : 50px;
display:inline-block;
margin-left : 10px;

}
</style> -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">




	<div class="row">

		<div class="pills-regular col-xl-12">

			<!-- ================================================= -->
			<!-- 탭LIST 시작 -->
			<!-- ================================================= -->
			<ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath() %>/mylecture/notice/list?lecCd=${lecCd}"
					id="Stulenotice-tab" data-toggle="pill" href="#pills-lecnotice"
					role="tab" aria-controls="home" aria-selected="true">공지사항</a></li>
				<li class="menuMove nav-item"><a class="nav-link"
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
				<li class="menuMove nav-item"><a class="nav-link active show"
					data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/qna/list?lecCd=${lecCd}"
					id="StuQna-tab" data-toggle="pill" href="#pills-lecattend"
					role="tab" aria-controls="contact" aria-selected="false">Q&A</a></li>

			</ul>
			<!-- ================================================= -->
			<!-- 탭 LIST 끝 -->
			<!-- ================================================= -->

			<!-- ================================================= -->
			<!-- 카드 시작 -->
			<!-- ================================================= -->
			<div class="card">
				<div class="card-header">
					<h1 id="header" class="header-title"
						style="text-align: left; margin-top: 20px; margin-left: 20px; display: inline">
						<strong>질문게시판</strong>
					</h1>
				</div>


				<!-- ================================================= -->
				<!-- 카드바디 시작 -->
				<!-- ================================================= -->
				<div class="card-body">
					<!-- ================================================= -->
					<!-- 검색바 시작 -->
					<!-- ================================================= -->

					<div id="keyword">
						<div class="input-group mb-3 justify-content-end">
							<select class="form-control col-md-1" name="perPageNum"
								id="perPageNum" onchange="list_go(1);">
								<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' }>정렬개수</option>
								<option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>2개씩</option>
								<option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>3개씩</option>
								<option value="5" ${cri.perPageNum eq 5 ? 'selected' : '' }>5개씩</option>
							</select> <select class="form-control col-md-1" name="searchType"
								id="searchType">
								<option value="">검색구분</option>
								<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
								<option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
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
					</div>



					<!-- ================================================= -->
					<!-- 검색바 끝 -->
					<!-- ================================================= -->

					<!-- ================================================= -->
					<!-- 게시판 시작 -->
					<!-- ================================================= -->

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일자</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${lecQnaList}" var="list" varStatus="status">


								<tr style="cursor: pointer;" class="ckId"
									secretchk="${list.secretCd }" lecqBno="${list.lecqBno}"
									stuCd=${list.stuCd }>
									<td>${pageMaker.totalCount - (status.index + ((cri.page-1)*cri.perPageNum)) }</td>

									<c:choose>
										<c:when test="${list.secretCd eq 'sec' }">
											<td class="table-title"><c:if test="${!empty list.response }">
													<span class="nav-item"> 
													<i class="fas fa-lock"></i>
													&nbsp;<span class="text-success">[답변완료]</span>&nbsp;
													</span>
												</c:if> <c:if test="${empty list.response }">
													<span class="nav-item"> <i class="fas fa-lock"></i>&nbsp;
														<span class="text-warning">[답변대기중]</span>&nbsp;
													</span>
												</c:if>${list.title}</td>
										</c:when>


										<c:otherwise>

											<td class="table-title"><c:if
													test="${!empty list.response }">
													<span class="nav-item"> <span class="text-success">[답변완료]</span>&nbsp;
													</span>
												</c:if> <c:if test="${empty list.response }">
													<span class="nav-item"> <span class="text-warning">[답변대기중]</span>&nbsp;
													</span>
												</c:if>${list.title}</td>
										</c:otherwise>

									</c:choose>




									<td>${list.stuName}</td>
									<td><fmt:formatDate value="${list.cdate }"
											pattern="yyyy-MM-dd" /></td>
									<td>${list.viewCnt}</td>

								</tr>
							</c:forEach>





						</tbody>
					</table>

					<!-- ================================================= -->
					<!-- 게시판 끝 -->
					<!-- ================================================= -->

					<!-- ================================================= -->
					<!-- 등록 버튼 시작 -->
					<!-- ================================================= -->


					<div class="row justify-content-end mt-2 mr-2">
						<button class="btn btn-primary btn-sm" type="button"
							style="cursor: pointer;"
							onclick="OpenWindow('<%=request.getContextPath()%>/stu/lec/mylecture/assign/qna/registForm?lecCd=${lecCd}','질문등록',1700,650);">등록</button>
					</div>



					<!-- ================================================= -->
					<!-- 페이지네이션 끝 -->
					<!-- ================================================= -->

				</div>
				<!-- ================================================= -->
				<!-- 카드바디 끝 -->
				<!-- ================================================= -->



				<div class="card-footer">
					<div class="row justify-content-center">


						<!-- pagination -->
						<nav aria-label="Navigation">
							<ul class="pagination justify-content-center m-0">
								<li class="page-item"><a class="page-link"
									href="javascript:list_go(1);"> <i
										class="fas fa-angle-double-left"></i>
								</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">
										<i class="fas fa-angle-left"></i>
								</a></li>

								<c:forEach var="pageNum" begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }">
									<li class="page-item ${cri.page == pageNum?'active':''}">
										<a class="page-link" href="javascript:list_go('${pageNum}');">${pageNum }</a>
									</li>
								</c:forEach>
								<li class="page-item"><a class="page-link"
									href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">
										<i class="fas fa-angle-right"></i>
								</a></li>
								<li class="page-item"><a class="page-link"
									href="javascript:list_go('${pageMaker.realEndPage}');"> <i
										class="fas fa-angle-double-right"></i>
								</a></li>
							</ul>
						</nav>
					</div>



				</div>
				<!-- ================================================= -->
				<!-- 카드 끝 -->
				<!-- ================================================= -->
			</div>





		</div>
	</div>
	<!-- ================================================= -->
	<!-- MAIN-CONTENT 끝 -->
	<!-- ================================================= -->
</div>

<script>
var lecCd = '<%=request.getParameter("lecCd")%>';

	var menus = document.querySelectorAll('.menuMove');
	for (var i = 0; i < menus.length; i++) {
		menus[i].addEventListener("click", function() {
			location.href = event.target.getAttribute('data-url');
		});
	}

	var memId = '${loginUser.memId}';
	$(".ckId")
			.click(
					function(event) {

						var lecqBno = event.currentTarget
								.getAttribute("lecqBno");
						var stuCd = event.currentTarget.getAttribute("stuCd");
						var secChk = event.currentTarget
								.getAttribute("secretchk");

						if (secChk && memId != stuCd) {
							alert("작성자만 접근할 수 있습니다.");
							return;
						}
						pageMove('${webPath}/stu/lec/mylecture/assign/qna/detail?lecqBno='
								+ lecqBno);

					});

	function list_go(page, url) {
		var perPageNum = $('select[name="perPageNum"]').val();
		var searchType = $('select[name="searchType"]').val();
		var keyword = $('input[name="keyword"]').val();

		if (!url)
			url = "${webPath}/stu/lec/mylecture/assign/qna/list?lecCd=${lecCd}&page="
					+ page
					+ "&perPageNum="
					+ perPageNum
					+ "&searchType="
					+ searchType + "&keyword=" + keyword;

		console.log(url);
		pageMove(url);
	}

	function cutter(text) {
		if (text.length > 30) {
			return text.substr(0, 30) + "...";
		}
		return text;
	}
</script>



