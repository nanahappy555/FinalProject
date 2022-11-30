<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="lecNoticeList" value="${dataMap.lecNoticeList }" /> 
<c:set var="cri" value="${pageMaker.cri }" />

<style>
.lecInfo {
	width: 100px;
	height: 50px;
	background-color: #FF3232;
	color: white;
	text-align: center;
	font-size: large;
	font-weight: bold;
	border-radius: 15px;
	line-height: 50px;
	display: inline-block;
	margin-left: 10px;
	margin-bottom: 15px;
}
</style>

<script>
$("#pageHeaderSpan", parent.document).attr("murl","<%=request.getContextPath()%>/stu/lec/mylecture/index?lecCd=${lecCd}");
</script>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->
	<div class="row">
		<!-- ================================================= -->
		<!-- 탭 -->
		<!-- ================================================= -->
		<div class="pills-regular col-xl-12">

			<!-- ================================================= -->
			<!-- 탭LIST 시작 -->
			<!-- ================================================= -->
			<ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
				<li class="menuMove nav-item"><a class="nav-link"
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

			<!-- <div class="tab-content" id="pills-tabContent">
 -->
			<div class="card">
				<div class="card-body">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<!-- <h4 class="card-header">
					<i class="fas fa-clipboard"></i>&nbsp;&nbsp;경영학개론
				</h4> -->

						<div class="card-header">
							<h1 id="header" class="header-title"
								style="text-align: left; margin-top: 100px; margin-left: 20px; display: inline">
								<strong>${myLecture.subjName}</strong>

							</h1>
							<div class="lecInfo" style="width: 130px;">${myLecture.lecCategoryCd}</div>
						</div>


						<div class="card-body">
							<div class="main-content-jsp">

								<div class="row">

									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
										<div class="card" style="text-align: center">
											<div class="card-body">
													<div class="row flex justify-content-center" >
														<span class="manPicture" data-anoCd="${myLecture.anoCd}"
					            		  	   		      style="display:block;width:150px;height:150px; border-radius:50%; margin:0;"></span>
															
															<div class="text-center align-self-center ml-3">
																<h2 class="font-24 mb-0">${myLecture.name } 교수님</h2>
																<p>${myLecture.emailAddr }</p>
															</div>
													</div>
											</div>
										</div>
									</div>

									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
										<div class="card">

											<div class="card-body" style="text-align: center">
												<table class="table table-hover">
													<thead >
														<h3 style="background-color:rgba(204,204,255,0.3); margin:0px; padding:10px;">
															<strong>나의 출결현황</strong>
														</h3>
													</thead>
													<tbody>
														<tr>
															<td>주차별 현황</td>
															<td>출석</td>
															<td>지각</td>
															<td>조퇴</td>
															<td>결석</td>
														</tr>
														<tr>
															<td style="font-size: 20px;">${seme.currentWeek}/16</td>
															<td style="font-size: 30px;">${attendList[1].attendCnt}</td>
															<td style="font-size: 30px;">${attendList[2].attendCnt}</td>
															<td style="font-size: 30px;">${attendList[3].attendCnt}</td>
															<td style="font-size: 30px;">${attendList[0].attendCnt}</td>
														</tr>

													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>

								<div class="row">

									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
										<div class="card">

											<div class="card-body" style="text-align: left">
												<h3 style="display: inline;">
													<strong><i class="fas fa-check"></i>&nbsp;공지사항</strong>
												</h3>
												<pre style="display: inline">								 </pre>
												<i class=" fas fa-list"></i><span style="font-size: 16px;">
													<a
													href="<%=request.getContextPath()%>/mylecture/notice/list?lecCd=${lecCd}">전체글보기</a>
												</span>
												<table class="table table-hover">
													<thead>
														<tr>
															<th>글 제목</th>
															<th>글 내용</th>
															<th>조회수</th>
															<th>등록 날짜</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${lecNoticeList}" var="lecNotice"
															varStatus="status">
															<tr style="cursor:pointer" onclick="pageMove('<%=request.getContextPath()%>/mylecture/notice/detail?lecNoticeNo=${lecNotice.lecNoticeNo}&lecCd=${lecNotice.lecCd}')">
																<c:choose>
																	<c:when test="${fn:length(lecNotice.title)>15}">

																		<td title="${lecNotice.title}">${fn:substring(lecNotice.title,0,15)}.....</td>
																	</c:when>
																	<c:otherwise>
																		<td>${lecNotice.title}</td>
																	</c:otherwise>
																</c:choose>
																<c:choose>
																	<c:when test="${fn:length(lecNotice.content)>=15}">
																		<td>${fn:substring(lecNotice.content,0,15)}.....</td>
																	</c:when>
																	<c:otherwise>
																		<td>${lecNotice.content}</td>
																	</c:otherwise>
																</c:choose>
																<td>${lecNotice.viewCnt}</td>
																<td><fmt:formatDate value="${lecNotice.cdate}"
																		pattern="yyyy-MM-dd" /></td>
															</tr>
														</c:forEach>


													</tbody>
												</table>
											</div>
										</div>
									</div>

									<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
										<div class="card">

											<div class="card-body" style="text-align: left">
												<h3 style="display: inline">
													<strong><i class="fas fa-edit"></i>&nbsp;과제</strong>
												</h3>
												<pre style="display: inline">					        		          </pre>
												<i class=" fas fa-list"></i><span style="font-size: 16px;">
													<a href="<%=request.getContextPath()%>/stu/lec/mylecture/assign/list?lecCd=${lecCd}">전체글보기</a>
												</span>
												<table class="table table-hover">
													<thead>
														<tr>
															<th>글 제목</th>
															<th>게시날짜</th>
															<th>마감날짜</th>
															<th>제출날짜</th>
															<th>제출현황</th>
															<th>점수확인</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach items="${assignMap.assignmentList}" var="assign" varStatus="status">
														<tr style="cursor:pointer" onclick="pageMove('<%=request.getContextPath()%>/stu/lec/mylecture/assign/detail?assBno=${assign.assBno}&lecCd=${lecCd}&from=list')">
															<td>${assign.title}</td>
															<td><fmt:formatDate value="${assign.createDate}" pattern="yyyy/MM/dd"/></td>
															<td><fmt:formatDate value="${assign.dueDate}" pattern="yyyy/MM/dd"/></td>
															<td><fmt:formatDate value="${assign.submitDate}" pattern="yyyy/MM/dd"/></td>
															<td>${assign.subEvalStatusCd}</td>
															<td>${assign.score }</td>
														</tr>
													</c:forEach>

													</tbody>
												</table>
											</div>
										</div>
									</div>



									<div class="container-fluid" style="padding-left: 0px;">

										<div class="row">
											<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

												<!-- ================================================= -->
												<!-- 카드 시작 -->
												<!-- ================================================= -->
												<div class="card">

													<!-- ================================================= -->
													<!-- 카드바디 시작 -->
													<!-- ================================================= -->
													<div class="card-body" id="weekNoticeList">

														<!-- ================================================= -->
														<!-- 아코디언 시작 -->
														<!-- ================================================= -->
													<c:forEach items="${weekNoticeList}" var="weekNotice">
														<div id="accorDiv${weekNotice.weekNo}" class="accrodion-regular">
															<div id="accordion${weekNotice.weekNo}">
															
																<div class="card">
																	<div class="card-header" id="heading${weekNotice.weekNo}">
																		<h5 class="mb-0">
																			<button id="btn${weekNotice.weekNo}" class="btn btn-link collapsed" data-toggle="collapse"
																				data-target="#collapse${weekNotice.weekNo}" aria-expanded="false"
																				aria-controls="#collapse${weekNotice.weekNo}" value="${weekNotice.weekNo}주차 공지 및 수업자료">${weekNotice.weekNo}주차 공지 및 수업자료</button>
																		</h5>
																	</div>
																	<div id="collapse${weekNotice.weekNo}" class="collapse"
																		aria-labelledby="heading${weekNotice.weekNo}" data-parent="#accordion"
																		style="">
																		<div class="card-body">
																			<p>${weekNotice.content}</p>
																			<!-- ================================================= -->
																			<!-- 버튼 시작 -->
																			<!-- ================================================= -->
																			<div class="row justify-content-end mt-1">
																			<c:forEach items="${weekNotice.attachList}" var="attach">
																				<button class="btn btn-secondary" type="button"
																					style="cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/getFile?anoCd=${attach.anoCd}&anoSeq=${attach.anoSeq}'"">
																					<i class="fas fa-file-pdf"></i>&nbsp;${attach.filename}
																				</button>
																				&nbsp;&nbsp;
																			</c:forEach>
																				<!-- <button class="btn btn-outline-danger" type="button" onclick="f_alert();">삭제</button>&nbsp;&nbsp; -->
																			</div>
																			<!-- ================================================= -->
																			<!-- 버튼 끝 -->
																			<!-- ================================================= -->
																		</div>
																	</div>
																</div>
															</div>
														</div>
														</c:forEach>

														<!-- ================================================= -->
														<!-- 아코디언 끝 -->
														<!-- ================================================= -->

														<!-- ================================================= -->
														<!-- 등록 버튼 시작 -->
														<!-- ================================================= -->
														<!-- 		<div class="row justify-content-end mt-2 mr-2">
			<button class="btn btn-outline-primary" type="button" onclick="">자료등록</button>
		</div> -->
														<!-- ================================================= -->
														<!-- 등록 버튼 끝 -->
														<!-- ================================================= -->

														<!-- ================================================= -->
														<!-- 페이지네이션 시작 -->
														<!-- ================================================= -->
														<!-- ================================================= -->
														<!-- 페이지네이션 끝 -->
														<!-- ================================================= -->

													</div>
													<!-- ================================================= -->
													<!-- 카드바디 끝 -->
													<!-- ================================================= -->


												</div>
												<!-- ================================================= -->
												<!-- 카드 끝 -->
												<!-- ================================================= -->
											</div>







										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- ================================================= -->
			<!-- 탭 CONTENT 시작 -->
			<!-- ================================================= -->





			<!-- ================================================= -->
			<!-- 탭 CONTENT 끝 -->
			<!-- ================================================= -->

		</div>
		<!-- ================================================= -->
		<!-- 탭 끝 -->
		<!-- ================================================= -->
		<!-- ================================================= -->
		<!-- 본문1 끝 -->
		<!-- ================================================= -->
	</div>
