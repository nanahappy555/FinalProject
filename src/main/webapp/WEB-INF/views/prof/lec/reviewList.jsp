<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
				
				<li class="menuMove nav-item"><a class="nav-link"
					id="lecMaterials-tab"
					onclick="pageMove('<%=request.getContextPath() %>/prof/lec/materials/list.do?lecCd=${lecCd}')"
					data-toggle="pill" href="#lecMaterials"
					role="tab" aria-controls="contact" aria-selected="false">학습자료</a></li>
				<li class="menuMove nav-item"><a class="nav-link active show"
					id="lecReviews-tab"
					onclick="pageMove('<%=request.getContextPath() %>/prof/lec/review/list.do?lecCd=${lecCd}')"
					data-toggle="pill" href="#lecReviews"
					role="tab" aria-controls="contact" aria-selected="true">강의평가</a>
				</li>
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
				<div class="tab-pane fade" id="lecMaterials" role="tabpanel" aria-labelledby="pills-lecMaterials-tab">
					<p>텍스트8</p>
				</div>
				<!-- 탭 8 끝 -->
				<!-- 탭 9 시작 -->
				<div class="tab-pane fade active show" id="lecReviews" role="tabpanel" aria-labelledby="pills-lecReviews-tab">

					<div class="card-body">
						<!-- ================================================= -->
						<!-- 검색바 시작 -->
						<!-- ================================================= -->
						<div class="input-group mb-3 justify-content-end">
							<select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">					  		  		
									<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >정렬개수</option>
									<option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>2개씩</option>
									<option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>3개씩</option>
									<option value="5" ${cri.perPageNum eq 5 ? 'selected' : '' }>5개씩</option>
								</select>
								<select class="form-control col-md-1" name="searchType" id="searchType">
									<option value=""  >검색구분</option>
								<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
								<option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
								<option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>	
																						
							</select>
							<!-- keyword -->
								<input  class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
							<span class="input-group-append">
								<button class="btn btn-primary btn-sm" type="button" 
										id="searchBtn" onclick="list_go(1);">
									<i class="fa fa-fw fa-search"></i>
								</button>
							</span>
						</div>
						<!-- ================================================= -->
						<!-- 검색바 끝 -->
						<!-- ================================================= -->
						<!-- ================================================= -->
						<!-- 아코디언 시작 -->
						<!-- ================================================= -->
						
						<div class="accrodion-regular">
							<div id="accordion">
								<div class="card">
									<div class="card-header" id="headingOne">
										<h5 class="mb-0">
											<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
												강의 재밌어요
											</button>
										</h5>
									</div>
									<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion" style="">
										<div class="card-body m-3">
										
											<table class="table table-bordered">
												<thead>
													<tr>
														<td rowspan="2" scope="col"><strong>평가번호</strong></td>
														<td rowspan="2" colspan="5" scope="col"><strong>평가내용</strong></td>
														<td colspan="5" scope="col"><strong>평가</strong></td>
													</tr>
													<tr>
														<td>매우그렇다</td>
														<td>그렇다</td>
														<td>보통</td>
														<td>아니다</td>
														<td>매우아니다</td>
													</tr>
												</thead>
												<tbody>
						
													<tr>
														<td scope="row">1</td>
														<td colspan="5">주차별 강의계획이 충분히 안내되었다.</td>
														<td><label class="custom-control custom-radio custom-control-inline">
																<input type="radio" name="eval1" class="custom-control-input" value="veryAgree" checked><span class="custom-control-label"></span>
														</label></td>
														<td><label class="custom-control custom-radio custom-control-inline">
																<input type="radio" name="eval1" class="custom-control-input" value="agree">
																<span class="custom-control-label"></span>
														</label></td>
														<td><label class="custom-control custom-radio custom-control-inline">
																<input type="radio" name="eval1" class="custom-control-input" value="soso"><span class="custom-control-label"></span>
														</label></td>
														<td><label class="custom-control custom-radio custom-control-inline">
																<input type="radio" name="eval1" class="custom-control-input" value="disagree"><span class="custom-control-label"></span>
														</label></td>
														<td><label class="custom-control custom-radio custom-control-inline">
																<input type="radio" name="eval1" class="custom-control-input" value="verydisagree"><span class="custom-control-label"></span>
														</label></td>
													</tr>
													<tr>
														<td style="background-color: #5969FF; color: white" colspan="13">
															기타 의견</td>
													</tr>
													<tr>
														<td colspan="13" class="ml-4 mr-4 table-title">가나다라</td>
													</tr>
						
												</tbody>
											
											</table>
										
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingTwo">
										<h5 class="mb-0">
											<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
												교수님재미없어요
											</button>
										</h5>
									</div>
									<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
										<div class="card-body">
											Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingThree">
										<h5 class="mb-0">
											<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
												귀에 쏙쏙 들어와요
											</button>
										</h5>
									</div>
									<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
										<div class="card-body">
											Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-tabhetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- ================================================= -->
						<!-- 아코디언 끝 -->
						<!-- ================================================= -->
					</div>
					<!--카드바디 끝-->
				</div>
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