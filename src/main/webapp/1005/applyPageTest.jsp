<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">
	<div class="row">
		<div class="col-xl-8 pr-2 pl-0">


			<div class="card">
				<div class="card-header tab-regular">
					<ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active show"
							id="card-tab-1" data-toggle="tab" href="#card-1" role="tab"
							aria-controls="card-1" aria-selected="true">전체강의</a></li>
						<li class="nav-item"><a class="nav-link" id="card-tab-2"
							data-toggle="tab" href="#card-2" role="tab"
							aria-controls="card-2" aria-selected="false">신청강의</a></li>

					</ul>
				</div>
				<div class="card-body">
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade active show" id="card-1" role="tabpanel"
							aria-labelledby="card-tab-1">
							<div class="card">
								<div class="card-body">
									<table class="table table">
										<tr>



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

									<table class="table table-hover">
										<thead>
											<tr>
												<th>강의번호</th>
												<th>현재인원</th>
												<th>최대인원</th>
												<th>일자</th>
												<th>신청</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list }" varStatus="status">
												<tr class="allList">
													<!-- 													times={list.lecDate1} -->
													<td style="width: 10%">${list.lecCd }</td>
													<td num-id="${list.lecCd}" style="width: 10%">${list.stuNum}</td>
													<td style="width: 10%">${sylList[status.index].maxStuNum}</td>
													<td style="width: 10%" class="lecTimes">${sylList[status.index].lecDate1 },${sylList[status.index].lecDate2 }</td>



													<td style="width: 10%">
														<button type="button"
															class="btn-sm btn btn-space btn-primary"
															data-bs-toggle="button" autocomplete="off" title=""
															id="${list.lecCd}" num-id="${list.lecCd}">신청</button>
													</td>
												</tr>
											</c:forEach>



										</tbody>
									</table>


								</div>

							</div>
						</div>


						<div class="tab-pane fade" id="card-2" role="tabpanel"
							aria-labelledby="card-tab-2">


							<div class="card">
								<div class="card-header">
									<table>
										<thead>
											<tr>
												<th><h4>신청결과</h4></th>
												<th><h6>13 / 24점 (신청학점/신청가능학점)</h6></th>
											</tr>
										</thead>
									</table>
								</div>
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
										<!-- 								<tbody> -->
										<!-- 									<tr> -->
										<!-- 										<td>2</td> -->
										<!-- 										<td>상담심리학</td> -->
										<!-- 										<td>2</td> -->
										<!-- 										<td>교양선택</td> -->
										<!-- 										<td>이상권</td> -->
										<!-- 										<td> -->
										<!-- 											<button type="button" class="btn btn-secondary" -->
										<!-- 												data-toggle="popover" title="">취소</button> -->
										<!-- 										</td> -->
										<!-- 									</tr> -->
										<!-- 								</tbody> -->





									</table>
								</div>
							</div>



						</div>

					</div>
				</div>
			</div>


			<!-- ================================================= -->
			<!-- 본문 1 -->
			<!-- ================================================= -->

			<!-- ================================================= -->
			<!-- ================================================= -->

			<!-- ================================================= -->

			<!-- ================================================= -->


		</div>
		<div class="col-xl-4 pl-2 pr-0">
			<div class="card" style="display: inline-block; position: relative;">

				<canvas id="grid" width="600" height="700"
					style="vertical-align: top; z-index: 3"></canvas>
				<canvas id="outline" width="600" height="700"
					style="position: absolute; left: 0; top: 0; z-index: 2;"></canvas>

			</div>
		</div>
		<!-- ================================================= -->
		<!-- MAIN-CONTENT 끝 -->
		<!-- ================================================= -->
	</div>
</div>
<script>
$(function(){
	
var webSocket = new WebSocket("ws://192.168.141.15/<%=request.getContextPath()%>/ws-lectureApply");
	
	webSocket.onmessage = function(e){
		
		var splitData = e.data.split(":");
		var lecId = splitData[0];
		console.log(lecId);
		var applicatns = splitData[1];
		
		$("td[num-id=" +"'" +lecId+"'" +"]").text(applicatns);
		

	}


var applyBtns = document.querySelectorAll('button[data-bs-toggle="button"]');

for (var i = 0; i < applyBtns.length; i++) {
	
	applyBtns[i].addEventListener("click",function(e){
		
		var lectureId = $(this).attr('id')
		
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>
	/stu/lec/apply",
					data : 'lecCd=' + lectureId,
					success : function() {

					},
					error : function() {

					}
				});

			});

		}

	})
</script>
<script>
<!-- Javascript -->
// 	const grid = document.getElementById('grid');
// 	const outline = document.getElementById('outline');
// 	const gridCtx = grid.getContext("2d");
// 	const outlinegridCtx = outline.getContext("2d");

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(0, 50);
// 	gridCtx.lineTo(700, 50);
// 	gridCtx.stroke();

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(0, 131);
// 	gridCtx.lineTo(700, 131);
// 	gridCtx.stroke();

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(0, 212);
// 	gridCtx.lineTo(700, 212);
// 	gridCtx.stroke();

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(0, 293);
// 	gridCtx.lineTo(700, 293);
// 	gridCtx.stroke();

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(0, 374);
// 	gridCtx.lineTo(700, 374);
// 	gridCtx.stroke();

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(0, 455);
// 	gridCtx.lineTo(700, 455);
// 	gridCtx.stroke();

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(0, 536);
// 	gridCtx.lineTo(700, 536);
// 	gridCtx.stroke();

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(0, 617);
// 	gridCtx.lineTo(700, 617);
// 	gridCtx.stroke();

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(0, 698);
// 	gridCtx.lineTo(700, 698);
// 	gridCtx.stroke();

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(50, 50);
// 	gridCtx.lineTo(50, 700);
// 	gridCtx.stroke();

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(180, 50);
// 	gridCtx.lineTo(180, 700);
// 	gridCtx.stroke();

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(310, 50);
// 	gridCtx.lineTo(310, 700);
// 	gridCtx.stroke();

// 	gridCtx.beginPath();
// 	gridCtx.moveTo(440, 50);
// 	gridCtx.lineTo(440, 700);
// 	gridCtx.stroke();
// 	gridCtx.beginPath();
// 	gridCtx.moveTo(570, 50);
// 	gridCtx.lineTo(570, 700);
// 	gridCtx.stroke();
// 	gridCtx.beginPath();
// 	gridCtx.moveTo(440, 50);
// 	gridCtx.lineTo(440, 700);
// 	gridCtx.stroke();
// 	gridCtx.beginPath();
// 	gridCtx.moveTo(700, 50);
// 	gridCtx.lineTo(700, 700);
// 	gridCtx.stroke();

// 	$('.allList').mouseover(function() {
// 		console.log(this);
// 		// 			for (var i = 0; i < array.length; i++) {sdfsdf
// 		// 			outlinegridCtx.strokeRect(100,100,100,100);
// 		// 			}
// 	}).mouseout(function() {
// 		outlinegridCtx.clearRect(0, 0, 700, 700);
// 	});
</script>

<script>
	
</script>
