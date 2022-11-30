<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tui-date-picker.css" >
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tui-example-style.css" >
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />

</head>
<style>
td{
	text-align: center !important;
}
</style>
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid" style="padding-left:0px;">
		
		<!-- =================p================================ -->
		<!-- 카드 -->
		<!-- ================================================= -->
		<div class="card">
			
		<!-- ================================================= -->
		<!-- 헤더 시작 -->
		<!-- ================================================= -->
		<div class="card-header d-flex sticky-top">
<!-- 			<h3 class="card-header-title">수강생 목록</h3> -->
			<div class="toolbar card-toolbar-tabs  mr-auto">
				<ul class="nav nav-pills" id="pills-tab" role="tablist">
					<li class="nav-item">
						<a class="nav-link" id="pills-stulist-tab" data-toggle="pill"
							href="#pills-stulist" role="tab" aria-controls="pills-stulist" aria-selected="false">수강생목록</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="pills-attend-tab" data-toggle="pill"
							href="#pills-attend" role="tab" aria-controls="pills-attend" aria-selected="false">출결관리</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active show" id="pills-marks-tab" data-toggle="pill"
							href="#pills-marks" role="tab" aria-controls="pills-marks" aria-selected="true">성적관리</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- ================================================= -->
		<!-- 탭 LIST 끝 -->
		<!-- ================================================= -->
			
		<!-- ================================================= -->
		<!-- 탭 CONTENT 시작 -->
		<!-- ================================================= -->
		<div class="card-body">
			<div class="tab-content" id="pills-tabContent">
				<!-- 탭 1 시작 -->
				<div class="tab-pane fade" id="pills-stulist" role="tabpanel" aria-labelledby="pills-stulist-tab">
					<!-- ================================================= -->
					<!-- 검색바 시작 -->
					<!-- ================================================= -->
					<div class="input-group mb-3 justify-content-end">
					 	<select class="form-control col-md-1" name="searchType" id="searchType">
					 		<option value=""  >검색구분</option>
							<option value="t" ${param.searchType=='t' ? "selected":"" }>이름</option>
							<option value="w" ${param.searchType=='w' ? "selected":"" }>학년</option>
							<option value="c" ${param.searchType=='c' ? "selected":"" }>전공</option>	
											 									
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
					<!-- 게시판 시작 -->
					<!-- ================================================= -->
				
					<table class="table table-hover">
						<thead>
							<tr>
								<th>순번</th>
								<th>학번</th>
								<th>이름</th>
								<th>학년</th>
								<th>전공</th>
								<th>메일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td contenteditable="true">123456</td>
								<td>박건영</td>
								<td>1</td>
								<td>컴퓨터공학과</td>
								<td>
<!-- 									<button class="mdi mdi-email" type="button" style="border:0;outline:0;" id="mailBtn" -->
<%-- 									onclick="pageMove('<%=request.getContextPath()%>/index?mCode=M180000')"> --%>
<!-- 									</button> -->
									<a href="<%=request.getContextPath()%>/index?mCode=M180000" target="_top"><i class="mdi mdi-email"></i></a>
								</td>
							</tr>
						</tbody>
					</table>
		
				<!-- ================================================= -->
				<!-- 게시판 끝 -->
				<!-- ================================================= -->
			
			
				<!-- ================================================= -->
				<!-- 페이지네이션 시작 -->
				<!-- ================================================= -->
				<div class="row justify-content-center mt-3">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Previous">
										<span aria-hidden="true">«</span>
										<span class="sr-only">Previous</span>
									</a>
								</li>
								<li class="page-item active">
									<a class="page-link" href="#">1</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">2</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">3</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Next">
										<span aria-hidden="true">»</span>
										<span class="sr-only">Next</span>
									</a>
								</li>
							</ul>
						</nav>
				</div>
				<!-- ================================================= -->
				<!-- 페이지네이션 끝 -->
				<!-- ================================================= -->
				</div>
				<!-- 탭 1 끝 -->
				
				
				
				
				<!-- 탭 2 시작 -->
				<div class="tab-pane fade" id="pills-attend" role="tabpanel" aria-labelledby="pills-attend-tab">
					<div class="row">
						<!-- ================================================= -->
						<!-- 좌측달력 시작 -->
						<!-- ================================================= -->
						<div class="col col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12 position-fixed">
							<div class="input-group d-flex justify-content-center">
								
		
		
