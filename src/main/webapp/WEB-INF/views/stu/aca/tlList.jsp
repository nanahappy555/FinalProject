<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>

var pageHead = parent.document.querySelector("#pageHeaderSpan");
pageHead.setAttribute("murl",'${webPath}/stu/aca/tl/applyPage');
pageHead.innerHTML="휴/복학신청";
</script>



<!-- ================================================= -->
<div class="main-content-jsp">
	<!-- ================================================= -->
	<div class="card">
		<div class="card-body">


			<!-- ================================================= -->
			<!-- 본문 1 -->
			<!-- ================================================= -->

			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<h3 class="card-header" style="font-weight: bold;">학생정보</h3>

						<div class="card-body">
							<table class="table table-hover">
								<thead>
									<tr style="background-color:rgba(102,178,255,0.2)">
										<th>학번</th>
										<th>이름</th>
										<th>학년</th>
										<th>학기</th>
										<th>입학일자</th>
										

									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${student.stuCd}</td>
										<td>${student.name}</td>
										<td>${student.grade}</td>
										<td>${student.stuSemester }</td>
										<td><fmt:formatDate pattern="yyyy/MM/dd"
												value="${student.admDate}" /></td>
										
									</tr>
								</tbody>
								<thead>
									<tr style="background-color:rgba(102,178,255,0.2)">
										<th>휴학신청횟수/잔여횟수</th>
										<th>연락처</th>
										<th>이메일</th>
										<th>분과대학</th>
										<th>학과</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${student.tlTryCount}회 / 8회</td>
										<td>${fn:substring(student.phone,0,3)}-${fn:substring(student.phone,4,8)}-${fn:substring(student.phone,9,13)}</td>
										<td>${student.email}</td>
										<td>${stuColMajor.colName}</td>
										<td>${stuColMajor.firMajName}</td>
										
									</tr>
								</tbody>

							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- ================================================= -->
			<!-- 본문1 끝 -->
			<!-- ================================================= -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<h3 class="card-header" style="font-weight: bold;">학적 변동 신청사항 입력</h3>
						<div class="card-body border-top" style="padding:10px 5px 0px 5px;">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-5">
								<div class="tab-regular">
									<ul class="nav nav-tabs " id="myTab" role="tablist">
										<li class="nav-item"><a class="nav-link active"
											id="home-tab" data-toggle="tab" href="#home" role="tab"
											aria-controls="home" aria-selected="true">휴학</a></li>

										<li class="nav-item"><a class="nav-link" id="profile-tab"
											data-toggle="tab" href="#profile" role="tab"
											aria-controls="profile" aria-selected="false">복학</a></li>
									</ul>
									<div class="tab-content" id="myTabContent" style="padding:7px;">
										<div class="tab-pane fade show active" id="home"
											role="tabpanel" aria-labelledby="home-tab">

											<div class="row">
												<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
													<div class="card">
														<div class="card-body" style="padding: 10px 5px 5px 10px;">
															<div>
															<p> * 휴학 신청은 한 번 신청할 때 최대 3년까지 가능합니다. &#09; &#09; 재학 기간 동안 휴학은 총 최대 8학기까지 가능합니다.</p>
														    </div>
															<table class="table table-hover">
																<thead>
																	<tr style="background-color:rgba(102,178,255,0.2)">
																		<th style="width: 25%">휴학시작년도</th>
																		<th style="width: 25%">휴학시작학기</th>
																		<th style="width: 25%">휴학분류</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<c:if test="${semester.scSemester eq '02'}">
																			<td id="tlAppYear">${semester.scYear+1}</td>
																		</c:if>										            						           				 
																		<c:if test="${semester.scSemester eq '01'}">
																			<td id="tlAppYear">${semester.scYear}</td>
																		</c:if>
																		<c:if test="${semester.scSemester eq '02'}">
																			<td id="tlAppSeme">01학기</td>
																		</c:if>
																		<c:if test="${semester.scSemester eq '01'}">
																			<td id="tlAppSeme">02학기</td>
																		</c:if>

																		<td>
																		<center>
																			<div class="form-group">
																					<select style="width: 30%"
																						class="form-control form-control-sm" name="tlClassCd">
																						<option value="">선택</option>
																						<c:forEach items="${tlClassReasonList}" var="tlClass">
																							<option value="${tlClass.commCdVal}">${tlClass.commCdName}</option>
																						</c:forEach>
																					</select>
																			</div>
																		</td>
																	</tr>
																</tbody>
																<thead>
																	<tr style="background-color:rgba(102,178,255,0.2)">
																		<th>예상복학년도</th>
																		<th>예상복학학기</th>
																		<th>기타 휴학사유</th>
																	</tr>
																</thead>	
																<tbody>
																	<tr>
																		<td>
																		<center>
																			<div class="form-group">
																			<select name="backYear" class="form-control form-control-sm" style="width: 30%">
																				<c:if test="${semester.scSemester eq '02'}">
																					<option value="${semester.scYear+1}">${semester.scYear+1}</option>
																					<option value="${semester.scYear+2}">${semester.scYear+2}</option>
																					<option value="${semester.scYear+3}">${semester.scYear+3}</option>
																				</c:if>										            						           				
																				<c:if test="${semester.scSemester eq '01'}">
																					<option value="${semester.scYear+1}">${semester.scYear+1}</option>
																					<option value="${semester.scYear+2}">${semester.scYear+2}</option>
																					<option value="${semester.scYear+3}">${semester.scYear+3}</option>
																				</c:if>
																			</select>
																			</div>	
																		<td>
																		<center>
																			<select name="backSeme" class="form-control form-control-sm" style="width: 30%">
																				<option value="01">01학기</option>
																				<option value="02">02학기</option>
																			</select>
																		</td>
																		<td><textarea class="form-control" id="tlReason" rows="2"></textarea></td>
																	</tr>
																</tbody>
																<tbody>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<div class="card-body border-top" style="padding: 10px 5px 5px 10px;">
												<div class="form-group">
													<h4 style="font-weight: bold;">첨부파일</h4>

													<div class="form-group">
														<div class="card card-outline card-success">
															<div class="card-header">
																<h5 class="ml-3"
																	style="display: inline; line-height: 40px;">
																	<strong>파일첨부 </strong>
																</h5>
																<button class="btn btn-xs btn-light"
																	apply-type="tl" onclick="addFile_go(event);" type="button">+</button>
																<span>&nbsp;&nbsp; 군 휴학의 경우 입영통지서가 필요합니다.(사진/스캔) &nbsp;&nbsp; 질병 휴학의 경우 질병 증빙 서류를 제출해야합니다.	</span>														
																
																
															</div>
															<div class="card-footer" id="tlfileInput"></div>
														</div>
														<div class="row justify-content-end">
															<button type="button" class="btn-ml btn btn-primary mr-5"
																apply-type="tl" onclick="tlApply()">신청</button>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="tab-pane fade" id="profile" role="tabpanel"
											aria-labelledby="profile-tab">

											<div class="row">
												<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
													<div class="card">
														<div class="card-body" style="padding:10px 5px 5px 5px;">
															<table class="table table-hover">
																<thead>
																	<tr style="background-color:rgba(102,178,255,0.2)">
																		<th style="width: 25%">복학년도</th>
																		<th style="width: 25%">복학학기</th>
																		<th style="width: 25%">복학사유</th>
																	</tr>
																</thead>

																<tbody>
																	<tr>
																		<td><center>
																			<div class="form-group">
																			<select name="backApplyYear" class="form-control form-control-sm" style="width: 30%">
																					<option value="${semester.scYear+1}">${semester.scYear+1}</option>
																					<option value="${semester.scYear+2}">${semester.scYear+2}</option>
																					<option value="${semester.scYear+3}">${semester.scYear+3}</option>
																			</select>
																			</div>
																		</td>
																		<td><center>
																				<div class="form-group">
																					<select style="width: 35%"
																						name="backApplySeme" class="form-control form-control-sm">
																						<option value="01">1학기</option>
																						<option value="02">2학기</option>
																					</select>
																				</div>
																	   </td>
																		<td>
																			<textarea class="form-control" rows="1" name="backReason"></textarea>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="card card-outline card-success">
													<div class="card-header">
														<h5 class="ml-3"
															style="display: inline; line-height: 40px;">
															<strong>파일첨부 </strong>
														</h5>
														&nbsp;&nbsp;
														<button class="btn btn-xs btn-light"
															apply-type="back" onclick="addFile_go(event);" type="button">+</button>
													</div>
													<div class="card-footer" id="backfileInput"></div>
												</div>
											</div>
											<div class="row justify-content-end">
												<button type="button" apply-type="back" class="btn-ml btn btn-primary mr-5"
													onclick="backApply()">신청</button>
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
			<!-- 본문 2 -->
			<!-- ================================================= -->

			<!-- ================================================= -->
			<!-- 본문2 끝 -->
			<!-- ================================================= -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<h3 class="card-header" style="font-weight: bold;">학적변동 신청내역</h3>

						<div class="card-body">
							<table class="table table-hover">
								<thead>
									<tr style="background-color:rgba(102,178,255,0.2)">
										<th>신청일자</th>
										<th>구분</th>
										<th>상태</th>
										<th>반려 사유</th>
										<th>신청 취소</th>
									</tr>
								</thead>
								<tbody id="tlApplyList">
									<c:forEach items="${tlList}" var="vo">
										<tr>
											<td style="width: 20%"><fmt:formatDate
													value="${vo.applyDate}" pattern="yyyy-MM-dd" /></td>
											<td>${vo.tlClassCd }</td>
											<td>${vo.applyStatusCd}</td>
											<td>${vo.rejContent}</td>
											<td><button class="btn btn-rounded btn-danger" onclick="tlCancel(${vo.tlApplySeq})">취소</button></td>
										</tr>
									</c:forEach>
										<c:forEach items="${backList}" var="vo">
										<tr>
											<td style="width: 20%"><fmt:formatDate
													value="${vo.applyDate}" pattern="yyyy-MM-dd" /></td>
											<td>${vo.acaClassCd }</td>
											 <c:choose>
										            <c:when test="${vo.applyStatusCd eq '승인'}">
										         	 	 <td style="width : 20%; color:#64CD3C;" >${vo.applyStatusCd }</td>
										            </c:when>
										            <c:when test="${vo.applyStatusCd eq '반려'}">
										         	 	 <td style="width : 20%; color:#FF6464;" >${vo.applyStatusCd }</td>
										            </c:when>
										            <c:otherwise>
										         	 	 <td style="width : 20%; " >${vo.applyStatusCd }</td>
										            </c:otherwise>
									            	</c:choose>
											  <td title="${vo.rejContent}">${vo.rejContent}</td>
											
											  <c:choose>
										            <c:when test="${vo.applyStatusCd eq '진행중'}">
											            <td style="width : 20%"><button class="btn btn-rounded btn-danger" onclick="backCancel(${vo.acaChangeSeq})">취소</button></td>
										            </c:when>
										            <c:otherwise>
										            	<td style="width : 20%"> </td>
										            </c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- ================================================= -->
		<!-- MAIN-CONTENT 끝 -->
		<!-- ================================================= -->
	</div>