</div>

<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
<script>
MemberPictureThumb('<%=request.getContextPath()%>');
	var menus = document.querySelectorAll('.menuMove');
	for (var i = 0; i < menus.length; i++) {
		menus[i].addEventListener("click", function() {
			location.href = event.target.getAttribute('data-url');
		});
	}

	var menus = document.querySelectorAll('.menuMove');
	for (var i = 0; i < menus.length; i++) {
		menus[i].addEventListener("click", function() {
			location.href = event.target.getAttribute('data-url');
		});
	}
</script>
<script>
function accordionShow(){
	var showAccordionBtn = $("#btn${seme.currentWeek}");
	var showAccordionCollapse = $("#collapse${seme.currentWeek}");
	showAccordionBtn.attr("class","btn btn-link").attr("aria-expanded","true");
	var thisWeekNotice = showAccordionBtn.attr("value");
	showAccordionBtn.html("<h3 style='color : red;font-weight:bold; text-align:left;'><i class='fas fa-check-circle'></i> 이번주차</h3><span>"+thisWeekNotice+"</span>");
	
	showAccordionCollapse.attr("class","collapse show");
	
	
	const selectAccorDiv = $("#accorDiv${seme.currentWeek}");
	
	const newNode = selectAccorDiv[0].cloneNode(true);
	newNode.id = "#accorDiv${seme.currentWeek}";
	
	var weekNoticeList = $("#weekNoticeList");
	weekNoticeList.prepend(newNode);
	selectAccorDiv.remove();
	
	
}

accordionShow();
</script>
</body>