<!-- 						        <table class="calendar-table"> -->
<!-- 						            <tbody> -->
<!-- 						                <tr> -->
<!-- 						                    <td><div id="calendar-date-ko"></div></td> -->
<!-- 						                </tr> -->
<!-- 						            </tbody> -->
<!-- 						        </table> -->
								<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
           							<input type="text" id="datepicker-input" aria-label="Date-Time" style=" visibility:none;">
						            <span class="tui-ico-date"></span>
						        </div>
						        <div id="wrapper" style="position:absolute; left:12%; top:100%; margin-top: -1px;"></div>
		   
		
							</div>
						</div>
						<!-- ================================================= -->
						<!-- 좌측달력 끝 -->
						<!-- ================================================= -->
					
					
						<!-- ================================================= -->
						<!-- 우측 테이블 시작 -->
						<!-- ================================================= -->
						<div class="col col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12 ml-5" style="position:relative; left:20%;">
						<!-- ================================================= -->
						<!-- 검색바 시작 -->
						<!-- ================================================= -->
						<div class="row d-flex">
						<h3 class="text-bottom"><i class="fas fa-calendar-check"></i>&nbsp;&nbsp;&nbsp;2022-10-15</h3>
						<div class="input-group mb-3 justify-content-end" style="width:90%;">
						 	<select class="form-control col-md-1" name="searchType" id="searchType">
						 		<option value=""  >검색구분</option>
								<option value="t" ${param.searchType=='t' ? "selected":"" }>이름</option>
								<option value="w" ${param.searchType=='w' ? "selected":"" }>학년</option>
								<option value="c" ${param.searchType=='c' ? "selected":"" }>전공</option>	
												 									
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
						</div>
						
						<!-- ================================================= -->
						<!-- 검색바 끝 -->
						<!-- ================================================= -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th>학번</th>
										<th>이름</th>
										<th style="width:12%">출석</th> 
										<th style="width:12%">결석</th>
										<th style="width:12%">지각</th>
										<th style="width:12%">조퇴</th>
										<th>저장</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>123546</td>
										<td>박건영</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline1" class="custom-control-input" checked>
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline1" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline1" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline1" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<button class="btn btn-primary btn-sm" type="button"
											onclick="f_test();">저장
											</button>
										</td>
									</tr>
									<tr>
										<td>123546</td>
										<td>박건영</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline2" class="custom-control-input" checked>
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline2" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline2" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline2" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<button class="btn btn-primary btn-sm" type="button"
											onclick="f_test();">저장
											</button>
										</td>
									</tr>
									<tr>
										<td>123546</td>
										<td>박건영</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline3" class="custom-control-input" checked>
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline3" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline3" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline3" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<button class="btn btn-primary btn-sm" type="button"
											onclick="f_test();">저장
											</button>
										</td>
									</tr>
									<tr>
										<td>123546</td>
										<td>박건영</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline4" class="custom-control-input" checked>
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline4" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline4" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline4" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<button class="btn btn-primary btn-sm" type="button"
											onclick="f_test();">저장
											</button>
										</td>
									</tr>
									<tr>
										<td>123546</td>
										<td>박건영</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline5" class="custom-control-input" checked>
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline5" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline5" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline5" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<button class="btn btn-primary btn-sm" type="button"
											onclick="f_test();">저장
											</button>
										</td>
									</tr>
									<tr>
										<td>123546</td>
										<td>박건영</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline6" class="custom-control-input" checked>
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline6" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline6" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline6" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<button class="btn btn-primary btn-sm" type="button"
											onclick="f_test();">저장
											</button>
										</td>
									</tr>
									<tr>
										<td>123546</td>
										<td>박건영</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline7" class="custom-control-input" checked>
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline7" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline7" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline7" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<button class="btn btn-primary btn-sm" type="button"
											onclick="f_test();">저장
											</button>
										</td>
									</tr>
									<tr>
										<td>123546</td>
										<td>박건영</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline8" class="custom-control-input" checked>
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline8" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline8" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline8" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<button class="btn btn-primary btn-sm" type="button"
											onclick="f_test();">저장
											</button>
										</td>
									</tr>
									<tr>
										<td>123546</td>
										<td>박건영</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline9" class="custom-control-input" checked>
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline9" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline9" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline9" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<button class="btn btn-primary btn-sm" type="button"
											onclick="f_test();">저장
											</button>
										</td>
									</tr>
									<tr>
										<td>123546</td>
										<td>박건영</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline10" class="custom-control-input" checked>
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline10" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline10" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<label class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="radio-inline10" class="custom-control-input">
													<span class="custom-control-label"></span>
											</label>
										</td>
										<td>
											<button class="btn btn-primary btn-sm" type="button"
											onclick="f_test();">저장
											</button>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- ================================================= -->
							<!-- 게시판 끝 -->
							<!-- ================================================= -->
						
						
							<!-- ================================================= -->
							<!-- 페이지네이션 시작 -->
							<!-- ================================================= -->
							<div class="row justify-content-center">
									<nav aria-label="Page navigation example">
										<ul class="pagination">
											<li class="page-item">
												<a class="page-link" href="#" aria-label="Previous">
													<span aria-hidden="true">«</span>
													<span class="sr-only">Previous</span>
												</a>
											</li>
											<li class="page-item active">
												<a class="page-link" href="#">1</a>
											</li>
											<li class="page-item">
												<a class="page-link" href="#">2</a>
											</li>
											<li class="page-item">
												<a class="page-link" href="#">3</a>
											</li>
											<li class="page-item">
												<a class="page-link" href="#" aria-label="Next">
													<span aria-hidden="true">»</span>
													<span class="sr-only">Next</span>
												</a>
											</li>
										</ul>
									</nav>
							</div>
							<!-- ================================================= -->
							<!-- 페이지네이션 끝 -->
							<!-- ================================================= -->
						</div>
					</div>
				</div>
				<!-- 탭 2 끝 -->
				
				
				
				<!-- 탭 3 시작 -->
				<div class="tab-pane fade active show" id="pills-marks" role="tabpanel" aria-labelledby="pills-marks-tab">
					<!-- ================================================= -->
					<!-- 검색바 시작 -->
					<!-- ================================================= -->
