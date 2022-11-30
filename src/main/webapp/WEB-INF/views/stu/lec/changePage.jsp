<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="card">
	<div class="card-body">
		<div class="main-content-jsp">

			<!-- ================================================= -->
			<!-- 본문 1 -->
			<!-- ================================================= -->
			<div class="row">
				<div class="card-body">
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="user-avatar-info">
								<!--  <div class="float-right"><a href="#" class="user-avatar-email text-secondary">www.henrybarbara.com</a></div> -->
								<div class="user-avatar-address">
									<div class="card">
										<div class="card-body">
											<table class="table table-hover">
												<tr>

													<th><center>
															<div class="form-group row">
																<label class="col-3 col-lg-3 col-form-label text-right">년도</label>
																<div class="col-6">
																	<select class="form-control form-control-sm">
																		<option>2022</option>
																		<option>2021</option>
																		<option>2020</option>
																		<option>2019</option>
																	</select>
																</div>
															</div></th>

													<th><center>
															<div class="form-group row">
																<label class="col-3 col-lg-3 col-form-label text-right">학기</label>
																<div class="col-6">
																	<select class="form-control form-control-sm">
																		<option>1</option>
																		<option>2</option>

																	</select>
																</div>
															</div></th>

													<th><center>
															<div class="form-group row">
																<label class="col-3 col-lg-3 col-form-label text-right">단과</label>
																<div class="col-8">
																	<select class="form-control form-control-sm">
																		<option>인문사회</option>
																		<option>자연과학</option>
																		<option>공과대학</option>
																		<option>경영대학</option>
																	</select>
																</div>
															</div></th>
													<th><center>
															<div class="form-group row">
																<label class="col-3 col-lg-3 col-form-label text-right">전공</label>
																<div class="col-7">
																	<select class="form-control form-control-sm">
																		<option>경영학과</option>
																		<option>수학과</option>
																		<option>언론정보학과</option>
																		<option>원예학과</option>
																	</select>
																</div>
															</div></th>
													<th><center>
															<div class="form-group row">
																<label class="col-3 col-lg-3 col-form-label text-right">이수</label>
																<div class="col-6">
																	<select class="form-control form-control-sm">
																		<option>전공필수</option>
																		<option>전공선택</option>
																		<option>교양필수</option>
																		<option>교양선택</option>
																	</select>
																</div>
															</div></th>

												</tr>
											</table>
											<div class="card">
												<div class="card-body">
													<table class="table table-hover">
														<thead>
															<tr>
																<th>강의번호</th>
																<th>학년</th>
																<th>교과목명</th>
																<th>이수구분</th>
																<th>학점</th>
																<th>교수명</th>
																<th>강의시간</th>
																<th>제한인원</th>
																<th>신청</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td style="width: 15%">2022001</td>
																<td style="width: 10%">2</td>
																<td style="width: 15%">문화인류학</td>
																<td style="width: 10%">교양</td>
																<td style="width: 10%">2</td>
																<td style="width: 10%">김밥이</td>
																<td style="width: 10%">월1,수2</td>
																<td style="width: 10%">1/20</td>
																<td style="width: 10%">
																	<button type="button" class="btn btn-space btn-primary"
																		data-toggle="popover" title="">신청</button>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
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
			<!-- 본문1 끝 -->
			<!-- ================================================= -->

			<!-- ================================================= -->
			<!-- 본문 2 -->
			<!-- ================================================= -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<h4 class="card-header">변경결과</h4>
						<div class="card-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="width: 10%">신청가능학점</th>
										<th style="width: 10%">신청완료학점</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>13</td>
										<td>23</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- ================================================= -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<div class="card-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="width: 10%">학년</th>
										<th style="width: 20%">교과목명</th>
										<th style="width: 10%">학점</th>
										<th style="width: 20%">이수구분</th>
										<th style="width: 15%">교수명</th>
										<th style="width: 20%">신청취소</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2</td>
										<td>상담심리학</td>
										<td>2</td>
										<td>교양선택</td>
										<td>이상권</td>
										<td>
											<button type="button" class="btn btn-secondary"
												data-toggle="popover" title="">취소</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- ================================================= -->


		</div>
	</div>
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->