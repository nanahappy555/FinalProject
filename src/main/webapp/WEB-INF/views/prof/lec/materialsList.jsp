<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
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
				<ul class="menuMove nav nav-pills mb-1" id="pills-tab" role="tablist">
					<li class="nav-item"><a class="nav-link"
						id="lecMain-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/main?lecCd=${lecCd }')"
						data-toggle="pill" href="#lecMain"
						role="tab" aria-controls="home" aria-selected="false">메인</a></li>
						
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecAttend-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/attend/list.do?lecCd=${lecCd}')"
						data-toggle="pill" href="#lecAttend"
						role="tab" aria-controls="contact" aria-selected="false">출결관리</a>
					</li>
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecMarks-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/marks/list.do?lecCd=${lecCd}')"
						data-toggle="pill" href="#lecMarks"
						role="tab" aria-controls="contact" aria-selected="false">성적관리</a>
					</li>
					
					<li class="menuMove nav-item"><a class="nav-link active show"
						id="lecMaterials-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/materials/list.do?lecCd=${lecCd}')"
						data-toggle="pill" href="#lecMaterials"
						role="tab" aria-controls="contact" aria-selected="true">학습자료</a></li>
				</ul>
				<!-- ================================================= -->
				<!-- 탭 LIST 끝 -->
				<!-- ================================================= -->
				
				<!-- ================================================= -->
				<!-- 탭 CONTENT 시작 -->
				<!-- ================================================= -->
<!-- 				 onload="pageChanged()"  -->
<!-- alert(this.contentWindow.location); -->
<!-- 				<iframe id="innerFrame" -->
<%-- 					src="<%=request.getContextPath()%>/prof/lec/index.do"frameborder="0" --%>
<!-- 					scrolling="no" style="border:1px dotted red; overflow-x:hidden; width:100%;height:93%;"></iframe> -->

				<div class="tab-content" id="pills-tabContent">
					<!-- 탭 1 시작 -->
					<div class="tab-pane fade" id="lecMain" role="tabpanel" aria-labelledby="pills-lecMain-tab">
						<p>텍스트1</p>
					</div> 
					<!-- 탭 1 끝 -->
					<!-- 탭 5 끝 -->
					<!-- 탭 6 시작 -->
					<div class="tab-pane fade" id="lecAttend" role="tabpanel" aria-labelledby="pills-lecAttend-tab">
						<p>텍스트6</p>
					</div>
					<!-- 탭 6 끝 -->
					<!-- 탭 7 시작 -->
					<div class="tab-pane fade" id="lecMarks" role="tabpanel" aria-labelledby="pills-lecMarks-tab">
						<p>텍스트7</p>
					</div>
					<!-- 탭 7 끝 -->
					<!-- 탭 8 시작 -->
					<div class="tab-pane fade active show" id="lecMaterials" role="tabpanel" aria-labelledby="pills-lecMaterials-tab">
						
						<!-- ================================================= -->
						<!-- 카드바디 시작 -->
						<!-- ================================================= -->
							<div class="card-body">
								<!-- ================================================= -->
								<!-- 검색바 시작 -->
								<!-- ================================================= -->
								<!-- ================================================= -->
								<!-- 검색바 끝 -->
								<!-- ================================================= -->
							
								<!-- ================================================= -->
								<!-- 아코디언 시작 -->
								<!-- ================================================= -->
								
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
																		<h5 class="mb-0 d-flex justify-content-between">
																			<button id="btn${weekNotice.weekNo}" class="btn btn-link collapsed" data-toggle="collapse"
																				data-target="#collapse${weekNotice.weekNo}" aria-expanded="false"
																				aria-controls="#collapse${weekNotice.weekNo}" value="${weekNotice.weekNo}주차 공지 및 수업자료">${weekNotice.weekNo}주차 공지 및 수업자료</button>
																			<button id="${weekNotice.weekNo}" class="btn btn-rounded btn-brand" onclick="OpenWindow('${webPath}/prof/lec/materials/modifyForm?weekNo=${weekNotice.weekNo}&lecCd=${weekNotice.lecCd}','수정',630,850)">수정</button>
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
																					style="cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/getFile?anoCd=${attach.anoCd}&anoSeq=${attach.anoSeq}'">
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
								
								<!-- ================================================= -->
								<!-- 아코디언 끝 -->
								<!-- ================================================= -->
						
								<!-- ================================================= -->
								<!-- 등록 버튼 시작 -->
								<!-- ================================================= -->
								<div class="row justify-content-end mt-2 mr-2">
									<button class="btn btn-outline-primary" type="button"onclick="OpenWindow('${webPath}/prof/lec/materials/registForm?lecCd=${lecCd}','주차별 수업자료 등록',630,850)">자료등록</button>
								</div>
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
					<!-- 탭 8 끝 -->
					<!-- 탭 9 시작 -->
					
					<!-- 탭 9 끝 -->
				</div>
				<!-- ================================================= -->
				<!-- 탭 CONTENT 끝 -->
				<!-- ================================================= -->

			</div>
			<!-- ================================================= -->
			<!-- 탭 끝 -->
			<!-- ================================================= -->
		</div>
		<!-- ================================================= -->
		<!-- 본문1 끝 -->
		<!-- ================================================= -->


	</div>
	<!-- ================================================= -->
	<!-- MAIN-CONTENT 끝 -->
	<!-- ================================================= -->
	
	
	
	
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