<!-- 						<div class="" ><h5 style="display:inline;">( )안은 비율점수</h5></div> -->
						<div class="input-group d-flex justify-content-end">
						 	<select class="form-control col-md-1" name="searchType" id="searchType">
						 		<option value=""  >검색구분</option>
								<option value="t" ${param.searchType=='t' ? "selected":"" }>이름</option>
								<option value="w" ${param.searchType=='w' ? "selected":"" }>학년</option>
								<option value="c" ${param.searchType=='c' ? "selected":"" }>전공</option>	
												 									
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
					<!-- 헤더 시작 -->
					<!-- ================================================= -->
					<h5 style="display:inline;">( )안은 비율점수</h5>
					<!-- ================================================= -->
					<!-- 헤더 끝 -->
					<!-- ================================================= -->
				
					<!-- ================================================= -->
					<!-- 게시판 시작 -->
					<!-- ================================================= -->
					<div id="grid"></div>
<!-- 					<div id="tui-pagination-container" class="tui-pagination"></div> -->
<!-- 					<table class="table table-hover"> -->
<!-- 						<thead> -->
<!-- 							<tr> -->
<!-- 								<th>학번</th> -->
<!-- 								<th>이름</th> -->
<!-- 								<th style="width:12%">중간(30)</th>  -->
<!-- 								<th style="width:12%">기말(30)</th> -->
<!-- 								<th style="width:12%">과제(30)</th> -->
<!-- 								<th style="width:12%">출결(20)</th> -->
<!-- 								<th style="width:12%">총점</th> -->
<!-- 								<th style="width:12%">총점계산하기</th> -->
<!-- 								<th>저장</th> -->
<!-- 							</tr> -->
<!-- 						</thead> -->
<!-- 						<tbody> -->
<!-- 							<tr> -->
<!-- 								<td>456513</td> -->
<!-- 								<td>한태훈</td> -->
<!-- 								<td> -->
<!-- 									<input type="text" class="form-control" -->
<!-- 									name="midterm_exam" value="" placeholder="중간점수"> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<input type="text" class="form-control"  -->
<!-- 									name="final_exam" value="" placeholder="기말점수"> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<input type="text" class="form-control"  -->
<!-- 									name="assign" value="" placeholder="과제점수"> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<input type="text" class="form-control"  -->
<!-- 									name="attend" value="" placeholder="출결점수"> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<span id="total" name="total"></span> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<button class="btn btn-outline-primary btn-sm" type="button" -->
<!-- 									onclick="f_total();">점수계산하기 -->
<!-- 									</button> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<button class="btn btn-primary btn-sm" type="button" -->
<!-- 									onclick="f_test();">저장 -->
<!-- 									</button> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 						</tbody> -->
<!-- 					</table> -->
		
				<!-- ================================================= -->
				<!-- 게시판 끝 -->
				<!-- ================================================= -->
			
			
				<!-- ================================================= -->
				<!-- 페이지네이션 시작 -->
				<!-- ================================================= -->
<!-- 				<div class="row justify-content-center"> -->
<!-- 						<nav aria-label="Page navigation example"> -->
<!-- 							<ul class="pagination"> -->
<!-- 								<li class="page-item"> -->
<!-- 									<a class="page-link" href="#" aria-label="Previous"> -->
<!-- 										<span aria-hidden="true">«</span> -->
<!-- 										<span class="sr-only">Previous</span> -->
<!-- 									</a> -->
<!-- 								</li> -->
<!-- 								<li class="page-item active"> -->
<!-- 									<a class="page-link" href="#">1</a> -->
<!-- 								</li> -->
<!-- 								<li class="page-item"> -->
<!-- 									<a class="page-link" href="#">2</a> -->
<!-- 								</li> -->
<!-- 								<li class="page-item"> -->
<!-- 									<a class="page-link" href="#">3</a> -->
<!-- 								</li> -->
<!-- 								<li class="page-item"> -->
<!-- 									<a class="page-link" href="#" aria-label="Next"> -->
<!-- 										<span aria-hidden="true">»</span> -->
<!-- 										<span class="sr-only">Next</span> -->
<!-- 									</a> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</nav> -->
<!-- 				</div> -->
				<!-- ================================================= -->
				<!-- 페이지네이션 끝 -->
				<!-- ================================================= -->
				</div>
				<!-- 탭 3 끝 -->
				
				
				
			</div>
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
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->

