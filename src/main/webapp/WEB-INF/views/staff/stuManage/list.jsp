<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="selectUserRegistList" value="${dataMap.selectUserRegistList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<style>
.lecInfo {
	width: 90px;
	height: 50px;
	background-color: #5969FF;
	color: white;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	border-radius: 15px;
	line-height: 50px;
	display: inline-block;
	margin-left: 10px;
	margin-bottom: 15px;
}
</style>
<style>
tr>th {
	background-color: #cce5ff;
}
</style>


<div class="pills-regular">
	<ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
		<li class="nav-item"><a class="nav-link active show"
			id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
			aria-controls="home" aria-selected="true">학생</a></li>
		<li class="nav-item"><a class="nav-link" id="pills-profile-tab"
			data-toggle="pill" href="#pills-profile" role="tab"
			aria-controls="profile" aria-selected="false">교수</a></li>
		<li class="nav-item"><a class="nav-link" id="pills-contact-tab"
			data-toggle="pill" href="#pills-contact" role="tab"
			aria-controls="contact" aria-selected="false">교직원</a></li>
	</ul>
	<div class="tab-content" id="pills-tabContent">
		<div class="tab-pane fade active show" id="pills-home" role="tabpanel"
			aria-labelledby="pills-home-tab">
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">

						<!-- ================================================= -->
						<!-- 학생학생학생학생학생학생학생학생학생학생학생학생학생학생학생학생학생학생 시작 -->
						<!-- 학생학생학생학생학생학생학생학생학생학생학생학생학생학생학생학생학생학생 시작 -->
						<!-- 학생학생학생학생학생학생학생학생학생학생학생학생학생학생학생학생학생학생 시작 -->
						<!-- ================================================= -->
						<div class="card-body">
							<!-- ================================================= -->
							<!-- 검색바 시작 -->
							<!-- ================================================= -->
							<div id="keyword">
								<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
									<div class="col-md-3 mb-3">
										<label for="country">분과대학</label> 
										<select
											class="custom-select d-block w-100" id="collegeSelect"
											name="collegeCd" onchange="getMajorListByCollegeCd()"
											id="country" required="">
											<option value="">선택</option>
											<c:forEach items="${collegeList }" var="college">
												<option value="${college.colCd}">${college.colName}</option>
											</c:forEach>
										</select>
										<div class="invalid-feedback">분과대학을 선택하세요</div>
									</div>
									<div class="col-md-3 mb-3">
										<label for="state">학과(부)</label> <select id="majorSelect"
											name="majorCd" class="custom-select d-block w-100" id="state"
											required="">
											<option value="">선택</option>
										</select>
										<div class="invalid-feedback">학과(부)를 선택하세요</div>
									</div>
									<div class="col-md-2 mb-3" >
										<label for="state">단어검색</label> <span
											class="input-group-append" style="height: 38px;"><!--<button class="btn btn-primary" type="button" 
	                          id="searchBtn" onclick="list_go(1);">검색</button> -->

											<select class="custom-select d-block w-50" name="searchType"
											id="searchType" >
												<option value="">선택</option>
												<option value="n" ${cri.searchType eq 'n' ? 'selected':''}>이 름</option>

										</select>
										</span>
									</div>
									<div class="col-md-4 mb-3" >
										<label for="state">키워드 검색</label>
										<div class="input-group">
											<input class="form-control" type="text" name="keyword"
												placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
												class="input-group-append"> <!-- <button class="btn btn-primary btn-sm" type="button" id="searchBtn" onclick="list_go(1);">
               <i class="fa fa-fw fa-search"></i>
               </button> -->
												<button class="btn btn-primary" type="button" id="searchBtn"
													onclick="list_go(1);">검색</button></span>
										</div>
									</div>
								</div>

								<div class="row justify-content-end mr-4">
									<!-- <a href="파일 경로/파일이름.확장자" download><button class="btn btn-secondary active">양식 다운로드</button></a>
            <a href="#" class="btn btn-primary active" data-toggle="modal" data-target="#stuManageListModal">사용자등록</a> -->
									<button class="btn btn-primary active float-right"
										style="margin-right: 20px;"
										onclick="OpenWindow('<%=request.getContextPath()%>/staff/stuManage/registForm','등록',1300,600)">사용자등록</button>
									
								</div>
								<div class="modal fade" id="stuManageListModal" tabindex="-1"
									role="dialog" aria-labelledby="stuManageListModalLabel"
									aria-hidden="true" style="display: none;">
									<div class="modal-dialog modal-mid" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="stuManageListModalLabel">
													<strong>사용자등록</strong>
												</h5>
												<a href="#" class="close" data-dismiss="modal"
													aria-label="Close"> <span aria-hidden="true">×</span>
												</a>
											</div>
											<div class="modal-body">

												<div class="card-body">
													<!-- <table class="table table-hover"> -->


													<div class="form-group">


														<div class="input-group mb-1" style="width: 430px;">
															<div class="input-group-prepend be-addon">
																<button tabindex="-1" type="button"
																	class="btn btn-secondary">파일선택</button>
															</div>
															<input type="text" class="form-control" disabled="">
															<button type="button" class="btn btn-lg btn-primary">등록</button>
														</div>


													</div>



												</div>
											</div>
											<div class="modal-footer" style="padding: 30px;">
												<a href="#" class="btn btn-dark" data-dismiss="modal">닫기</a>
											</div>
										</div>
									</div>
								</div>





								<!-- ================================================= -->
								<!-- 검색바 끝 -->
								<!-- ================================================= -->

								<!-- ================================================= -->
								<!-- 게시판 시작 -->
								<!-- ================================================= -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="stuManageListModal" tabindex="-1"
				role="dialog" aria-labelledby="stuManageListModalLabel"
				aria-hidden="true" style="display: none;">
				<div class="modal-dialog modal-mid" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="stuManageListModalLabel">
								<strong>사용자등록</strong>
							</h5>
							<a href="#" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</a>
						</div>
						<div class="modal-body">

							<div class="card-body">
								<!-- <table class="table table-hover"> -->
								<div class="form-group">
									<div class="input-group mb-1" style="width: 430px;">
										<div class="input-group-prepend be-addon">
											<button tabindex="-1" type="button" class="btn btn-secondary">파일선택</button>
										</div>
										<input type="text" class="form-control" disabled="">
										<button type="button" class="btn btn-lg btn-primary">등록</button>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer" style="padding: 30px;">
							<a href="#" class="btn btn-dark" data-dismiss="modal">닫기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">


						<table class="table table-hover">
							<thead>
								<tr>

									<!-- <th scope="col"></th> -->
									<th scope="col">학번</th>
									<th scope="col">분과대학</th>
									<th scope="col">학과</th>
									<th scope="col">이름</th>
									<th scope="col">학년</th>
									<th scope="col">생년월일</th>
									<th scope="col">연락처</th>
									<th scope="col">이메일</th>
									<th scope="col">학적상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${selectUserRegistList}" var="staffStumanage">
									<tr>
										<!-- <td><input type="checkbox"></td> -->
										<td>${staffStumanage.stuCd}</td>
										<td>${staffStumanage.colName}</td>
										<td>${staffStumanage.majorName}</td>
										<td>${staffStumanage.name}</td>
										<td>${staffStumanage.grade}</td>
										<td birthday="${staffStumanage.birthday}">${fn:substring(staffStumanage.birthday,0,4)}/${fn:substring(staffStumanage.birthday,4,6)}/${fn:substring(staffStumanage.birthday,6,8)}</td>
										<td phone="${staffStumanage.phone}">${fn:substring(staffStumanage.phone,0,3)}-${fn:substring(staffStumanage.phone,3,7)}-${fn:substring(staffStumanage.phone,7,11)} </td>
										<td>${staffStumanage.email}</td>
										<td>${staffStumanage.acaStateCd}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- ================================================= -->
			<!-- 게시판 끝 -->
			<!-- ================================================= -->

			<!-- ================================================= -->
			<!-- 등록 버튼 시작 -->
			<!-- ================================================= -->



			<!-- ================================================= -->
			<!-- 등록 버튼 끝 -->
			<!-- ================================================= -->

			<!-- ================================================= -->
			<!-- 페이지네이션 시작 -->
			<!-- ================================================= -->
			<div class="row justify-content-center">
				<%@ include file="/WEB-INF/views/include/pagination.jsp"%>
			</div>
			<!-- ================================================= -->
			<!-- 페이지네이션 끝 -->
			<!-- ================================================= -->


			<!-- ================================================= -->
			<!-- 학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝 -->
			<!-- 학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝 -->
			<!-- 학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝학생끝 -->
			<!-- ================================================= -->



			<!-- ================================================= -->
			<!-- 카드 끝 -->
			<!-- ================================================= -->








			<!-- ================================================= -->
			<!-- MAIN-CONTENT 끝 -->
			<!-- ================================================= -->
		</div>
		<div class="tab-pane fade" id="pills-profile" role="tabpanel"
			aria-labelledby="pills-profile-tab">
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">

						<!-- ================================================= -->
						<!-- 카드바디 시작 -->
						<!-- ================================================= -->
						<div class="card-body">
							<!-- ================================================= -->
							<!-- 검색바 시작 -->
							<!-- ================================================= -->
							<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="col-md-3 mb-3">
									<label for="country">분과대학</label> <select
										class="custom-select d-block w-100" id="country" required="">
										<option value="">선택</option>
										<option>인문대학</option>
									</select>
									<div class="invalid-feedback">분과대학을 선택하세요</div>
								</div>
								<div class="col-md-3 mb-3">
									<label for="state">학과(부)</label> <select
										class="custom-select d-block w-100" id="state" required="">
										<option value="">선택</option>
										<option>아시아언어문명학부</option>
									</select>
									<div class="invalid-feedback">학과(부)를 선택하세요</div>
								</div>
								<div class="col-md-2 mb-3" style="margin-top: 8px;">
									<label for="state"></label> <span class="input-group-append"
										style="height: 38px;">
										<button class="btn btn-primary" type="button" id="searchBtn"
											onclick="list_go(1);">검색</button>
									</span>
								</div>
								<div class="col-md-4 mb-3">
									<label for="state">키워드 검색</label>
									<div class="input-group">
										<input class="form-control" type="text" name="keyword"
											placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
											class="input-group-append">
											<button class="btn btn-primary btn-sm" type="button"
												id="searchBtn" onclick="list_go(1);">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>

							<div class="row justify-content-end mr-4">
								<!-- <a href="파일 경로/파일이름.확장자" download><button class="btn btn-secondary active">양식 다운로드</button></a>
            <a href="#" class="btn btn-primary active" data-toggle="modal" data-target="#profManageListModal">사용자등록</a> -->
								<button class="btn btn-primary active float-right"
									style="margin-right: 20px;"
									onclick="OpenWindow('<%=request.getContextPath()%>/staff/stuManage/registForm','등록',1300,600)">사용자등록</button>
							</div>
							<div class="modal fade" id="profManageListModal" tabindex="-1"
								role="dialog" aria-labelledby="profManageListModalLabel"
								aria-hidden="true" style="display: none;">
								<div class="modal-dialog modal-mid" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="profManageListModalLabel">
												<strong>사용자등록</strong>
											</h5>
											<a href="#" class="close" data-dismiss="modal"
												aria-label="Close"> <span aria-hidden="true">×</span>
											</a>
										</div>
										<div class="modal-body">

											<div class="card-body">
												<!-- <table class="table table-hover"> -->


												<div class="form-group">


													<div class="input-group mb-1" style="width: 430px;">
														<div class="input-group-prepend be-addon">
															<button tabindex="-1" type="button"
																class="btn btn-secondary">파일선택</button>
														</div>
														<input type="text" class="form-control" disabled="">
														<button type="button" class="btn btn-lg btn-primary">등록</button>
													</div>


												</div>



											</div>
										</div>
										<div class="modal-footer" style="padding: 30px;">
											<a href="#" class="btn btn-dark" data-dismiss="modal">닫기</a>
										</div>
									</div>
								</div>
							</div>

							<!-- ================================================= -->
							<!-- 검색바 끝 -->
							<!-- ================================================= -->

							<!-- ================================================= -->
							<!-- 게시판 시작 -->
							<!-- ================================================= -->
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="profManageListModal" tabindex="-1"
				role="dialog" aria-labelledby="profManageListModalLabel"
				aria-hidden="true" style="display: none;">
				<div class="modal-dialog modal-mid" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="profManageListModalLabel">
								<strong>사용자등록</strong>
							</h5>
							<a href="#" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</a>
						</div>
						<div class="modal-body">

							<div class="card-body">
								<!-- <table class="table table-hover"> -->


								<div class="form-group">


									<div class="input-group mb-1" style="width: 430px;">
										<div class="input-group-prepend be-addon">
											<button tabindex="-1" type="button" class="btn btn-secondary">파일선택</button>
										</div>
										<input type="text" class="form-control" disabled="">
										<button type="button" class="btn btn-lg btn-primary">등록</button>
									</div>


								</div>



							</div>
						</div>
						<div class="modal-footer" style="padding: 30px;">
							<a href="#" class="btn btn-dark" data-dismiss="modal">닫기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">

						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">학번</th>
									<th scope="col">분과대학</th>
									<th scope="col">학과</th>
									<th scope="col">이름</th>
									<th scope="col">학년</th>
									<th scope="col">생년월일</th>
									<th scope="col">연락처</th>
									<th scope="col">이메일</th>
									<th scope="col">학적상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${smpList}" var="staffStumanage">
									<tr>
										<td><input type="checkbox"></td>
										<td>${staffStumanage.profCd}</td>
										<td>123</td>
										<td>국문학과</td>
										<td>박건영</td>
										<td>3</td>
										<td>999999</td>
										<td>010-1234-5678</td>
										<td>abc@gmail.com</td>
										<td>재학</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- ================================================= -->
			<!-- 게시판 끝 -->
			<!-- ================================================= -->

			<!-- ================================================= -->
			<!-- 등록 버튼 시작 -->
			<!-- ================================================= -->



			<!-- ================================================= -->
			<!-- 등록 버튼 끝 -->
			<!-- ================================================= -->

			<!-- ================================================= -->
			<!-- 페이지네이션 시작 -->
			<!-- ================================================= -->
			<div class="row justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">«</span> <span
								class="sr-only">Previous</span>
						</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">»</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>
				</nav>
			</div>
			<!-- ================================================= -->
			<!-- 페이지네이션 끝 -->
			<!-- ================================================= -->


			<!-- ================================================= -->
			<!-- 카드바디 끝 -->
			<!-- ================================================= -->



			<!-- ================================================= -->
			<!-- 카드 끝 -->
			<!-- ================================================= -->








			<!-- ================================================= -->
			<!-- MAIN-CONTENT 끝 -->
			<!-- ================================================= -->
		</div>
		<div class="tab-pane fade" id="pills-contact" role="tabpanel"
			aria-labelledby="pills-contact-tab">
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">

						<!-- ================================================= -->
						<!-- 카드바디 시작 -->
						<!-- ================================================= -->
						<div class="card-body">
							<!-- ================================================= -->
							<!-- 검색바 시작 -->
							<!-- ================================================= -->
							<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="col-md-3 mb-3">
									<label for="country">분과대학</label> <select
										class="custom-select d-block w-100" id="country" required="">
										<option value="">선택</option>
										<option>인문대학</option>
									</select>
									<div class="invalid-feedback">분과대학을 선택하세요</div>
								</div>
								<div class="col-md-3 mb-3">
									<label for="state">학과(부)</label> <select
										class="custom-select d-block w-100" id="state" required="">
										<option value="">선택</option>
										<option>아시아언어문명학부</option>
									</select>
									<div class="invalid-feedback">학과(부)를 선택하세요</div>
								</div>
								<div class="col-md-2 mb-3" style="margin-top: 8px;">
									<label for="state"></label> <span class="input-group-append"
										style="height: 38px;">
										<button class="btn btn-primary" type="button" id="searchBtn"
											onclick="list_go(1);">검색</button>
									</span>
								</div>
								<div class="col-md-4 mb-3">
									<label for="state">키워드 검색</label>
									<div class="input-group">
										<input class="form-control" type="text" name="keyword"
											placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
											class="input-group-append">
											<button class="btn btn-primary btn-sm" type="button"
												id="searchBtn" onclick="list_go(1);">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>

							<div class="row justify-content-end mr-4">
								<!-- <a href="파일 경로/파일이름.확장자" download><button class="btn btn-secondary active">양식 다운로드</button></a>
	            <a href="#" class="btn btn-primary active" data-toggle="modal" data-target="#staffManageListModal">사용자등록</a> -->
								<button class="btn btn-primary active float-right"
									style="margin-right: 20px;"
									onclick="OpenWindow('<%=request.getContextPath()%>/staff/stuManage/registForm','등록',1650,850)">사용자등록</button>
							</div>
							<div class="modal fade" id="staffManageListModal" tabindex="-1"
								role="dialog" aria-labelledby="staffManageListModalLabel"
								aria-hidden="true" style="display: none;">
								<div class="modal-dialog modal-mid" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staffManageListModalLabel">
												<strong>사용자등록</strong>
											</h5>
											<a href="#" class="close" data-dismiss="modal"
												aria-label="Close"> <span aria-hidden="true">×</span>
											</a>
										</div>
										<div class="modal-body">

											<div class="card-body">
												<!-- <table class="table table-hover"> -->

												<div class="form-group" style="padding-top: 37px;">
													<div class="card card-outline card-success">
														<div class="card-header">
															<h5 style="display: inline; line-height: 40px;">첨부파일
																:</h5>
															&nbsp;&nbsp;
															<button class="btn btn-xs btn-primary"
																onclick="addFile_go();" type="button" id="addFileBtn">파일추가
															</button>
														</div>
														<div class="card-footer fileInput"></div>
													</div>
												</div>


											</div>
										</div>
										<div class="modal-footer" style="padding: 30px;">
											<a href="#" class="btn btn-dark" data-dismiss="modal">닫기</a>
										</div>
									</div>
								</div>
							</div>

							<!-- ================================================= -->
							<!-- 검색바 끝 -->
							<!-- ================================================= -->

							<!-- ================================================= -->
							<!-- 게시판 시작 -->
							<!-- ================================================= -->
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="staffManageListModal" tabindex="-1"
				role="dialog" aria-labelledby="staffManageListModalLabel"
				aria-hidden="true" style="display: none;">
				<div class="modal-dialog modal-mid" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staffManageListModalLabel">
								<strong>사용자등록</strong>
							</h5>
							<a href="#" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</a>
						</div>
						<div class="modal-body">

							<div class="card-body">
								<!-- <table class="table table-hover"> -->


								<div class="form-group">


									<div class="input-group mb-1" style="width: 430px;">
										<div class="input-group-prepend be-addon">
											<button tabindex="-1" type="button" class="btn btn-secondary">파일선택</button>
										</div>
										<input type="text" class="form-control" disabled="">
										<button type="button" class="btn btn-lg btn-primary">등록</button>
									</div>


								</div>



							</div>
						</div>
						<div class="modal-footer" style="padding: 30px;">
							<a href="#" class="btn btn-dark" data-dismiss="modal">닫기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">

						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">학번</th>
									<th scope="col">분과대학</th>
									<th scope="col">학과</th>
									<th scope="col">이름</th>
									<th scope="col">학년</th>
									<th scope="col">생년월일</th>
									<th scope="col">연락처</th>
									<th scope="col">이메일</th>
									<th scope="col">학적상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>123</td>
									<td>123</td>
									<td>국문학과</td>
									<td>박건영</td>
									<td>3</td>
									<td>950123</td>
									<td>010-1234-5678</td>
									<td>abc@gmail.com</td>
									<td>재학</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- ================================================= -->
			<!-- 게시판 끝 -->
			<!-- ================================================= -->

			<!-- ================================================= -->
			<!-- 등록 버튼 시작 -->
			<!-- ================================================= -->



			<!-- ================================================= -->
			<!-- 등록 버튼 끝 -->
			<!-- ================================================= -->

			<!-- ================================================= -->
			<!-- 페이지네이션 시작 -->
			<!-- ================================================= -->
			<div class="row justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">«</span> <span
								class="sr-only">Previous</span>
						</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">»</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>
				</nav>
			</div>
			<!-- ================================================= -->
			<!-- 페이지네이션 끝 -->
			<!-- ================================================= -->


			<!-- ================================================= -->
			<!-- 카드바디 끝 -->
			<!-- ================================================= -->



			<!-- ================================================= -->
			<!-- 카드 끝 -->
			<!-- ================================================= -->








			<!-- ================================================= -->
			<!-- MAIN-CONTENT 끝 -->
			<!-- ================================================= -->
		</div>
	</div>