</div>


<script>
window.onload=function(){
	
	$('#tlfileInput, #backfileInput').on('change','input[type="file"]',function(event){
		//alert(this.files[0].size);
		if(this.files[0].size>1024*1024*40){
 			alert("파일 용량이 40MB를 초과하였습니다.");
 			this.click();
 			this.value="";	 					
 			return false;
 		} 
	});
}	

</script>
<script>
function printData(dataArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(dataArr);	
	target.html(html);
}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>

<script  type="text/x-handlebars-template"  id="tlapplylist-template">
	{{#each tlList}}
<tr>
	<td style="width: 20%">{{applyDateString}}</td>
	<td>{{tlClassCd }}</td>
	<td class='applySts'>{{applyStatusCd}}</td>
	<td>{{rejContent}}</td>
	<td><button class="btn btn-rounded btn-danger" onclick="tlCancel({{tlApplySeq}})">취소</button></td>
</tr>

	{{/each}}
	{{#each backList}}
<tr>
	<td style="width: 20%">{{applyDateString}}</td>
	<td>{{acaClassCd }}</td>
	<td class='applySts'>{{applyStatusCd}}</td>
	<td>{{rejContent}}</td>
	<td><button class="btn btn-rounded btn-danger" onclick="backCancel({{vo.acaChangeSeq}})">취소</button></td>
</tr>

	{{/each}}
</script>


<script>
var tlDataNum = 0;
var backDataNum=0;

function addFile_go(e) {
	//alert("click add btn");
	var apply_type = e.currentTarget.getAttribute("apply-type");
	
	if(apply_type=="tl"){
		if ($('.tlUploadFile').length >= 3) {
			alert("파일추가는 3개까지만 가능합니다.");
			return;
		}
	}else if(apply_type=="back"){
		if ($('.backUploadFile').length >= 3) {
			alert("파일추가는 3개까지만 가능합니다.");
			return;
		}
	}
	
	
	var div = $('<div>').addClass("inputRow").css(
			"padding-top", "20px");
	var input = $('<input>').attr({
		"type" : "file",
		"name" : "uploadFile",
	}).css("display", "inline");
	
	
	if(apply_type=="tl"){
		div.attr("data-no",tlDataNum).attr("apply-type","tl");
		input.attr("class","tlUploadFile");
		var button = "<button onclick='remove_go("
			+ tlDataNum
			+ ");' style='border:0;outline:0;' class='badge-danger' apply-type='tl' type='button'>X</button>";
		
		div.append(input).append(button);
		$('#tlfileInput').append(div);
		
		tlDataNum++;
	}else if(apply_type=="back"){
		div.attr("data-no",backDataNum).attr("apply-type","back");
		input.attr("class","backUploadFile");
		var button = "<button onclick='remove_go("
			+ backDataNum
			+ ");' style='border:0;outline:0;' class='badge-danger' apply-type='back' type='button'>X</button>";
		div.append(input).append(button);
		$('#backfileInput').append(div);
		backDataNum++;
	}
	
}

function remove_go(dataNum) {
	var apply_type = event.currentTarget.getAttribute("apply-type");
	if(apply_type=="tl"){
		$('div[apply-type="tl"][data-no="' + dataNum + '"]').remove();
	}else if(apply_type=="back"){
		$('div[apply-type="back"][data-no="' + dataNum + '"]').remove();
	}
}


function tlApply(){
	var tlAppYear = $('#tlAppYear').text();
	var tlAppSeme = $('#tlAppSeme').text().substr(0,2);
	var tlClassCd = $('select[name="tlClassCd"]').val();
	var backYear = $('select[name="backYear"]').val();
	var backSeme = $('select[name="backSeme"]').val();
	var tlReason = $('#tlReason').val();
	
	if(!tlClassCd){
		alert("휴학 사유를 선택해주세요.");
		return
	}
	if(tlClassCd=='etc'&&!tlReason){
		alert("기타 휴학 사유를 입력해주세요.")
		return
	}
	var uploadFileList = $('input[name="uploadFile"][class="tlUploadFile"]');
	if(tlClassCd=='arm'&&uploadFileList.length==0){
		alert("입영 통지서를 첨부해주세요.")
		return
	}
	if(tlClassCd=="sick"&&uploadFileList.length==0){
		alert("질병 증빙 서류를 첨부해주세요.")
		return
	}
	
	
	var formData = new FormData();
	formData.append("tlAppYear",tlAppYear);
	formData.append("tlAppSeme",tlAppSeme);
	formData.append("tlClassCd",tlClassCd);
	formData.append("backYear",backYear);
	formData.append("backSeme",backSeme);
	formData.append("tlReason",tlReason);
	for(var i=0;i<uploadFileList.length;i++){
		formData.append("uploadFile",uploadFileList[i].files[0]);
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/stu/aca/tl/apply",
		method:"post",
		contentType : false,
		processData : false,
		data:formData,
		dataType:"json",
		success:function(data){
			location.reload()
			alert("신청이 완료되었습니다.");
		},
		error:function(){
			alert("실패")
		}
	})
}

function backApply(){
	var backApplyYear = $('select[name="backApplyYear"]').val()
	var backApplySeme = $('select[name="backApplySeme"]').val()
	var backReason = $('textarea[name="backReason"]').val()
	var uploadFileList = $('input[name="uploadFile"][class="backUploadFile"]');
	var formData = new FormData();
	formData.append("backApplyYear",backApplyYear);
	formData.append("backApplySeme",backApplySeme);
	formData.append("backReason",backReason);
	for(var i=0;i<uploadFileList.length;i++){
		formData.append("uploadFile",uploadFileList[i].files[0]);
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/stu/aca/back/apply",
		method:"post",
		contentType : false,
		processData : false,
		data:formData,
		dataType:"json",
		success:function(data){
			location.reload()
			alert("신청이 완료되었습니다.");
		},error:function(){
			alert("실패")
		}
		
		
	})
}

function tlCancel(tlApplySeq){
	var cancelFlag = confirm('신청을 취소하시겠습니까?');
	if(!cancelFlag){
		return;
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/stu/aca/tl/cancel",
		method:"post",
		data:{"tlApplySeq":tlApplySeq},
		dataType:"json",
		success:function(data){
			location.reload();
			alert("정상적으로 취소되었습니다.");
		},error:function(){
			alert("실패")
		}
	})
}

function backCancel(acaChangeSeq){
	var cancelFlag = confirm('신청을 취소하시겠습니까?');
	if(!cancelFlag){
		return;
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/stu/aca/back/cancel",
		method:"post",
		data:{"acaChangeSeq":acaChangeSeq},
		dataType:"json",
		success:function(data){
			location.reload();
			alert("정상적으로 취소되었습니다.");
		},error:function(){
			alert("실패");
		}
	})
}
</script>