<script src="<%=request.getContextPath()%>/resources/js/tui-date-picker.js"></script>
<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>
function f_total(){
	
	document.getElementById('total').innerHTML = "점수가 없슈";
	
}
</script>

<script>
function f_test(){ 
	alert('박건영의 점수가 저장됐습니다.');
}
</script>




<script>

var datepicker = new tui.DatePicker('#wrapper', {
    date: new Date(),
    input: {
        element: '#datepicker-input',
        format: 'yyyy-MM-dd'
    },
    showAlways: true
});

datepicker.on('change', () => {
	alert('ajax로 오른쪽 테이블이 변경됩니다</br>오늘날짜는 : ' + datepicker.getDate());
});
</script>



<script>
var Grid = tui.Grid;
var v_mid = 10; //100분율

//ajax ArrayList => [] 배열문자열로 리턴됨 => JSON.parse해야됨
//datatype
var gridData = [];


//테스툐용 더미 데이터 생성
for(var i=1; i<=30;i++){
	var data = {};
	data.id = '100'+ (Math.ceil(Math.random()*89) +10);
	data.name = "아무개"+i;
	data.midterm = 60 + Math.ceil(Math.random()*40);
	data.finalexam = 60 + Math.ceil(Math.random()*40);
	data.marks = 60 + Math.ceil(Math.random()*40);
	data.attend = 60 + Math.ceil(Math.random()*40);
	data.total = 60+ Math.ceil(Math.random()*40);
	data.summary = "<button class='btn btn-outline-primary btn-sm summaryBtn' style='border:0; outline:0;'>점수계산하기</button>";
	data.submit = "<button class='btn btn-primary btn-sm submitBtn' style='border:0; outline:0;'>저장</button>";

	gridData.push(data);
}

	
const grid = new Grid({
    el: document.getElementById('grid'),
    rowHeaders: ['rowNum'],
    //data: gridData,
    pageOptions: {
        useClient: true,
        perPage: 10
      },
    scrollX: false,
    scrollY: false,
    columns: [
   	  {
   	    header: '학번',
   	    name: 'id'
   	  },
   	  {
   	    header: '이름',
   	    name: 'name',
   	    sortingType: 'asc',
   	    sortable: true
   	  },
   	  {
   	    header: '중간(' + v_mid + ')',
   	    name: 'midterm',
   	    editor: 'text'
   	  },
   	  {
   	    header: '기말(' + v_mid + ')',
   	    name: 'finalexam',
   	    editor: 'text'
   	  },
   	  {
   	    header: '과제(' + v_mid + ')',
   	    name: 'marks',
   	    editor: 'text'
   	  },
   	  {
   	    header: '출결(' + v_mid + ')',
   	    name: 'attend',
   	    editor: 'text'
   	  },
   	  {
   	    header: '총점',
   	    name: 'total'
   	  },
   	  {
   		  header: '총점계산하기',
   		  name: 'summary'
   	  },
   	  {
   		  header: '저장',
   		  name: 'submit'
   	  }
   	  
   ]
   
});

grid.resetData(gridData);
// grid.refreshLayout();
// grid.setWidth(300);


// grid.on('dbclick', (ev) => {
//   console.log(ev.nativeEvent.target.className);
//   console.log(ev.rowKey);
//   console.log(ev.columnName);
//   console.log(ev.instance);
// });

// grid.on('click', (ev) => {
// 	  if (ev.rowKey === 3) {
// 	    ev.stop();  
// 	  }
// 	});


// console.log("ggg",grid);

// window.onload = () => {
// 	grid.refreshLayout();

	var btnSummary = document.querySelectorAll(".summaryBtn");

	console.log("check:",btnSummary);
	for(let i=0; i<btnSummary.length; i++){
		console.log("check2:",i + "번")
		btnSummary[i].addEventListener('click',()=>{
			alert('토스트 자체 계산 이벤트찾아줘...');
		});
	}
  
	var btnSubmit = document.querySelectorAll(".submitBtn");
	console.log("check2:",btnSubmit);
	for(let i=0; i<btnSubmit.length; i++){
		btnSubmit[i].addEventListener('click',()=>{
			alert('저장');
		});
	}
// }
   

</script>