</div>

<%-- <div class="card-footer">
<%@ include file="/WEB-INF/views/include/pagination.jsp" %>
</div> --%>

<script>
	var dataNum = 0;

	function addFile_go() {
		//alert("click add btn");

		if ($('input[name="uploadFile"]').length >= 5) {
			alert("파일추가는 5개까지만 가능합니다.");
			return;
		}

		var div = $('<div>').addClass("inputRow").attr("data-no", dataNum).css(
				"padding-top", "20px");
		var input = $('<input>').attr({
			"type" : "file",
			"name" : "uploadFile"
		}).css("display", "inline");

		var button = "<button onclick='remove_go("
				+ dataNum
				+ ");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>";

		div.append(input).append(button);
		$('.fileInput').append(div);

		dataNum++;
	}

	function remove_go(dataNum) {
		$('div[data-no="' + dataNum + '"]').remove();
	}
</script>

<script>
	function list_go(page, url) {
		//alert(page);
		if (!url)
			url = "list.do";
		var jobForm = $('#jobForm');

		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='perPageNum']").val(10);
		jobForm.find("[name='searchType']").val(
				$('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val(
				$('div.input-group>input[name="keyword"]').val());
		jobForm.attr({
			action : url,
			method : 'get'
		}).submit();
	}
</script>